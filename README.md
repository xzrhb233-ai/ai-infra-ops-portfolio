# AI Infrastructure & Operations Portfolio

基于 RTX 4070 / Windows / WSL 的 8 周学习作品集。当前阶段：Day 1 仓库结构与环境基线；后续实验尚未执行，不代表生产经验或已部署服务。

## 从这里开始

1. 阅读 [环境基线](environment-baseline.md)，注意 Windows 与 WSL 的 CUDA Toolkit 版本不同。
2. 阅读 [项目范围与成本红线](SCOPE-AND-COST.md)。当前不创建任何付费云资源。
3. 按 [任务列表与看板规范](ISSUE-BOARD.md) 推进；每项完成必须链接实际证据。

## 目录

| 目录 | 用途 |
| --- | --- |
| `local-gpu/` | 本地 CUDA、容器 GPU、基准与指标采集 |
| `eks/` | Kubernetes / EKS GPU 平台与可观测性 |
| `slurm/` | ParallelCluster、Slurm 作业与 NCCL |
| `llm/` | 单 GPU 小模型推理、压测与恢复 |
| `runbooks/` | Linux、GPU、调度与服务故障排查 |
| `evidence/` | 命令输出、配置、日志、截图、结果、成本及清理证据 |

## 计划成果（尚未实现）

- GPU Observability：EKS + GPU Operator + DCGM + Prometheus/Grafana。
- Slurm GPU Cluster：弹性 GPU 作业与 NCCL 测量。
- LLM Inference：单 GPU 小模型服务、性能报告与故障恢复。
- 至少 7 份有实际证据的 Runbook，以及可复现部署、验证和销毁说明。

本次仅初始化目录、基线和计划；不安装软件、不部署集群、不执行后续八周实验。参考用户提供的《AI Infrastructure & Operations 8 周实战总体计划书》v1.0（2026-09-04）；文档中的后续动作不是本次执行授权。
