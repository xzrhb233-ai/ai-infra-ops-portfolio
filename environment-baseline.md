# 环境基线

采集日期：2026-09-04（America/Chicago）。原始命令输出见 [证据](evidence/environment-commands.txt)。

| 组件 | 实测结果 | 验证命令 |
| --- | --- | --- |
| GPU | NVIDIA GeForce RTX 4070；12282 MiB；WDDM | `nvidia-smi --query-gpu=name,memory.total,driver_version --format=csv` |
| Windows | Windows 11 Home；10.0.26200；完整版本 10.0.26200.9168 | `Get-CimInstance Win32_OperatingSystem`、`wsl --version` |
| NVIDIA 驱动 | 610.47 | `nvidia-smi` 的驱动字段 |
| WSL | 2.6.1.0；内核 6.6.87.2-1 | `wsl --version` |
| Linux 发行版 | Ubuntu 24.04.1 LTS，WSL 2 | `wsl --list --verbose`、`cat /etc/os-release` |
| Windows CUDA Toolkit | release 13.3，V13.3.33 | Windows `nvcc --version` |
| WSL CUDA Toolkit | release 12.0，V12.0.140 | WSL `nvcc --version` |
| Windows Git | 2.51.0.windows.2 | Windows `git --version` |
| WSL Git | 2.43.0 | WSL `git --version` |
| Windows Docker | PATH 中未找到；标准 Docker Desktop CLI 路径不存在 | `Get-Command docker`、`Test-Path` |
| WSL Docker | `docker: not found` | WSL `docker --version` |

Docker 版本暂不可记录；这不是已安装或运行通过的声明，也不能排除其他自定义安装位置。后续任务需安装或定位 Docker，再验证 daemon、NVIDIA Container Toolkit 和容器 GPU。

`nvidia-smi` 显示的 CUDA UMD 13.3 不等同于所有环境中已安装的 Toolkit；实际编译器版本以各环境 `nvcc --version` 为准。

**更新（W1 D4）**：WSL 内实际有两套 CUDA Toolkit 共存——`/usr/bin/nvcc`（release 12.0.140，来自 apt `nvidia-cuda-toolkit` 包，`PATH` 默认解析到这个）和 `/usr/local/cuda-13.3/bin/nvcc`（release 13.3.73，与 Windows 侧版本一致，含 `libcublas` 开发库）。[local-gpu/benchmarks/](local-gpu/benchmarks/) 的基准全部显式使用 `/usr/local/cuda-13.3/bin/nvcc` 编译，避免版本歧义。WSL GPU 计算、容器 GPU 已验证（见 [Day 3 证据](evidence/docker-gpu-success.txt)），CUDA 基准见 [local-gpu/benchmark.md](local-gpu/benchmark.md)。
