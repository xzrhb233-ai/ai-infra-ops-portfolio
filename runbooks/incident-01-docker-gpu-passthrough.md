# 故障记录 01：容器里看不到 GPU（缺少 `--gpus all`）

**采集日期**：2026-09-07（W1 D7 周验收，故意复现的受控故障）
**状态**：已复现、已修复、已验证

## 症状

在 WSL2 Ubuntu 上，用官方 `nvidia/cuda` 镜像跑 `nvidia-smi` 直接失败退出，容器完全起不来：

```
$ docker run --rm nvidia/cuda:12.4.1-base-ubuntu22.04 nvidia-smi
docker: Error response from daemon: failed to create task for container: failed to create shim task:
OCI runtime create failed: runc create failed: unable to start container process: error during container init:
exec: "nvidia-smi": executable file not found in $PATH

Run 'docker run --help' for more information
```

## 影响

任何依赖容器内 GPU 的工作（本仓库 Day 3 的 GPU 直通验证、后续 Week 4 的 EKS GPU workload）都无法启动；
不是"变慢"或"降级"，是容器直接创建失败，退出码非 0。

## 前置条件

- Docker Engine + NVIDIA Container Toolkit 已按 [local-gpu/scripts/install-docker-and-nvidia-toolkit.sh](../local-gpu/scripts/install-docker-and-nvidia-toolkit.sh) 装好（Day 3）。
- 宿主机 `nvidia-smi` 本身工作正常（能看到 RTX 4070，见 [environment-baseline.md](../environment-baseline.md)）。

## 证据

- 失败命令：`docker run --rm nvidia/cuda:12.4.1-base-ubuntu22.04 nvidia-smi`（**没有** `--gpus all`）。
- 报错关键字：`exec: "nvidia-smi": executable file not found in $PATH`——注意这不是权限错误，也不是驱动版本
  不兼容，而是容器文件系统里根本没有 `nvidia-smi` 这个可执行文件。
- 完整对比（失败 vs. 修复后成功）见 [evidence/docker-gpu-success.txt](../evidence/docker-gpu-success.txt)。

## 诊断步骤

1. 看报错信息：`exec: "nvidia-smi": executable file not found` → 这是"文件不存在"类错误，不是运行时崩溃或
   权限拒绝，说明问题出在**容器里到底有没有这个文件**，而不是运行时配置错误。
2. 确认 `nvidia/cuda` base 镜像本身不打包 `nvidia-smi`（查看镜像内容可验证：这个工具属于驱动包，不是
   CUDA runtime 的一部分）。
3. 回想 GPU 直通的机制：`nvidia-smi`、`libnvidia-ml.so` 等驱动侧文件是由 **NVIDIA Container Runtime**
   在容器启动时按需从宿主机挂载进容器的，触发条件是 `docker run` 带上 `--gpus` 参数（或旧版的
   `--runtime=nvidia` + `NVIDIA_VISIBLE_DEVICES`）。没有这个参数，`nvidia-ctk` 配置的 hook 根本不会执行，
   容器看到的就是一个没有任何 NVIDIA 组件的普通 Ubuntu 文件系统。

## 根因

命令缺少 `--gpus all`（或等价的 `--gpus device=...`）参数，NVIDIA Container Runtime 的挂载 hook 没有被
触发，容器内没有 GPU 驱动侧的可执行文件和库，导致 `nvidia-smi` 这个二进制文件本身就不存在。

## 最小修复

```bash
docker run --rm --gpus all nvidia/cuda:12.4.1-base-ubuntu22.04 nvidia-smi
```

## 验证

```
Sat Sep  5 06:01:02 2026
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 610.43.02              KMD Version: 610.47        CUDA UMD Version: 13.3     |
...
|   0  NVIDIA GeForce RTX 4070        On  |   00000000:01:00.0  On |                  N/A |
+-----------------------------------------------------------------------------------------+
```
容器内读到的驱动版本（610.43.02/KMD 610.47）和 GPU 型号与宿主机基线完全一致，确认修复生效。
本次（Day 7）用同一个镜像和参数重新跑了一遍，结果一致，退出码 0，说明这个修复是稳定可复现的。

## 预防

- 仓库里所有需要 GPU 的 `docker run` 示例都必须显式带 `--gpus all`（或未来 Kubernetes 里的
  `resources.limits: {nvidia.com/gpu: 1}`），不要假设"装了 NVIDIA Container Toolkit 就自动生效"。
- 排查这类问题时先看报错是"文件不存在"还是"权限/驱动不兼容"——前者大概率是忘了加 GPU 直通参数，
  后者才需要去查驱动/CUDA 版本兼容性，两者的排查路径完全不同，混淆会浪费时间。

## 成本与清理

纯本地 WSL2 容器操作，无云资源、无常驻成本；镜像 `nvidia/cuda:12.4.1-base-ubuntu22.04` 已存在于本地
Docker 缓存（Day 3 拉取），本次未产生新的常驻容器（`--rm` 已在运行后自动清理）。
