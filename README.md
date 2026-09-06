# AI Infrastructure & Operations Portfolio

基于 RTX 4070 / Windows / WSL2 的 8 周实战作品集。当前进度：**Week 1（本地 GPU 与 Linux 基线）Day 1-7 已完成**，
即将发布 `v0.2-local-gpu`。所有结果都是在这台机器上实测得到的，不支持/跑不通的地方在对应文档里明确标注为
"不支持"或"未验证"，不用 0 或模拟数据代替。

## 从这里开始

1. 阅读 [环境基线](environment-baseline.md)——Windows 与 WSL 的 CUDA Toolkit 版本不同，WSL 内还同时存在
   两套 nvcc（12.0 和 13.3）。
2. 阅读 [项目范围与成本红线](SCOPE-AND-COST.md)。当前仅本地实验，未创建任何付费云资源。
3. 按 [任务列表与看板规范](ISSUE-BOARD.md) 看整体进度。

## 关键命令（另一台装了 WSL2 + NVIDIA 驱动的机器上应该能直接跑）

```bash
git clone https://github.com/xzrhb233-ai/ai-infra-ops-portfolio.git
cd ai-infra-ops-portfolio

# 1. 装 Docker Engine + NVIDIA Container Toolkit（会有几次 sudo 密码提示）
bash local-gpu/scripts/install-docker-and-nvidia-toolkit.sh

# 2. 验证容器能不能拿到 GPU —— 故意不加 --gpus all 会失败，这是预期行为，见故障记录 01
docker run --rm nvidia/cuda:12.4.1-base-ubuntu22.04 nvidia-smi            # 预期失败
docker run --rm --gpus all nvidia/cuda:12.4.1-base-ubuntu22.04 nvidia-smi # 预期成功

# 3. 编译并跑 CUDA 基准（vector_add / block_reduce_sum / sgemm）
cd local-gpu/benchmarks && make all && ./run_all.sh && cd ../..

# 4. 采集一段 GPU 指标（DCGM Exporter 在消费卡+WSL2 上不可用，见 metrics-support-matrix.md）
bash local-gpu/metrics/sample-gpu-metrics.sh 1 30 /tmp/gpu-metrics-smoke.csv
```

## 目录

| 目录 | 用途 | 本周内容 |
| --- | --- | --- |
| `local-gpu/` | 本地 CUDA、容器 GPU、基准与指标采集 | CUDA 基准、指标支持矩阵、负载时间序列，见 [local-gpu/README.md](local-gpu/README.md) |
| `eks/` | Kubernetes / EKS GPU 平台与可观测性 | 尚未开始（Week 3-4） |
| `slurm/` | ParallelCluster、Slurm 作业与 NCCL | 尚未开始（Week 6） |
| `llm/` | 单 GPU 小模型推理、压测与恢复 | 尚未开始（Week 7） |
| `runbooks/` | Linux、GPU、调度与服务故障排查 | Linux/网络诊断速查表 + 故障记录 01（容器 GPU 直通） |
| `evidence/` | 命令输出、配置、日志、截图、结果、成本及清理证据 | 见 [evidence/README.md](evidence/README.md) 索引 |

## Week 1 完成情况

详见 [ISSUE-BOARD.md](ISSUE-BOARD.md) 和 [local-gpu/README.md](local-gpu/README.md)，简要说结果：

- **环境基线**：RTX 4070、驱动 610.47、WSL2 Ubuntu 24.04、双 CUDA 工具链共存（12.0 + 13.3）。
- **Linux/网络诊断**：[runbooks/linux-network-triage.md](runbooks/linux-network-triage.md)，本机缺
  `dig`/`nslookup`/`traceroute`，如实记录而非跳过。
- **容器 GPU**：Docker Engine（非 Docker Desktop）+ NVIDIA Container Toolkit，验证过有/无
  `--gpus all` 的真实差异，见 [故障记录 01](runbooks/incident-01-docker-gpu-passthrough.md)。
- **CUDA 基准**：三个纯 `nvcc` 编译程序，正确性全部 PASS，`vector_add`/`block_reduce_sum` 达到理论带宽
  ~90%，见 [local-gpu/benchmark.md](local-gpu/benchmark.md)。
- **GPU 指标**：DCGM Exporter 在本机不可用（DCP 模块加载失败），改用 `nvidia-smi` 轮询，逐字段验证支持性，
  `fan.speed` 被判定为不可信而非"支持"，见 [local-gpu/metrics-support-matrix.md](local-gpu/metrics-support-matrix.md)。
- **负载时间序列**：18 分钟空闲→负载→冷却全过程，发现采集链路本身有规律性的采样停顿（监控盲区），见
  [local-gpu/analysis.md](local-gpu/analysis.md)。

## 计划成果（后续 7 周，尚未实现）

- GPU Observability：EKS + GPU Operator + DCGM + Prometheus/Grafana。
- Slurm GPU Cluster：弹性 GPU 作业与 NCCL 测量。
- LLM Inference：单 GPU 小模型服务、性能报告与故障恢复。
- 至少 7 份有实际证据的 Runbook（目前 2 份），以及可复现部署、验证和销毁说明。

参考用户提供的《AI Infrastructure & Operations 8 周实战总体计划书》v1.0（2026-09-04）。
