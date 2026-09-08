# 证据索引

- `environment-commands.txt`：本机版本探测原始输出，只采集版本与硬件概要，不包含完整进程清单。
- `linux-network-triage-commands.txt`：W1 D2 进程/资源/端口/DNS 诊断命令的原始输出，对应 [runbooks/linux-network-triage.md](../runbooks/linux-network-triage.md)。
- `docker-gpu-success.txt`：W1 D3 容器 GPU 直通验证（有/无 `--gpus all` 对比），对应 [local-gpu/README.md](../local-gpu/README.md)。
- `dcgm-exporter-attempt.log`：W1 D5 DCGM Exporter 尝试记录（本机不可用的原始日志与判断依据），对应 [local-gpu/metrics-support-matrix.md](../local-gpu/metrics-support-matrix.md)。
- `local-gpu-timeseries.png`：W1 D6 空闲→负载→冷却时间序列图，对应 [local-gpu/analysis.md](../local-gpu/analysis.md)。
- `terraform-destroy-log.txt`：W2 D10 `plan`（无意外入站端口）/`apply`/`destroy` 全流程记录，账户 ID 已脱敏，对应 [aws/terraform-ec2/](../aws/terraform-ec2/)。
- `terraform-ssm-verification.txt`：W2 D10 SSM Session Manager 零开放端口下的真实命令执行验证。
- `cost-log.csv`：成本台账，第一条记录是 W2 D10 的 Terraform CPU 冒烟测试（免费层，已销毁）。台账只记录本项目跑过的实验，不是整个 AWS 账户账单的完整证明。

后续证据标注日期、环境、命令、参数、结果、限制及清理状态。不要提交凭据或大模型文件。
