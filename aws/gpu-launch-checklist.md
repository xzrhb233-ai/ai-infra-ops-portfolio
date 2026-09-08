# Day 11 执行清单：启动单机 GPU 并验证驱动（配额批复后执行）

**前置条件**：Day 9 提交的 `L-DB2E81BA`（us-east-2 On-Demand G/VT vCPU）配额请求状态从 `CASE_OPENED`
变成批准。查状态：
```bash
aws service-quotas get-requested-service-quota-change --region us-east-2 --profile personal-admin \
  --request-id <request-id>
```

## 执行步骤

1. **记录开始时间**（用于计算启动耗时和实际费用）。

2. **限定窗口，启动 GPU 实例**（复用 Day 10 同一套 Terraform 模板，只是切换变量）：
   ```bash
   cd aws/terraform-ec2
   terraform plan -out=tfplan -var="use_gpu_ami=true" -var="instance_type=g6.xlarge"
   # 人工确认：机型正确、AMI 是 GPU 驱动镜像、仍然没有任何 ingress 规则
   terraform apply tfplan
   ```
   机型优先 `g6.xlarge`（当前代 L4，见 [instance-selection.md](instance-selection.md) 里的世代发现）；
   如果 `g6` 家族在下单时遇到容量问题，备选 `g5.xlarge`。

3. **等 SSM Online**：
   ```bash
   aws ssm describe-instance-information --region us-east-2 --profile personal-admin \
     --filters "Key=InstanceIds,Values=<instance-id>"
   ```

4. **跑完整验证**（驱动、PCIe、内核、磁盘、网络、CUDA 容器，一次性通过 SSM 跑完，不用 SSH）：
   ```bash
   bash verify-gpu.sh <instance-id> personal-admin us-east-2
   ```
   预期：`nvidia-smi` 能看到 GPU；`lspci` 能看到 NVIDIA 设备；不带 `--gpus all` 的 docker 命令按
   [故障记录 01](../runbooks/incident-01-docker-gpu-passthrough.md) 的模式失败（这里是预期行为，
   用来确认云端和本地的故障模式一致）；带 `--gpus all` 的成功。

5. **记录启动耗时**：从 `terraform apply` 开始到 `nvidia-smi` 返回正常结果的总耗时。

6. **对照 Day 4 本地基准**（Week 3 会做完整的 local-vs-cloud-benchmark.md，这里只需确认云端能跑同一套
   CUDA 程序）：
   ```bash
   # 通过 SSM 把 local-gpu/benchmarks/*.cu 传上去编译跑，或者直接在验证阶段追加一次 vector_add 测试
   ```

7. **限时结束，立刻销毁**（不管测完了没有，2-3 小时窗口到了就停）：
   ```bash
   terraform destroy
   ```

8. **核对实际费用与配额使用**：
   ```bash
   aws ce get-cost-and-usage --time-period Start=<today>,End=<tomorrow> \
     --granularity DAILY --metrics UnblendedCost --profile personal-admin --region us-east-2
   ```
   （Cost Explorer 数据通常有几小时延迟，记不到当天准确数字很正常，先记预估值，第二天再核对实际值。）

9. **更新记录**：
   - [evidence/cost-log.csv](../evidence/cost-log.csv) 加一行：机型、运行时长、预估/实际费用、清理状态。
   - `aws/instance-selection.md` 或新建 `aws/local-vs-cloud-benchmark.md` 记录本次结果。
   - 如果启动过程中遇到任何真实故障（容量不足、驱动异常等），照 [故障记录 01](../runbooks/incident-01-docker-gpu-passthrough.md) 的模板写一份新的 runbook，不要略过不记。

## 已知会遇到但不算故障的情况

- `docker run --rm nvidia/cuda:... nvidia-smi`（不带 `--gpus all`）**预期失败**——这是用来验证云端和本地
  故障模式一致，不是真的出了故障，不需要额外排查。
