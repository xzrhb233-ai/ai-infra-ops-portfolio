# Week 1 周总结：本地 GPU 与 Linux 基线

**周期**：2026-09-04 - 2026-09-07（Day 1-7）
**发布**：`v0.2-local-gpu`
**云资源支出**：US$0（全程本地 WSL2 实验，未创建任何 AWS 资源）

## 本周做了什么

| Day | 内容 | 关键产出 |
| --- | --- | --- |
| 1 | 仓库结构、环境基线、成本红线 | [environment-baseline.md](environment-baseline.md)，`v0.1-baseline` |
| 2 | Linux/网络诊断速查表 | [runbooks/linux-network-triage.md](runbooks/linux-network-triage.md) |
| 3 | Docker Engine + NVIDIA Container Toolkit，容器 GPU 验证 | [evidence/docker-gpu-success.txt](evidence/docker-gpu-success.txt) |
| 4 | 三个自包含 CUDA 基准（vector_add/reduce/sgemm） | [local-gpu/benchmark.md](local-gpu/benchmark.md) |
| 5 | GPU 指标采集：DCGM 试错 + nvidia-smi 逐字段验证 | [local-gpu/metrics-support-matrix.md](local-gpu/metrics-support-matrix.md) |
| 6 | 空闲/负载/冷却 18 分钟时间序列 | [local-gpu/analysis.md](local-gpu/analysis.md)，[evidence/local-gpu-timeseries.png](evidence/local-gpu-timeseries.png) |
| 7 | 周验收、真实故障复现、清理、发布 | [runbooks/incident-01-docker-gpu-passthrough.md](runbooks/incident-01-docker-gpu-passthrough.md) |

## 本周做到了什么（对应计划书的"周末阶段验收"）

- 在自己的 RTX 4070/WSL2 环境中验证了 GPU、CUDA 与容器运行链路，包括有/无 `--gpus all` 的真实差异。
- 能够用 Linux 与网络命令定位进程、端口、DNS、磁盘和内存问题（虽然本机缺 `dig`/`nslookup`/`traceroute`，
  已记录并用替代命令绕过）。
- 建立了第一套可复现的 GPU 负载、指标采集与性能基线，并且诚实标注了工具本身的局限（DCGM 不可用、
  `fan.speed` 不可信、采样链路有规律性停顿）。

## 周验收：从空目录复现

用 `git clone` 拉了一份全新副本（不是本地工作区），验证 [README.md](README.md) 里的关键命令：

- `local-gpu/benchmarks/`：`make clean && make all` 全部重新编译成功（`vector_add`、`block_reduce_sum`、
  `sgemm`、`sustained_load` 四个二进制），跑起来正确性检查全部 PASS，数值和之前的记录量级一致
  （`vector_add` 0.433ms/465GB/s，和 Day 4/5 的 0.43-0.44ms 一致）。
- Docker GPU 直通：重新复现了"不加 `--gpus all` 失败、加了成功"，见新增的
  [故障记录 01](runbooks/incident-01-docker-gpu-passthrough.md)，报错信息和 Day 3 完全一致，确认这个故障
  和修复是稳定可复现的，不是一次性巧合。

结论：README 里的关键命令在全新 clone 出来的副本上可以直接复制执行，符合验收标准。

## 故障记录

**故障记录 01**：容器缺少 `--gpus all` 导致 `nvidia-smi` 可执行文件在容器内不存在（不是权限/驱动问题）。
完整症状-根因-修复-预防见 [runbooks/incident-01-docker-gpu-passthrough.md](runbooks/incident-01-docker-gpu-passthrough.md)。

（Day 3-6 的过程中还记录了多个"未完全查明根因"的异常——DCGM 在本机采不到指标、`fan.speed` 恒为 0、
采集链路规律性停顿——这些按各自文档里的原话保留为"已知局限"，不单独升级成故障记录，因为它们不是
"预期行为被破坏"，而是"工具/环境本身的能力边界"。）

## 清理

- Docker：`docker ps -a` 确认无残留容器；删除了确认不可用的 `dcgm-exporter` 镜像，释放 2.3GB
  （保留 `nvidia/cuda` base 镜像和 `hello-world`，后续还会用到）。
- 无云资源：本周未创建任何 AWS 资源，[evidence/cost-log.csv](evidence/cost-log.csv) 保持空表头，
  实际支出 US$0。

## 仓库健康检查

- 最大文件是 155KB 的 PNG，`.git` 总大小 458KB，没有大体积镜像或权重文件。
- 全仓库扫描未发现 AWS key、HuggingFace token、私钥或明文密码模式。
- 编译产物（`vector_add`/`block_reduce_sum`/`sgemm`/`sustained_load` 二进制）已在 `.gitignore` 排除，
  仓库里只有源码和跑出来的原始 CSV/日志/图片。

## 下周（Week 2：AWS 单机 GPU 与成本安全）预告

把本地实验迁移到 AWS，重点是证明"能够安全创建、使用和彻底清理 GPU 资源"，而不是单纯跑通一次。
需要先做：根账户 MFA、IAM 日常身份、预算告警（25/50/80/100%）、成本硬上限（建议 US$150）。
