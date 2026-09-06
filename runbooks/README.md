# 运维 Runbook

每份 Runbook 包含：症状、影响、前置条件、证据、诊断步骤、根因、最小修复、验证、预防、成本与清理。

## 已验证故障案例

- [incident-01-docker-gpu-passthrough.md](incident-01-docker-gpu-passthrough.md) — 容器缺少 `--gpus all`
  导致 `nvidia-smi` 在容器内不存在（W1 D7，周验收时复现确认可稳定复现）。

## 参考速查表（非故障案例）

- [linux-network-triage.md](linux-network-triage.md) — 进程/资源/端口/DNS 四类问题的命令速查表，用于故障发生前的基线排查能力训练（W1 D2）。
