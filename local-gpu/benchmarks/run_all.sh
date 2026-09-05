#!/bin/bash
# Builds and runs the three Day 4 CUDA benchmarks, sampling nvidia-smi
# concurrently so GPU utilization/memory are captured alongside timing.
set -euo pipefail
cd "$(dirname "$0")"
RESULTS_DIR="results"
mkdir -p "$RESULTS_DIR"
STAMP=$(date +%Y%m%dT%H%M%S)

make clean >/dev/null
make all

run_with_gpu_sampling() {
  local name="$1"; shift
  local sample_log="$RESULTS_DIR/${name}-nvidia-smi-${STAMP}.csv"
  nvidia-smi --query-gpu=timestamp,utilization.gpu,memory.used,temperature.gpu \
    --format=csv -lms 200 > "$sample_log" &
  local sampler_pid=$!
  "$@" | tee "$RESULTS_DIR/${name}-${STAMP}.csv"
  local rc=${PIPESTATUS[0]}
  sleep 0.3 # let the sampler catch the tail end of the run
  kill "$sampler_pid" 2>/dev/null || true
  wait "$sampler_pid" 2>/dev/null || true
  echo "[$name] gpu sampling -> $sample_log"
  return $rc
}

echo "== vector_add =="
run_with_gpu_sampling vector_add ./vector_add 16777216 3

echo "== block_reduce_sum =="
run_with_gpu_sampling block_reduce_sum ./block_reduce_sum 16777216 3

echo "== sgemm (1024) =="
run_with_gpu_sampling sgemm ./sgemm 1024 3

echo "Done. Raw CSV/logs in $RESULTS_DIR/"
