#!/bin/bash
# W1 D6: continuous GPU metric sampling across three phases —
# idle baseline (5 min) -> sustained CUDA load (10 min) -> cool-down (3 min).
# Writes one continuous CSV plus a phase-boundary marker file so the
# analysis/plotting step can shade idle vs. load without guessing from
# clock values alone.
set -uo pipefail
cd "$(dirname "$0")"

IDLE_BEFORE_S=300
LOAD_S=600
IDLE_AFTER_S=180
INTERVAL=2
STAMP=$(date +%Y%m%dT%H%M%S)
OUT="results/timeseries-${STAMP}.csv"
MARKERS="results/timeseries-${STAMP}-phases.txt"
mkdir -p results

FIELDS="timestamp,utilization.gpu,utilization.memory,memory.used,temperature.gpu,power.draw,clocks.sm,pstate"
echo "$FIELDS" > "$OUT"

sample_loop() {
  local end=$1
  while [ "$(date +%s)" -lt "$end" ]; do
    nvidia-smi --query-gpu="$FIELDS" --format=csv,noheader >> "$OUT"
    sleep "$INTERVAL"
  done
}

NOW=$(date +%s)
echo "t0=$NOW" > "$MARKERS"

echo "== phase 1/3: idle baseline (${IDLE_BEFORE_S}s) =="
sample_loop $((NOW + IDLE_BEFORE_S))

LOAD_START=$(date +%s)
echo "load_start=$LOAD_START" >> "$MARKERS"
echo "== phase 2/3: sustained load (${LOAD_S}s) =="
../benchmarks/sustained_load 2048 "$LOAD_S" 2>> "$MARKERS" &
LOAD_PID=$!
sample_loop $((LOAD_START + LOAD_S))
wait "$LOAD_PID" 2>/dev/null

LOAD_END=$(date +%s)
echo "load_end=$LOAD_END" >> "$MARKERS"
echo "== phase 3/3: cool-down (${IDLE_AFTER_S}s) =="
sample_loop $((LOAD_END + IDLE_AFTER_S))

echo "done=$(date +%s)" >> "$MARKERS"
echo "Wrote $OUT and $MARKERS"
