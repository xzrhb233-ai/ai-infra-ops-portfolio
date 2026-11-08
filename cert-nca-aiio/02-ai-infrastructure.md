# 领域 2：AI Infrastructure（AI 基础设施，约 40%）

这一块考"一台 AI 服务器里有什么、多台之间怎么连、数据从哪来、机房能不能撑住、该放本地还是云上"。
主线是一条数据路径：**存储 → 网络 → 网卡/DPU → PCIe → GPU 显存 → NVLink → 其他 GPU**。

---

## §2.1 计算节点

### PCIe 卡 vs SXM 模组

| | PCIe 卡 | SXM 模组 |
| --- | --- | --- |
| 安装 | 插在标准 PCIe 槽，适合通用服务器 | 焊/扣在 HGX 基板上 |
| GPU 互联 | 走 PCIe，或少量 NVLink bridge（2 卡） | 全部 GPU 通过 **NVSwitch** 全互联 |
| 功耗上限 | 较低（如 H100 PCIe 约 350W） | 更高（H100 SXM 约 700W），性能更高 |
| 场景 | 推理、小规模训练、混合负载 | 大规模训练 |

### 系统形态

- **HGX**：NVIDIA 提供的 GPU 基板平台（4/8 块 SXM GPU + NVSwitch），OEM 厂商（Dell、HPE、Supermicro…）用它造服务器。
- **DGX**：NVIDIA 自家的完整 AI 系统（硬件 + 软件栈 + 支持）。
  - **DGX A100**：8× A100、6 个 NVSwitch、8× 200 Gb/s HDR 计算网卡，约 6.5 kW。
  - **DGX H100**：8× H100 SXM（共 **640 GB** HBM3），4 个 NVSwitch 芯片，8× ConnectX-7（400 Gb/s）计算网卡，最大约 **10.2 kW**。
  - **DGX B200**：8× B200，NVLink 5。
- **GB200 NVL72**：一整个液冷机柜，**36 颗 Grace CPU + 72 颗 Blackwell GPU 在同一个 NVLink 域**，像一块巨大的 GPU。
- **MGX**：给 OEM 的模块化服务器参考设计。
- **NVIDIA-Certified Systems**：OEM 服务器经 NVIDIA 测试认证（性能、管理、安全、网络），可获得 NVIDIA AI Enterprise 支持。

## §2.2 节点内互联

- **PCIe**：Gen4 x16 ≈ 32 GB/s 单向，Gen5 x16 ≈ 64 GB/s 单向（约 128 GB/s 双向）。CPU、网卡、NVMe 和 GPU 都挂在 PCIe 上。
- **NVLink**：GPU↔GPU 高带宽低延迟直连。每 GPU 总带宽：A100 600 GB/s、H100 900 GB/s、B200 1.8 TB/s。
- **NVSwitch**：NVLink 交换芯片，让节点内**所有 GPU 两两全带宽互联**（不需要多跳）。也可以出机箱组成更大的 NVLink 域（NVL72）。
- **NVLink-C2C**：芯片到芯片的一致性互联（Grace↔Hopper / Grace↔Blackwell），900 GB/s。
- **NUMA / PCIe 亲和性**：GPU 和配对网卡最好在同一个 PCIe 交换芯片下，GPUDirect RDMA 才高效。

### `nvidia-smi topo -m` 读法（常考）

| 标记 | 含义 | 速度 |
| --- | --- | --- |
| `NV#` | 通过 # 条 NVLink 直连 | 最快 |
| `PIX` | 最多经过一个 PCIe 交换芯片 | 快 |
| `PXB` | 经过多个 PCIe 交换芯片，但不经过 CPU 主桥 | 中 |
| `PHB` | 经过 PCIe Host Bridge（CPU） | 较慢 |
| `NODE` | 跨同一 NUMA 节点内多个 Host Bridge | 慢 |
| `SYS` | 跨 NUMA 节点（经过 CPU 间的 SMP 互联，如 UPI/xGMI） | **最慢** |

## §2.3 节点间网络

### InfiniBand vs 以太网

| | InfiniBand | 以太网（RoCE v2） |
| --- | --- | --- |
| RDMA | 原生 | RoCE（RDMA over Converged Ethernet） |
| 无损 | **基于信用（credit-based）的链路层流控**，天然无损 | 需配置 **PFC + ECN** 等拥塞控制才能接近无损 |
| 管理 | 需要 **Subnet Manager（SM）** 分配 LID、计算路由（OpenSM 或 UFM） | 标准以太网运维 |
| NVIDIA 产品 | Quantum-2（NDR）/ Quantum-X800（XDR）交换机，ConnectX 网卡，**UFM** 管理 | **Spectrum-X**：Spectrum-4 交换机 + BlueField-3 SuperNIC，自适应路由与拥塞控制 |
| 在网计算 | **SHARP**：把 all-reduce 等归约卸载到交换机里做 | — |

InfiniBand 速率：EDR 100 Gb/s → HDR 200 Gb/s → **NDR 400 Gb/s** → XDR 800 Gb/s。

### GPUDirect 家族（Magnum IO）

- **GPUDirect P2P**：同节点 GPU 之间直接访问显存（走 NVLink 或 PCIe）。
- **GPUDirect RDMA**：**网卡直接读写 GPU 显存**，不经过 CPU 内存拷贝 → 跨节点通信低延迟。
- **GPUDirect Storage（GDS）**：**存储（NVMe / NVMe-oF / 并行文件系统）直接 DMA 到 GPU 显存**，绕开 CPU 内存里的"bounce buffer"。

### 拓扑

- **胖树（Fat-tree / Clos）**：叶-脊结构，可做到无阻塞（non-blocking）全对分带宽。
- **Rail-optimized（轨道优化）**：每台服务器的第 N 号 GPU/网卡都连到同一台"第 N 号"叶交换机，NCCL 同号 GPU 之间只需一跳。
- **四张网络**（DGX SuperPOD 参考架构）：
  1. **计算网络（Compute fabric）**：GPU↔GPU 东西向流量，InfiniBand 或 Spectrum-X，用于分布式训练。
  2. **存储网络（Storage fabric）**：访问高性能存储，和计算网络隔离以免 IO 干扰集合通信。
  3. **带内管理网络（In-band management）**：SSH、集群管理、作业调度、镜像拉取。
  4. **带外管理网络（Out-of-band, OOB）**：连接 **BMC**（IPMI/Redfish），远程开关机、看硬件状态，操作系统挂了也能用。
- 东西向（east-west）= 服务器之间；南北向（north-south）= 进出数据中心/用户访问。

## §2.4 DPU：BlueField

- **DPU（Data Processing Unit）**：网卡 + Arm 核 + 加速引擎的"基础设施处理器"。
- 价值：**把网络（OVS、虚拟交换）、存储（NVMe-oF）、安全（防火墙、加密、隔离）卸载出主机 CPU**，并把基础设施和租户工作负载隔离（零信任）。
- **DOCA**：BlueField 的软件开发框架/SDK（类比 CUDA 之于 GPU）。
- **SuperNIC**：BlueField-3 的一种形态，专为 AI 东西向网络（Spectrum-X）优化。
- 常见干扰项：DPU **不会**增加 GPU 显存、**不**替代 NVSwitch、**不**跑训练。

## §2.5 存储

| 层级 | 例子 | 用途 |
| --- | --- | --- |
| 本地 NVMe | 节点内 SSD | 数据集缓存、临时文件，最快但不共享 |
| 高性能共享存储 / 并行文件系统 | Lustre、GPFS（Storage Scale）、WEKA、VAST、DDN | 热训练数据、**checkpoint**，高聚合吞吐和 IOPS |
| 对象存储 | S3 兼容 | 数据湖、海量归档，便宜可扩展，延迟较高 |
| NFS / 家目录 | | 代码、配置，不适合大规模训练 IO |

- 症状 → 原因：**GPU 利用率低 + IO wait 高** → 数据喂不饱 GPU；解决：并行文件系统、本地 NVMe 缓存、GDS、增加 DataLoader worker、DALI。
- 大模型 checkpoint 体积大、写入频繁 → 需要高写带宽，否则训练停顿时间长。

## §2.6 数据中心：供电、散热、空间

- **PUE（Power Usage Effectiveness）** = 设施总功耗 ÷ IT 设备功耗。理想 1.0，越低越好。
  例：总 1.5 MW、IT 1.2 MW → PUE = 1.25。
- **功率密度**：传统机柜约 5–15 kW；4 台 DGX H100 ≈ 4 × 10.2 = 40.8 kW/柜；GB200 NVL72 单柜约 120 kW 级 → 必须液冷。
- **散热方式**：风冷（冷热通道封闭 hot/cold aisle containment，防止冷热风混合）→ 后门热交换器（RDHx）→ **直接液冷（DLC，冷板）**→ 浸没式。
- **冗余**：N（刚好够）、**N+1**（多一套备用）、2N（完全双路）。双路电源（A/B 供电）。
- 规划时还要考虑：**楼板承重**、线缆数量与长度（光模块）、部署时间、电力合同。

## §2.7 参考架构与部署选择

- **DGX BasePOD**：基于 DGX 的参考架构，规模较小、起步用。
- **DGX SuperPOD**：交钥匙的大规模 AI 数据中心方案，由 **Scalable Unit（SU）** 堆叠；DGX H100 SuperPOD 一个 SU = **32 台 DGX（256 GPU）**。
  配套：InfiniBand 计算网络、认证存储、Base Command Manager / Mission Control 管理软件。
- **本地 vs 云 vs 混合**：

| 因素 | 倾向本地（on-prem） | 倾向云 |
| --- | --- | --- |
| 负载形态 | 长期、持续高利用率 | 突发、短期、不确定 |
| 成本模型 | CapEx（一次性投入，长期 TCO 低） | OpEx（按需付费，起步快） |
| 数据 | 数据主权、合规、数据量大不便搬迁 | 数据本来就在云上 |
| 速度 | 采购交付周期长 | 几分钟起实例（但 GPU 配额可能是 0，见本仓库 [instance-selection.md](../aws/instance-selection.md)） |

- **混合**：基础负载在本地，峰值溢出（burst）到云。
- **DGX Cloud**：NVIDIA 与云厂商合作提供的托管 AI 训练平台（含 NVIDIA 软件和专家支持）。

## §2.8 边缘 AI

- 低延迟、带宽受限、数据隐私 → 在边缘推理。
- **Jetson**（嵌入式/机器人）、**IGX**（工业/医疗，功能安全）、数据中心低功耗卡 **L4**；**Fleet Command** 远程管理边缘集群。

---

### 我的补充

- 
