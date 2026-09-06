#!/usr/bin/env python3
"""W1 D6: render the idle -> load -> cool-down GPU timeseries as a PNG.

Usage: plot_timeseries.py <timeseries.csv> <phases.txt> <output.png>

Requires matplotlib (not part of this repo's runtime deps — install into a
throwaway venv just to render the chart, e.g.:
  uv venv /tmp/plot-env && source /tmp/plot-env/bin/activate
  uv pip install matplotlib
"""
import csv
import sys

import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt  # noqa: E402


def parse_phases(path):
    markers = {}
    known = {"t0", "load_start", "load_end", "done"}
    with open(path) as f:
        for line in f:
            line = line.strip()
            if "=" in line:
                k, v = line.split("=", 1)
                if k in known and v.strip().isdigit():
                    markers[k] = int(v)
    return markers


def parse_field(value, unit_suffix=None):
    value = value.strip()
    if value in ("N/A", "[N/A]", ""):
        return None
    if unit_suffix and value.endswith(unit_suffix):
        value = value[: -len(unit_suffix)].strip()
    return float(value)


def load_csv(path):
    rows = []
    with open(path) as f:
        reader = csv.reader(f)
        header = next(reader)
        for r in reader:
            if len(r) < len(header):
                continue
            rows.append(r)
    return rows


def main():
    csv_path, phases_path, out_path = sys.argv[1], sys.argv[2], sys.argv[3]
    markers = parse_phases(phases_path)
    rows = load_csv(csv_path)

    import time as _time

    def to_epoch(ts):
        # nvidia-smi CSV timestamp format: "2026/09/06 17:08:32.090"
        ts = ts.strip()
        base, frac = (ts.split(".") + ["0"])[:2]
        t = _time.strptime(base, "%Y/%m/%d %H:%M:%S")
        return _time.mktime(t) + float("0." + frac)

    t0 = to_epoch(rows[0][0])
    t_min, util_gpu, util_mem, mem_used, temp, power = [], [], [], [], [], []
    for r in rows:
        ts, ug, um, mu, tp, pw, clk, pst = r[:8]
        tsec = to_epoch(ts) - t0
        t_min.append(tsec / 60.0)
        ug_v = parse_field(ug, "%")
        um_v = parse_field(um, "%")
        mu_v = parse_field(mu, "MiB")
        tp_v = parse_field(tp)
        pw_v = parse_field(pw, "W")
        util_gpu.append(ug_v)
        util_mem.append(um_v)
        mem_used.append(mu_v)
        temp.append(tp_v)
        power.append(pw_v)

    load_start_min = (markers["load_start"] - markers["t0"]) / 60.0
    load_end_min = (markers["load_end"] - markers["t0"]) / 60.0

    # Detect the actual ramp-up/ramp-down transitions from the data instead of
    # assuming a fixed window: find the first sample >=90% util at/after
    # load_start (ramp-up complete), and the first sample <=20% util at/after
    # load_end (ramp-down complete / back to idle).
    def first_at_or_after(min_time, threshold, above):
        for tm, u in zip(t_min, util_gpu):
            if tm < min_time or u is None:
                continue
            if (above and u >= threshold) or (not above and u <= threshold):
                return tm
        return min_time

    ramp_up_min = first_at_or_after(load_start_min, 90, True)
    idle_resume_min = first_at_or_after(load_end_min, 20, False)

    fig, axes = plt.subplots(4, 1, figsize=(11, 10), sharex=True)
    panels = [
        (axes[0], util_gpu, "GPU utilization (%)", "#3b82f6"),
        (axes[1], mem_used, "Memory used (MiB)", "#22c55e"),
        (axes[2], temp, "Temperature (°C)", "#f97316"),
        (axes[3], power, "Power draw (W)", "#a855f7"),
    ]

    for ax, series, label, color in panels:
        ax.plot(t_min, series, color=color, linewidth=1.2)
        ax.set_ylabel(label)
        ax.axvspan(0, load_start_min, color="#94a3b8", alpha=0.12)
        ax.axvspan(load_start_min, ramp_up_min, color="#fde047", alpha=0.25)
        ax.axvspan(ramp_up_min, load_end_min, color="#fca5a5", alpha=0.15)
        ax.axvspan(load_end_min, idle_resume_min, color="#fde047", alpha=0.25)
        ax.axvspan(idle_resume_min, t_min[-1], color="#94a3b8", alpha=0.12)
        ax.axvline(load_start_min, color="#334155", linestyle="--", linewidth=0.8)
        ax.axvline(load_end_min, color="#334155", linestyle="--", linewidth=0.8)
        ax.grid(True, alpha=0.25)

    axes[0].text(load_start_min / 2, axes[0].get_ylim()[1] * 0.85, "idle\n(baseline)",
                 ha="center", fontsize=8)
    axes[0].text((ramp_up_min + load_end_min) / 2, axes[0].get_ylim()[1] * 0.85,
                 "steady\n(sustained load)", ha="center", fontsize=8)
    axes[0].text((idle_resume_min + t_min[-1]) / 2, axes[0].get_ylim()[1] * 0.85,
                 "idle\n(cool-down)", ha="center", fontsize=8)
    axes[0].annotate("startup ramp\n(~%.0fs)" % ((ramp_up_min - load_start_min) * 60),
                      xy=(load_start_min, axes[0].get_ylim()[1] * 0.5),
                      xytext=(load_start_min - 1.5, axes[0].get_ylim()[1] * 0.55),
                      fontsize=7, arrowprops=dict(arrowstyle="->", lw=0.7))
    axes[0].annotate("end ramp-down\n(~%.0fs)" % ((idle_resume_min - load_end_min) * 60),
                      xy=(load_end_min, axes[0].get_ylim()[1] * 0.5),
                      xytext=(load_end_min + 0.3, axes[0].get_ylim()[1] * 0.55),
                      fontsize=7, arrowprops=dict(arrowstyle="->", lw=0.7))

    axes[-1].set_xlabel("Time since sampling start (minutes)")
    fig.suptitle(
        "RTX 4070 / WSL2 — idle → sustained SGEMM load → cool-down\n"
        "(sampled via nvidia-smi --query-gpu every 2s; DCGM Exporter unavailable, see metrics-support-matrix.md)",
        fontsize=10,
    )
    fig.tight_layout(rect=[0, 0, 1, 0.94])
    fig.savefig(out_path, dpi=140)
    print(f"wrote {out_path}")


if __name__ == "__main__":
    main()
