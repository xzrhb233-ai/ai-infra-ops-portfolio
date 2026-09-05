# 本地 GPU

## 容器 GPU 运行时（W1 D3，已完成）

- 安装方式：WSL2 Ubuntu 24.04 内直接装 Docker Engine（`docker-ce`，非 Docker Desktop）+ NVIDIA Container
  Toolkit，脚本见 [scripts/install-docker-and-nvidia-toolkit.sh](scripts/install-docker-and-nvidia-toolkit.sh)。
- 验证结果与解读：[evidence/docker-gpu-success.txt](../evidence/docker-gpu-success.txt) ——
  不加 `--gpus all` 时容器完全看不到 `nvidia-smi`；加了之后容器内驱动/GPU 信息与宿主机
  [environment-baseline.md](../environment-baseline.md) 完全一致。
- 已知点：宿主机当前有 9091MiB/12282MiB 显存被占用，Day 4 CUDA 基准需要把这部分基线扣除/记录。

计划中尚未完成：CUDA 重复基准（Day 4）、GPU 指标支持矩阵（Day 5）、负载与监控关联时间序列（Day 6）。
