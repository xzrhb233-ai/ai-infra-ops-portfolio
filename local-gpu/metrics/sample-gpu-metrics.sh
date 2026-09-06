#!/bin/bash
# W1 D5 fallback GPU metric collector: continuous nvidia-smi --query-gpu sampling.
# Used because DCGM Exporter's /metrics endpoint returns an empty body on this
# RTX 4070 / WSL2 setup (see ../../local-gpu/metrics-support-matrix.md).
#
# Usage: sample-gpu-metrics.sh [interval_seconds] [duration_seconds] [output_csv]
set -euo pipefail

INTERVAL="${1:-1}"
DURATION="${2:-60}"
OUT="${3:-results/gpu-metrics-$(date +%Y%m%dT%H%M%S).csv}"
mkdir -p "$(dirname "$OUT")"

FIELDS="timestamp,utilization.gpu,utilization.memory,memory.total,memory.used,temperature.gpu,power.draw,clocks.sm,clocks.mem,pstate,fan.speed"
echo "$FIELDS" | tr ',' ',' > "$OUT"
nvidia-smi --query-gpu="$FIELDS" --format=csv,noheader > /dev/null # sanity check fields resolve
echo "$FIELDS" > "$OUT"

END=$((SECONDS + DURATION))
while [ $SECONDS -lt $END ]; do
  nvidia-smi --query-gpu="$FIELDS" --format=csv,noheader >> "$OUT"
  sleep "$INTERVAL"
done

echo "Wrote $(( (SECONDS) / INTERVAL )) samples over ${DURATION}s to $OUT"
