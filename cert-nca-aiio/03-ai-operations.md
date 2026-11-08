# 领域 3：AI Operations（AI 运维，约 22%）

题量最少但和本仓库实战最贴近：看监控、读报错、选调度器、选 GPU 共享方式。
很多题是"给你一个症状，下一步该做什么"。

---

## §3.1 监控工具链

| 工具 | 层级 | 用途 |
| --- | --- | --- |
| **NVML** | 库（C API） | 驱动提供的管理接口，`nvidia-smi`、DCGM 都基于它 |
| **nvidia-smi** | 单机命令行 | 查看状态、改配置（持久模式、功耗上限、MIG、ECC） |
| **DCGM**（Data Center GPU Manager） | 单机/集群 | 健康检查、**主动诊断**、策略告警、作业统计、遥测，面向数据中心 GPU |
| **DCGM Exporter** | Kubernetes / 容器 | 把 DCGM 指标暴露为 **Prometheus** 格式（默认 9400 端口 `/metrics`） |
| **Prometheus** | 监控系统 | 定时**抓取（scrape）**并存储时间序列，告警规则（Alertmanager） |
| **Grafana** | 可视化 | 仪表盘（NVIDIA 提供 DCGM 官方 dashboard） |

本仓库实测：DCGM Exporter 在**消费级 GPU + WSL2** 上能启动但采不到指标（DCP 模块未加载），
见 [metrics-support-matrix.md](../local-gpu/metrics-support-matrix.md)——DCGM 的设计目标是**数据中心 GPU + 裸机 Linux**，这正是考点。

### 常用命令

```bash
nvidia-smi                          # 总览：驱动/CUDA 版本、温度、功耗、显存、进程
nvidia-smi -q                       # 全部详细信息
nvidia-smi -q -d PERFORMANCE        # 时钟降频原因（Clocks Event / Throttle Reasons：温度、功耗、HW slowdown）
nvidia-smi -q -d ECC                # ECC 错误计数
nvidia-smi -q -d ROW_REMAPPER       # 行重映射状态（A100 及以后）
nvidia-smi topo -m                  # GPU/网卡拓扑矩阵
nvidia-smi nvlink -s                # NVLink 状态
nvidia-smi -pm 1                    # 打开持久模式（推荐用 nvidia-persistenced 守护进程）
nvidia-smi -pl 300                  # 设置功耗上限（瓦）
nvidia-smi --query-gpu=utilization.gpu,memory.used,temperature.gpu,power.draw --format=csv -l 1

dcgmi discovery -l                  # 列出 DCGM 看到的 GPU
dcgmi diag -r 1                     # 快速诊断（秒级），作业前冒烟检查
dcgmi diag -r 2                     # 中等（约几分钟）
dcgmi diag -r 3                     # 长诊断（数十分钟级），上线验收 / 故障后深度检查
dcgmi health -c                     # 健康状态
dcgmi stats                         # 作业级 GPU 统计
```

### 关键指标与解读

- **`utilization.gpu`（GPU 利用率）**：采样周期内"有 kernel 在跑"的时间比例。**100% 不代表算力吃满**，
  一个很小的 kernel 一直在跑也是 100%。
- 更准确的利用率：DCGM profiling 指标 **SM Activity（`DCGM_FI_PROF_SM_ACTIVE`）、SM Occupancy、Tensor Core Activity（`DCGM_FI_PROF_PIPE_TENSOR_ACTIVE`）、DRAM Activity**。
- 显存使用、温度、功耗、时钟、PCIe/NVLink 吞吐、ECC 错误、XID 事件、行重映射。
- 本仓库 [analysis.md](../local-gpu/analysis.md) 发现采样链路自身有规律性停顿——**监控系统本身也会有盲区**，告警要考虑采样间隔。

## §3.2 XID 与硬件错误

XID 是驱动在内核日志（`dmesg` / `journalctl -k`）里打出的 GPU 错误编号。

| XID | 含义 | 常见处理 |
| --- | --- | --- |
| 13 / 31 | 图形引擎异常 / MMU 页错误 | 多半是**应用程序 bug**（越界访问），先查代码 |
| 48 | **双比特 ECC 错误（不可纠正）** | 隔离节点，重置 GPU，查行重映射；反复出现则 RMA |
| 63 / 64 | ECC 页退役或行重映射记录事件 / 记录失败 | 63 记录事件，按计划重置；64 需处理 |
| 74 | **NVLink 错误** | 查 NVLink 状态、重置；持续出现检查硬件 |
| 79 | **GPU 从总线上掉了（fallen off the bus）** | 隔离节点，查 PCIe、供电、散热，重启/重新插拔/RMA |
| 92 | 单比特 ECC 错误率过高 | 关注趋势 |
| 94 / 95 | 被隔离的 / 未被隔离的 ECC 错误（A100+） | 94 只影响相关进程；95 需要重置 GPU |

- **ECC**：单比特错误（SBE）可纠正；双比特错误（DBE）不可纠正。
- **Page retirement（页退役）** 是 Volta 及以前的机制；**Row remapping（行重映射）** 是 A100 及以后的机制，通常需要 GPU 重置后生效。
- 标准处理流程：**发现 → 隔离（drain 节点，不再调度新作业）→ 诊断（dcgmi diag）→ 修复/重置/RMA → 验证 → 恢复上线**。

## §3.3 调度与编排：Slurm vs Kubernetes

| | Slurm | Kubernetes |
| --- | --- | --- |
| 出身 | HPC 批处理调度器 | 云原生容器编排 |
| 擅长 | 多节点紧耦合**训练**、gang scheduling、公平共享、队列、优先级、预留 | 长期运行的**推理服务**、自动扩缩容、滚动升级、微服务 |
| 申请 GPU | `--gres=gpu:4` 或 `--gpus=4` | `resources.limits: nvidia.com/gpu: 1` |
| 容器 | **Enroot + Pyxis**（`srun --container-image=...`）、Apptainer/Singularity | 原生 |

### Slurm 命令

| 命令 | 作用 |
| --- | --- |
| `sbatch job.sh` | 提交批处理脚本 |
| `srun` | 运行（交互式或在作业内启动并行任务） |
| `salloc` | 申请资源分配（交互式） |
| `squeue` | 查看作业队列 |
| `sinfo` | 查看分区和节点状态 |
| `scancel <jobid>` | 取消作业 |
| `scontrol show job/node` | 详细信息；`scontrol update nodename=x state=drain reason=...` 隔离节点 |
| `sacct` | 历史作业记账 |

### Kubernetes GPU 生态

- **NVIDIA GPU Operator**：用 Operator 自动部署和管理 GPU 节点需要的全部组件：
  **GPU 驱动（容器化）、NVIDIA Container Toolkit、Device Plugin、GPU Feature Discovery（GFD）、DCGM / DCGM Exporter、MIG Manager**、Node Feature Discovery 等。
- **NVIDIA Device Plugin**：向 kubelet 注册扩展资源 **`nvidia.com/gpu`**，让 Pod 能申请 GPU。
- **GPU Feature Discovery（GFD）**：给节点打标签（GPU 型号、显存、MIG 配置、CUDA 版本），用于 nodeSelector/亲和性调度。
- **NVIDIA Network Operator**：部署 RDMA / GPUDirect RDMA 相关的网络组件（OFED 驱动、SR-IOV 等）。
- **Run:ai**：NVIDIA 收购的 Kubernetes GPU 编排/调度平台（配额、分数 GPU、队列、公平共享）。

### 集群管理

- **Base Command Manager（BCM，原 Bright Cluster Manager）**：裸机部署（provisioning）、OS 镜像、Slurm/Kubernetes 部署、集群监控。
- **NVIDIA Mission Control**：面向"AI 工厂"的运维软件栈（整合 BCM、Run:ai 等，负责集群运行、健康、故障恢复）。
- **Base Command Platform**：（DGX Cloud 上的）作业/数据集/工作区管理 Web 平台。

## §3.4 GPU 共享与虚拟化（高频）

| 方式 | 隔离 | 适用 | 要点 |
| --- | --- | --- | --- |
| **GPU 直通（PCIe passthrough）** | 整卡独占 | 一个 VM 要整张卡、接近裸机性能 | 1 卡 → 1 VM，无法共享 |
| **NVIDIA vGPU** | 时间片 vGPU 或 MIG-backed vGPU | **多个虚拟机**共享 GPU（VMware vSphere 等 hypervisor） | 需要 vGPU 软件和**授权（License）** |
| **MIG（Multi-Instance GPU）** | **硬件级**：独立 SM、L2 缓存、显存、带宽 | 多租户、需要 QoS 和故障隔离（A100/H100/B200 等） | 最多 7 个实例；需先开 MIG 模式（`nvidia-smi -i 0 -mig 1`）并重置 GPU |
| **时间片（Time-slicing）** | **无显存隔离、无故障隔离** | 开发测试、小型推理，充分利用闲置 | K8s device plugin 配置 replicas 即可，任意 GPU 都行 |
| **MPS（Multi-Process Service）** | 有限（可限制 SM 比例，显存隔离弱） | 多个**协作**进程并发跑小 kernel | 提高并发度，一个出错可能影响其他 |

MIG 规格（记 A100 40GB 这一组）：`1g.5gb`（×7）、`2g.10gb`、`3g.20gb`、`4g.20gb`、`7g.40gb`。
80 GB 卡（A100 80GB / H100 80GB）最小为 `1g.10gb`。命令：`nvidia-smi mig -lgip`（列出 GPU 实例规格）、`-cgi` 创建 GPU 实例、`-cci` 创建计算实例。

## §3.5 容器化

- **NVIDIA Container Toolkit**：让 Docker/containerd/CRI-O 容器访问 GPU（`nvidia-ctk runtime configure`）。
- **宿主机只需要 NVIDIA 驱动**；CUDA Toolkit 和库放在容器镜像里。
- `docker run --gpus all ...`：不加 `--gpus`，容器里**既没有 GPU 设备也没有 nvidia-smi**（本仓库 [故障记录 01](../runbooks/incident-01-docker-gpu-passthrough.md) 的真实报错：`exec: "nvidia-smi": executable file not found in $PATH`）。
- **CUDA 兼容性**：驱动向后兼容——新驱动能跑旧 CUDA 版本的应用；容器里的 CUDA **主版本**比驱动支持的新 → 报 "CUDA driver version is insufficient"，解决是**升级宿主机驱动**（数据中心卡也可用 CUDA forward compatibility 包）。在宿主机装更新的 CUDA Toolkit **没用**。
- **NGC 容器**：已调优的框架镜像（`nvcr.io/nvidia/pytorch:YY.MM-py3`），每月发布。
- HPC 场景：**Enroot**（把容器转成非特权沙箱）+ **Pyxis**（Slurm SPANK 插件）；或 Apptainer/Singularity。

## §3.6 故障排查思路（症状 → 下一步）

| 症状 | 首先检查 |
| --- | --- |
| `nvidia-smi` 报 "couldn't communicate with the NVIDIA driver" | 驱动是否加载（`lsmod \| grep nvidia`）、内核升级后驱动模块是否重新编译（DKMS）、Secure Boot |
| 容器里看不到 GPU | `--gpus` 参数、Container Toolkit 运行时配置、K8s 里 device plugin 是否正常 |
| GPU 性能突然变低 | 降频原因（温度/功耗上限）、PCIe 链路宽度/速度降级（`nvidia-smi -q` 里的 Link Width）、ECC、是否有别的进程 |
| 多节点训练很慢 | `NCCL_DEBUG=INFO` 看是否走了 `NET/IB` 还是回退到 `NET/Socket`（TCP）；用 **nccl-tests**（`all_reduce_perf`）测 bus bandwidth |
| GPU 利用率低、CPU iowait 高 | 存储/数据加载瓶颈（见 §2.5） |
| dmesg 出现 XID | 按 §3.2 查表；硬件类错误先 drain 节点 |
| 作业 OOM | batch 太大、模型/KV cache 太大；减小 batch、混合精度、量化、模型并行 |

## §3.7 日常运维流程

- **上线验收（burn-in）**：DCGM 长诊断、NCCL 测试、HPL/压力测试，确认性能达标后再交付用户。
- **生命周期**：驱动、固件（GPU/网卡/BMC）、OS 统一版本基线，滚动升级（先 drain 再升级）。
- **作业前健康检查**：Slurm `Prolog`/`HealthCheckProgram` 里跑 `dcgmi diag -r 1`，有问题自动 drain。
- **容量规划**：看 GPU-hour 使用率、排队时长、利用率分布；闲置资源回收。
- **安全**：最小权限、镜像来源可信（NGC 签名镜像）、多租户隔离（MIG/DPU/网络分区）。
- **成本**：云上不用就销毁（本仓库 [cost-safety.md](../aws/cost-safety.md) 的规矩同样适用于考试里的"成本优化"题）。

---

### 我的补充

- 
