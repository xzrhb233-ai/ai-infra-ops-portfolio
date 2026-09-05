# 本地 GPU

## 容器 GPU 运行时（W1 D3，已完成）

- 安装方式：WSL2 Ubuntu 24.04 内直接装 Docker Engine（`docker-ce`，非 Docker Desktop）+ NVIDIA Container
  Toolkit，脚本见 [scripts/install-docker-and-nvidia-toolkit.sh](scripts/install-docker-and-nvidia-toolkit.sh)。
- 验证结果与解读：[evidence/docker-gpu-success.txt](../evidence/docker-gpu-success.txt) ——
  不加 `--gpus all` 时容器完全看不到 `nvidia-smi`；加了之后容器内驱动/GPU 信息与宿主机
  [environment-baseline.md](../environment-baseline.md) 完全一致。
- 已知点：宿主机当前有 9091MiB/12282MiB 显存被占用，Day 4 CUDA 基准需要把这部分基线扣除/记录。

## CUDA 可复现基准（W1 D4，已完成）

- 三个自包含 CUDA C 程序（`vector_add`、`block_reduce_sum`、naive tiled `sgemm` + cuBLAS 对比），
  纯 `nvcc` 编译不依赖 PyTorch，源码见 [benchmarks/](benchmarks/)，`make && ./run_all.sh` 一键复现。
- 结果、3 次重复的均值/波动解释、GPU 利用率采样的局限性说明：[benchmark.md](benchmark.md)。
- 全部正确性检查 PASS；`vector_add`/`block_reduce_sum` 达到理论显存带宽 ~90%；naive SGEMM 比 cuBLAS
  慢 10-16 倍（预期内，作为手写 kernel 的基线参考）。

计划中尚未完成：GPU 指标支持矩阵（Day 5）、负载与监控关联时间序列（Day 6）。
