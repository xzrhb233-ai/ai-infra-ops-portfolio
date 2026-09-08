# Issue board 初始化清单

目标：GitHub Projects `AI Infra Ops Portfolio`，关联 `ai-infra-ops-portfolio`。
状态列：Todo / In Progress / Done。每次只推进一个主要实验。
远程看板：https://github.com/users/xzrhb233-ai/projects/1 。关联仓库：xzrhb233-ai/ai-infra-ops-portfolio。

| 任务 | 初始状态 | 验收条件 |
| --- | --- | --- |
| W1 D1：建立仓库、看板和环境基线 | Done（`v0.1-baseline`） | 六个目录、README、范围红线、原始版本证据、GitHub 仓库与看板均可访问 |
| W1 D2：Linux / 网络诊断速查表 | Done | 能定位进程、端口、DNS、磁盘和内存问题 |
| W1 D3：补齐 Docker 并验证 GPU 容器 | Done | 记录 Docker client/server 与容器运行时；对比有无 `--gpus all` 的真实输出 |
| W1 D4：CUDA 可重复基准 | Done | 误差检查通过，至少三次测量并报告分散程度 |
| W1 D5：GPU 指标采集 | Done | 指标支持矩阵；DCGM 试过并记录不可用原因，改用 nvidia-smi 定时采样 |
| W1 D6：负载时间序列关联 | Done | 空闲/负载/冷却时间序列、异常与监控盲区记录 |
| W1 D7：本地验收与首次发布 | Done（`v0.2-local-gpu`） | 复现、发布 `v0.2-local-gpu` 和证据索引 |
| W2 D8：账户、安全与预算护栏 | Done | root MFA、IAM 日常身份、CLI profile、$150 预算与四级告警均已验证 |
| W2 D9：区域、配额与机型选择 | Done | 目标/备选区域明确；配额为 0 但已提交可追踪的提升请求 |
| W2 D10：Terraform 最小基础设施（CPU 冒烟测试） | Done | init/plan/apply/destroy 干净；SSM 零端口验证；资源已全部销毁 |
| W2 D11-14：AWS 单机 GPU 与成本核对 | Todo | 先确认单次预算，再交付部署、基准和清理证据 |
| W3–4：Kubernetes / EKS GPU 可观测性 | Todo | 调度、监控、告警闭环及销毁步骤 |
| W5：GPU / Kubernetes 故障 Runbook | Todo | 五类受控故障和计时恢复证据 |
| W6：Slurm / NCCL | Todo | 作业生命周期、真实通信测试或明确未执行的实验设计、清理证据 |
| W7：单 GPU LLM 推理 | Todo | 健康请求、三次重复压测、故障恢复和成本 |
| W8：作品集验收 | Todo | 三条主线、至少七份 Runbook、量化结果与证据索引 |

Issue 正文模板：目标；前置条件；执行清单；验收标准；证据链接；费用及清理状态。后续任务入 Todo 不意味着授权启动云实验。

