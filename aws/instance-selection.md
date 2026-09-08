# 区域、配额与机型选择（W2 D9）

## 区域对比

| 区域 | 角色 | G5/G6/G6e 可用性 | On-Demand G/VT vCPU 配额（`L-DB2E81BA`） |
| --- | --- | --- | --- |
| **us-east-2**（俄亥俄） | **目标区域**（和已配置的 CLI 默认 region 一致） | `g5.xlarge`/`g5.2xlarge`/`g6.xlarge`/`g6.2xlarge`/`g6e.xlarge`/`g6e.2xlarge` 全部可下单 | 0 → **已提交提升到 8，见下方配额记录** |
| us-east-1（北弗吉尼亚） | 备选区域 1 | 同上，六种机型全部可下单 | 0（未提交，目标区域配额下来之前的备用选项） |
| us-west-2（俄勒冈） | 备选区域 2 | 同上，六种机型全部可下单 | 0（同上） |

三个区域的机型可用性完全一致，选 us-east-2 作为目标纯粹是因为 CLI profile 已经配在这个区域，减少后续 Terraform/网络配置要来回切换 region 的麻烦。如果 us-east-2 的配额提升长时间不批，会转向 us-east-1 或 us-west-2 重新提交。

## 配额记录

**账户当前状态（W2 D9 采集）**：新账户默认 On-Demand G/VT 实例的 vCPU 配额是 **0**——这意味着在提升之前，
一台 G5/G6/G6e 实例都启动不了，不管余额够不够。三个候选区域实测都是 0，这是账户级新用户限制，不是
某个区域特有的问题。

| 区域 | 配额值（提交前） | 已提交请求 | 期望值 | 状态 |
| --- | --- | --- | --- | --- |
| us-east-2 | 0 | 是 | 8 vCPU | `PENDING`（提交于 W2 D9，request ID 见本地记录，未写入仓库） |
| us-east-1 | 0 | 否 | — | 备用，暂不提交 |
| us-west-2 | 0 | 否 | — | 备用，暂不提交 |

请求 8 vCPU 的原因：单台 `g5.xlarge`/`g6.xlarge`（4 vCPU）够用，留一倍余量方便测 `.2xlarge`（8 vCPU）
规格，不用配额批下来又要再申请一次；同时 8 是一个不起眼的小数字，比起申请几十上百 vCPU，更可能走自动审批
而不是进人工排队。

**如何自己查进度**（不需要在仓库里记账户 ID，本地跑）：
```bash
aws service-quotas list-requested-service-quota-change-history-by-quota \
  --service-code ec2 --quota-code L-DB2E81BA --region us-east-2 \
  --profile personal-admin --query "RequestedQuotas[].{Status:Status,Desired:DesiredValue,Created:Created}"
```

**完成标准判断**：按 Day 9 的验收口径——"配额足够启动至少一台单 GPU 实例，**或**已有可追踪的 quota
request"——当前满足的是后半句。配额批下来之前，Day 10-11 的 Terraform/实例启动步骤会先用免费的 CPU
实例把 IaC 流程走通，不会被这个卡住。

## 机型选择表

实测规格全部来自 `aws ec2 describe-instance-types`（W2 D9 采集，us-east-2），不是文档里的宣传数字。

| 机型 | GPU | GPU 显存 | vCPU | 内存 | 网络 | 本地存储 | 世代 | 本项目用途 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `g5.xlarge` | 1× NVIDIA A10G | 22888 MiB (~22.4 GiB) | 4 | 16 GiB | 最高 10 Gbps | 250 GB NVMe | 上一代 | Day 11 单机 GPU 基线首选——够跑 Day 4 那套 CUDA 基准做云本地对比 |
| `g5.2xlarge` | 1× NVIDIA A10G | 22888 MiB | 8 | 32 GiB | 最高 10 Gbps | 450 GB NVMe | 上一代 | 数据预处理/构建阶段需要更多 vCPU 或内存时的备选，GPU 规格不变 |
| `g6.xlarge` | 1× NVIDIA L4 | 22888 MiB | 4 | 16 GiB | 最高 10 Gbps | 250 GB NVMe | **当前代** | 与 `g5.xlarge` 同价位段的替代项，L4 在推理场景通常比 A10G 更省电/吞吐更好，Week 7 LLM 推理优先考虑 |
| `g6.2xlarge` | 1× NVIDIA L4 | 22888 MiB | 8 | 32 GiB | 最高 10 Gbps | 450 GB NVMe | **当前代** | 同 `g5.2xlarge` 的定位，换成当前代 GPU |
| `g6e.xlarge` | 1× NVIDIA L40S | 45776 MiB (~44.7 GiB) | 4 | 32 GiB | 最高 20 Gbps | 250 GB NVMe | 当前代 | 显存翻倍——如果 Week 7 选的开源模型在 22GB 显存装不下（比如更大的量化模型），升级到这个规格 |
| `g6e.2xlarge` | 1× NVIDIA L40S | 45776 MiB | 8 | 64 GiB | 最高 20 Gbps | 450 GB NVMe | 当前代 | 同上再加倍 vCPU/内存，仅在明确需要时才用，成本比 xlarge 高一倍 |

**一个意外发现**：`describe-instance-types` 返回的 `CurrentGeneration` 字段显示 `g5` 系列已经是
`false`（上一代），只有 `g6`/`g6e` 是 `true`（当前代）——AWS 在 GPU 实例上已经把 G6/G6e（L4/L40S）
当成主推的当前代产品，G5（A10G）虽然还能正常下单，但定位上已经是"legacy"。这个信息文档里没有明写，
是从 API 字段里读出来的，选型时会优先考虑 G6/G6e。

## 停止条件（对齐 [SCOPE-AND-COST.md](../SCOPE-AND-COST.md) 的成本红线）

不管选哪个机型，统一执行：

- **默认最大 1 台 GPU 实例**，不并发起第二台做对比测试。
- **限定实验窗口**（参考计划书 Day 11 的 2-3 小时窗口），窗口结束立即 `stop` 或 `terminate`，不允许"先放着，明天再关"。
- 优先用 SSM 会话连接，不开放公网 SSH（安全组不出现 `0.0.0.0/0` 的 22 端口）。
- 每次启动前确认当天的预算余量（$150 硬上限，[aws/cost-safety.md](cost-safety.md) 里配的四级告警是事后通知，不是硬停，不能替代人工检查）。
- 用完当天在 [evidence/cost-log.csv](../evidence/cost-log.csv) 记一行：日期、机型、运行时长、预估费用、清理状态。
