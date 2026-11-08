# 模拟考 A（50 题 / 60 分钟）

> 由 `build-answer-key.js` 从 `questions.js` 生成，请勿手改。自编练习题，非真题。
> 建议在 [交互式考场](index.html) 里计时作答；这份 Markdown 方便在 GitHub 上直接阅读或打印。

| 领域 | 题数 |
| --- | --- |
| 1. AI 基础知识 | 19 |
| 2. AI 基础设施 | 20 |
| 3. AI 运维 | 11 |

## 题目

**1.** Which statement best describes the relationship between artificial intelligence (AI), machine learning (ML), and deep learning (DL)?

- A. ML is a subset of DL, which is a subset of AI
- B. AI is a subset of ML, which is a subset of DL
- C. DL is a subset of ML, which is a subset of AI
- D. AI, ML, and DL are independent fields with no overlap

**2.** Why are GPUs generally better suited than CPUs for training deep neural networks?

- A. GPUs can run the operating system kernel more efficiently
- B. GPUs execute thousands of threads in parallel and provide high memory bandwidth for matrix operations
- C. GPUs have larger L3 caches for branch-heavy code
- D. GPUs run at much higher clock speeds than CPUs

**3.** Which characteristic typically distinguishes AI inference from AI training?

- A. Inference runs only the forward pass using fixed, trained weights and is often latency-sensitive
- B. Inference always requires more GPUs than training
- C. Inference performs backpropagation to update model weights
- D. Inference uses unlabeled data to discover clusters

**4.** Which GPU hardware unit, first introduced with the NVIDIA Volta architecture, accelerates matrix multiply-accumulate operations used in deep learning?

- A. Copy engines
- B. NVENC encoders
- C. RT Cores
- D. Tensor Cores

**5.** Which NVIDIA Hopper feature dynamically selects between FP8 and 16-bit precision to accelerate transformer models?

- A. Multi-Instance GPU (MIG)
- B. Transformer Engine
- C. NVLink-C2C
- D. Structural sparsity

**6.** Multi-Instance GPU (MIG) was first introduced with which GPU architecture?

- A. Ampere
- B. Pascal
- C. Turing
- D. Volta

**7.** What is CUDA?

- A. A cluster job scheduler
- B. A deep learning framework similar to PyTorch
- C. A parallel computing platform and programming model for NVIDIA GPUs
- D. A GPU monitoring daemon

**8.** Which NVIDIA library provides optimized collective communication primitives such as all-reduce across multiple GPUs and nodes?

- A. TensorRT
- B. cuBLAS
- C. cuDNN
- D. NCCL

**9.** An engineer needs to optimize a trained model for low-latency inference on NVIDIA GPUs using layer fusion, kernel auto-tuning, and INT8 calibration. Which tool should be used?

- A. NCCL
- B. TensorRT
- C. DALI
- D. RAPIDS

**10.** Which open-source software serves models from multiple frameworks (TensorRT, PyTorch, ONNX) and supports dynamic batching and concurrent model execution?

- A. NVIDIA Fleet Command
- B. NVIDIA Base Command Manager
- C. NVIDIA Triton Inference Server
- D. NVIDIA DOCA

**11.** Where can a team obtain GPU-optimized, regularly updated containers for frameworks such as PyTorch, along with pretrained models and Helm charts?

- A. NVIDIA NGC catalog
- B. Docker Hub official images only
- C. The CUDA Toolkit installer
- D. NVIDIA UFM

**12.** An enterprise wants a production-grade AI software suite with enterprise support, security updates, and API stability that runs on-premises and in the cloud. Which offering fits?

- A. GeForce Experience
- B. NVIDIA Omniverse
- C. CUDA Toolkit
- D. NVIDIA AI Enterprise

**13.** A data scientist wants to accelerate pandas-style dataframe ETL and scikit-learn-style machine learning on GPUs with minimal code changes. Which NVIDIA software should they use?

- A. RAPIDS (cuDF, cuML)
- B. NeMo
- C. Riva
- D. TensorRT

**14.** In data-parallel training, what is replicated and what is split across GPUs?

- A. Both the model and the data are split by layer
- B. The dataset is replicated; the model layers are split
- C. Only the optimizer state is replicated; everything else is split
- D. The model is replicated on each GPU; each mini-batch is split, and gradients are synchronized with all-reduce

**15.** A model is too large to fit in the memory of a single GPU. Which approach directly addresses this?

- A. Enable GPU persistence mode
- B. Switch from InfiniBand to Ethernet
- C. Use model parallelism (tensor or pipeline parallelism) to split the model across GPUs
- D. Increase the batch size

**16.** What is the main benefit of mixed-precision training?

- A. It reduces network bandwidth requirements between data centers
- B. It uses lower-precision math on Tensor Cores for speed and memory savings while keeping FP32 master weights to preserve accuracy
- C. It removes the need for GPUs
- D. It guarantees higher accuracy than FP32 training

**17.** A company wants an LLM to answer questions using internal documents that change daily, without retraining the model. Which technique is most appropriate?

- A. Full fine-tuning every hour
- B. Retrieval-augmented generation (RAG)
- C. Increasing the sampling temperature
- D. Pretraining a new foundation model nightly

**18.** For an interactive chatbot, which metric measures the delay between sending a request and receiving the first generated token?

- A. Throughput (tokens per second)
- B. GPU utilization
- C. Time to first token (TTFT)
- D. Time per output token (TPOT)

**19.** Which NVIDIA offering provides prebuilt, optimized inference microservice containers that expose industry-standard APIs for quickly deploying foundation models?

- A. NVIDIA NIM
- B. NVIDIA Base Command Manager
- C. NVIDIA DALI
- D. NVIDIA DOCA

**20.** Why do HGX and DGX systems use SXM-form-factor GPUs rather than PCIe cards?

- A. SXM GPUs are cheaper and fit any standard server
- B. SXM GPUs do not require drivers
- C. SXM GPUs connect directly to the storage network
- D. SXM modules enable high-bandwidth NVLink/NVSwitch connectivity between all GPUs and support higher power envelopes

**21.** What is the role of NVSwitch inside a system such as DGX H100?

- A. It provides all-to-all, full-bandwidth NVLink connectivity among all GPUs in the system
- B. It converts PCIe traffic into Ethernet frames
- C. It manages BMC power control
- D. It connects the server to the InfiniBand fabric

**22.** In the output of `nvidia-smi topo -m`, which connection type indicates the slowest path between two devices?

- A. NV12
- B. PIX
- C. PXB
- D. SYS

**23.** What does GPUDirect RDMA enable?

- A. Storage devices to replace GPU memory
- B. Two GPUs to share a single NVLink
- C. A network adapter to read and write GPU memory directly, bypassing staging copies through host memory
- D. GPUs to boot without a CPU

**24.** A training job spends significant time copying data from NVMe storage through a CPU bounce buffer before it reaches GPU memory. Which technology addresses this?

- A. NVLink-C2C
- B. GPUDirect Storage
- C. SHARP
- D. MIG

**25.** Which component must be running for an InfiniBand fabric to become operational, assigning addresses (LIDs) and computing routing tables?

- A. A BGP route reflector
- B. Spanning Tree Protocol
- C. A DHCP server
- D. A Subnet Manager

**26.** To achieve good RDMA performance with RoCE v2, the Ethernet fabric is typically configured with which mechanisms?

- A. Priority Flow Control (PFC) and Explicit Congestion Notification (ECN)
- B. Spanning Tree Protocol and VLAN pruning
- C. DHCP snooping and port security
- D. Link Aggregation Control Protocol only

**27.** Which InfiniBand technology offloads collective reduction operations into the network switches to reduce data movement?

- A. MIG
- B. NVLink-C2C
- C. SHARP
- D. GPUDirect Storage

**28.** In a DGX SuperPOD-style design, which network carries GPU-to-GPU traffic between nodes during distributed training?

- A. In-band management network
- B. Compute (east-west) fabric
- C. Out-of-band management network
- D. Storage fabric

**29.** An administrator needs to remotely power-cycle a server whose operating system has hung. Which network and interface should be used?

- A. The out-of-band management network via the BMC (IPMI/Redfish)
- B. The compute fabric via NCCL
- C. The in-band network via SSH
- D. The storage fabric via NFS

**30.** In a rail-optimized network topology, how are the GPU network adapters connected?

- A. Adapters connect in a ring between neighboring servers
- B. The adapter for GPU N in every server connects to the same leaf switch (rail N)
- C. Each adapter connects directly to a spine switch
- D. All adapters in one server connect to the same leaf switch

**31.** Which software framework is used to develop applications and services that run on NVIDIA BlueField DPUs?

- A. RAPIDS
- B. CUDA
- C. DOCA
- D. NCCL

**32.** Which network topology is commonly used for AI compute fabrics to provide non-blocking, full bisection bandwidth?

- A. Star with a single core switch
- B. Ring
- C. Daisy chain
- D. Fat-tree (Clos / leaf-spine)

**33.** A data center draws 1.5 MW in total, of which 1.2 MW is consumed by IT equipment. What is its PUE?

- A. 1.20
- B. 0.80
- C. 1.25
- D. 1.50

**34.** A rack design exceeds the heat that conventional air cooling can remove, as with GB200 NVL72-class systems. Which cooling approach is typically required?

- A. Adding more raised-floor perforated tiles
- B. Direct-to-chip liquid cooling
- C. Installing more ceiling lights
- D. Lowering the room humidity

**35.** A startup has bursty, short-term GPU needs and uncertain long-term demand. Which deployment model usually fits best?

- A. Use cloud GPU instances on demand
- B. Build an on-premises DGX SuperPOD
- C. Buy consumer GPUs for each engineer
- D. Deploy edge devices in each office

**36.** Which factor most strongly favors an on-premises AI infrastructure over the public cloud?

- A. No in-house operations staff
- B. Unpredictable, short-lived experiments
- C. The need to start within hours
- D. Sustained high utilization over several years combined with strict data residency requirements

**37.** Which NVIDIA product combines a Grace CPU and a Hopper GPU connected by a coherent 900 GB/s NVLink-C2C interconnect?

- A. BlueField-3
- B. GH200 Grace Hopper Superchip
- C. DGX A100
- D. Jetson Orin

**38.** What is the per-port data rate of InfiniBand NDR?

- A. 100 Gb/s
- B. 800 Gb/s
- C. 400 Gb/s
- D. 200 Gb/s

**39.** What characterizes the NVIDIA GB200 NVL72?

- A. A 72-port InfiniBand switch
- B. An edge device with 72 TOPS of inference performance
- C. A single PCIe card with 72 GB of memory
- D. A liquid-cooled rack-scale system with 72 Blackwell GPUs in a single NVLink domain

**40.** During training, GPU utilization stays low while CPU I/O wait is high and the data loader is consistently behind. What is the most likely bottleneck?

- A. Storage or data-loading throughput
- B. Too many Tensor Cores
- C. The BMC firmware version
- D. Insufficient NVLink bandwidth

**41.** Which NVIDIA tool suite is designed to manage and monitor data center GPUs at cluster scale, including health checks, active diagnostics, and telemetry?

- A. NVIDIA Nsight Graphics
- B. NVIDIA DCGM
- C. NVIDIA Omniverse
- D. GeForce Experience

**42.** Before each job starts, an administrator wants a diagnostic that completes in seconds to catch obvious GPU problems. Which command fits?

- A. dcgmi diag -r 3
- B. nvidia-smi -pm 0
- C. dcgmi diag -r 1
- D. sinfo -R

**43.** The kernel log on a GPU node shows Xid 79 (GPU has fallen off the bus). What is the most appropriate first response?

- A. Drain the node from the scheduler and investigate PCIe, power, and thermal conditions
- B. Reinstall the Python environment
- C. Increase the training batch size
- D. Ignore it; it is informational only

**44.** Which TWO components are deployed and managed by the NVIDIA GPU Operator on Kubernetes? (Choose two.)

- A. NVIDIA device plugin
- B. DCGM Exporter
- C. Slurm controller (slurmctld)
- D. NVIDIA UFM

**45.** Which component advertises GPUs to the kubelet as the extended resource `nvidia.com/gpu` so that pods can request them?

- A. kube-proxy
- B. CoreDNS
- C. Container Network Interface (CNI) plugin
- D. NVIDIA device plugin

**46.** A user wants to view the state of Slurm partitions and nodes (idle, allocated, drained). Which command should they use?

- A. scancel
- B. sinfo
- C. squeue
- D. sbatch

**47.** Several tenants must share one A100 GPU with hardware-isolated memory, cache, and compute, plus fault isolation. Which feature should be used?

- A. Multi-Instance GPU (MIG)
- B. CUDA MPS
- C. Time-slicing
- D. Persistence mode

**48.** An organization runs VMware vSphere and wants several virtual machines to share each physical GPU. Which solution fits?

- A. GPUDirect Storage
- B. NVLink bridge
- C. NVIDIA vGPU software
- D. PCIe passthrough

**49.** On a host with the NVIDIA driver and NVIDIA Container Toolkit installed, `docker run --rm nvidia/cuda:12.4.1-base-ubuntu22.04 nvidia-smi` fails with `executable file not found`. What is the most likely cause?

- A. The GPU does not support CUDA
- B. The image is corrupted
- C. The CUDA Toolkit is not installed on the host
- D. The container was started without requesting GPUs (for example, `--gpus all`)

**50.** In a monitoring stack built from DCGM Exporter, Prometheus, and Grafana, which component scrapes and stores the GPU metrics as time series?

- A. The NVIDIA driver
- B. Prometheus
- C. Grafana
- D. DCGM Exporter

## 答案与解析

| 题 | 答案 | 领域 | 考点 | 复习 |
| --- | --- | --- | --- | --- |
| 1 | C | D1 | AI/ML/DL 概念 | 01-essential-ai-knowledge.md §1.1 |
| 2 | B | D1 | CPU vs GPU | 01-essential-ai-knowledge.md §1.3 |
| 3 | A | D1 | 训练 vs 推理 | 01-essential-ai-knowledge.md §1.2 |
| 4 | D | D1 | Tensor Core | 01-essential-ai-knowledge.md §1.3 |
| 5 | B | D1 | GPU 架构代际 | 01-essential-ai-knowledge.md §1.5 |
| 6 | A | D1 | GPU 架构代际 | 01-essential-ai-knowledge.md §1.5 |
| 7 | C | D1 | 软件栈 | 01-essential-ai-knowledge.md §1.6 |
| 8 | D | D1 | 软件栈 | 01-essential-ai-knowledge.md §1.6 |
| 9 | B | D1 | 推理优化 | 01-essential-ai-knowledge.md §1.6 |
| 10 | C | D1 | 推理服务 | 01-essential-ai-knowledge.md §1.6 |
| 11 | A | D1 | NGC | 01-essential-ai-knowledge.md §1.6 |
| 12 | D | D1 | NVIDIA AI Enterprise | 01-essential-ai-knowledge.md §1.6 |
| 13 | A | D1 | RAPIDS | 01-essential-ai-knowledge.md §1.6 |
| 14 | D | D1 | 并行训练 | 01-essential-ai-knowledge.md §1.7 |
| 15 | C | D1 | 并行训练 | 01-essential-ai-knowledge.md §1.7 |
| 16 | B | D1 | 数值精度 | 01-essential-ai-knowledge.md §1.4 |
| 17 | B | D1 | 生成式 AI / RAG | 01-essential-ai-knowledge.md §1.8 |
| 18 | C | D1 | 推理指标 | 01-essential-ai-knowledge.md §1.8 |
| 19 | A | D1 | NIM | 01-essential-ai-knowledge.md §1.6 |
| 20 | D | D2 | 计算节点 | 02-ai-infrastructure.md §2.1 |
| 21 | A | D2 | 节点内互联 | 02-ai-infrastructure.md §2.2 |
| 22 | D | D2 | 节点内互联 | 02-ai-infrastructure.md §2.2 |
| 23 | C | D2 | GPUDirect | 02-ai-infrastructure.md §2.3 |
| 24 | B | D2 | GPUDirect | 02-ai-infrastructure.md §2.3 |
| 25 | D | D2 | InfiniBand | 02-ai-infrastructure.md §2.3 |
| 26 | A | D2 | 以太网 / RoCE | 02-ai-infrastructure.md §2.3 |
| 27 | C | D2 | InfiniBand | 02-ai-infrastructure.md §2.3 |
| 28 | B | D2 | 网络拓扑 | 02-ai-infrastructure.md §2.3 |
| 29 | A | D2 | 网络拓扑 | 02-ai-infrastructure.md §2.3 |
| 30 | B | D2 | 网络拓扑 | 02-ai-infrastructure.md §2.3 |
| 31 | C | D2 | DPU | 02-ai-infrastructure.md §2.4 |
| 32 | D | D2 | 网络拓扑 | 02-ai-infrastructure.md §2.3 |
| 33 | C | D2 | 机房 | 02-ai-infrastructure.md §2.6 |
| 34 | B | D2 | 机房 | 02-ai-infrastructure.md §2.6 |
| 35 | A | D2 | 本地 vs 云 | 02-ai-infrastructure.md §2.7 |
| 36 | D | D2 | 本地 vs 云 | 02-ai-infrastructure.md §2.7 |
| 37 | B | D2 | 计算节点 | 02-ai-infrastructure.md §2.2 |
| 38 | C | D2 | InfiniBand | 02-ai-infrastructure.md §2.3 |
| 39 | D | D2 | 计算节点 | 02-ai-infrastructure.md §2.1 |
| 40 | A | D3 | 存储 | 03-ai-operations.md §2.5 |
| 41 | B | D3 | DCGM | 03-ai-operations.md §3.1 |
| 42 | C | D3 | DCGM | 03-ai-operations.md §3.1 |
| 43 | A | D3 | XID / 故障 | 03-ai-operations.md §3.2 |
| 44 | A, B | D3 | Kubernetes GPU | 03-ai-operations.md §3.3 |
| 45 | D | D3 | Kubernetes GPU | 03-ai-operations.md §3.3 |
| 46 | B | D3 | Slurm | 03-ai-operations.md §3.3 |
| 47 | A | D3 | GPU 共享 | 03-ai-operations.md §3.4 |
| 48 | C | D3 | GPU 虚拟化 | 03-ai-operations.md §3.4 |
| 49 | D | D3 | 容器 | 03-ai-operations.md §3.5 |
| 50 | B | D3 | 监控 | 03-ai-operations.md §3.1 |

**1. C**　AI ⊃ ML ⊃ DL。深度学习是用多层神经网络的机器学习，机器学习又是实现 AI 的一种方法。

**2. B**　深度学习核心是大规模矩阵乘加，天然数据并行。GPU 有成千上万个核心 + HBM 高带宽；CPU 少量强核心、频率高、缓存大，擅长串行和分支复杂的任务。

**3. A**　推理只做前向计算、权重固定，通常对延迟敏感；反向传播和权重更新是训练才有的。「用无标签数据发现聚类」描述的是无监督学习。

**4. D**　Tensor Core 在 Volta（V100）首次引入，专做矩阵乘加。RT Core（Turing）用于光线追踪，NVENC 是视频编码器，都是常见干扰项。

**5. B**　Transformer Engine 是 Hopper 的标志特性，按层动态在 FP8 与 FP16/BF16 之间切换；Blackwell 的第二代 Transformer Engine 增加了 FP4。MIG 和结构化稀疏是 Ampere 引入的。

**6. A**　MIG 随 Ampere（A100）推出，可把一张 GPU 硬件切分成最多 7 个实例。

**7. C**　CUDA 是 NVIDIA 的并行计算平台和编程模型（含编译器 nvcc、运行时、库）。框架（PyTorch）构建在 CUDA 之上。

**8. D**　NCCL 实现 all-reduce、all-gather、broadcast 等集合通信，自动利用 NVLink、PCIe、InfiniBand。cuDNN 是 DNN 原语，cuBLAS 是线性代数，TensorRT 是推理优化。

**9. B**　层融合、kernel 自动调优、INT8/FP8 校准都是 TensorRT 的功能。RAPIDS 是数据科学，DALI 是数据加载，NCCL 是通信。

**10. C**　Triton 是推理服务软件：多框架后端、动态批处理、多模型并发、HTTP/gRPC 接口、Prometheus 指标。

**11. A**　NGC 是 NVIDIA 的 GPU 优化软件目录：框架容器（每月更新并经测试）、预训练模型、Helm chart。UFM 是 InfiniBand 管理软件。

**12. D**　NVIDIA AI Enterprise 是有企业支持、安全维护、长期分支的 AI 软件套件（含 NIM、NeMo、Triton、RAPIDS 等），可跑在本地、云和边缘，需授权。

**13. A**　RAPIDS 的 cuDF 对标 pandas，cuML 对标 scikit-learn。NeMo 是生成式 AI 框架，Riva 是语音 AI。

**14. D**　数据并行：每张 GPU 一份完整模型，切分 mini-batch，反向后用 all-reduce 平均梯度。按层切是流水线并行。

**15. C**　模型放不下单卡 → 把模型切开：张量并行（切层内矩阵）或流水线并行（按层分 stage），或用 FSDP/ZeRO 分片、量化。增大 batch 只会更占显存。

**16. B**　混合精度：矩阵运算用 FP16/BF16（Tensor Core 加速、显存减半），保留 FP32 主权重（FP16 还需 loss scaling），精度基本不受影响。

**17. B**　RAG：文档向量化存入向量库，提问时检索相关片段拼进 prompt。数据频繁变化、不想重训 → RAG。

**18. C**　TTFT 是首 token 延迟，决定用户感受的'开始回答'时间；TPOT 是后续每个 token 的间隔；吞吐是整体产出速率。

**19. A**　NIM（NVIDIA Inference Microservices）是预打包、预优化的推理容器，提供 OpenAI 兼容等标准 API。

**20. D**　SXM 模组装在 HGX 基板上，通过 NVSwitch 让所有 GPU 全带宽互联，并且功耗上限更高（H100 SXM 约 700W vs PCIe 约 350W）。

**21. A**　NVSwitch 是 NVLink 交换芯片，让节点内每对 GPU 都能以全 NVLink 带宽通信。连接外部 InfiniBand 的是 ConnectX 网卡。

**22. D**　SYS 表示要跨 NUMA 节点、经过 CPU 之间的 SMP 互联，最慢。NV# 是 NVLink 直连最快；PIX 最多经过一个 PCIe 交换芯片；PXB 经过多个 PCIe 交换芯片。

**23. C**　GPUDirect RDMA：网卡直接读写 GPU 显存，省掉经过 CPU 内存的中转拷贝，降低跨节点通信延迟、减轻 CPU 负担。存储↔GPU 直通是 GPUDirect Storage。

**24. B**　GPUDirect Storage（GDS）在存储与 GPU 显存之间建立直接 DMA 通路，绕过 CPU 内存里的 bounce buffer。

**25. D**　InfiniBand 需要 Subnet Manager（OpenSM 或 UFM 内置）来发现拓扑、分配 LID、计算转发表。没有 SM，端口会停在 Initializing 状态。

**26. A**　RoCE 对丢包很敏感，需要 PFC（按优先级暂停）+ ECN（拥塞标记）等拥塞控制让网络接近无损。InfiniBand 则用基于信用的链路层流控天然无损。

**27. C**　SHARP（Scalable Hierarchical Aggregation and Reduction Protocol）在 InfiniBand 交换机里做归约，减少 all-reduce 的数据往返。

**28. B**　计算网络（东西向）承载跨节点 GPU 通信，通常是 InfiniBand 或 Spectrum-X。存储、带内管理、带外管理各自独立。

**29. A**　带外管理网络连接 BMC，用 IPMI/Redfish 控制电源、看硬件日志，不依赖操作系统。OS 挂了 SSH（带内）就连不上了。

**30. B**　Rail-optimized：所有服务器的第 N 号 GPU 网卡接到同一台'第 N 号'叶交换机，同号 GPU 之间一跳可达，和 NCCL 通信模式匹配。

**31. C**　DOCA 是 BlueField DPU 的 SDK/框架，地位类似 CUDA 之于 GPU。

**32. D**　胖树（Clos、叶-脊）通过多条等价路径做到无阻塞、全对分带宽，是 AI 计算网络的标准拓扑。

**33. C**　PUE = 设施总功耗 ÷ IT 设备功耗 = 1.5 ÷ 1.2 = 1.25。

**34. B**　GB200 NVL72 这类机柜功率达到百千瓦级，风冷带不走，需要直接液冷（冷板）。

**35. A**　突发、短期、不确定 → 云（OpEx、按需弹性、无采购周期）。长期持续高利用率、数据主权要求才倾向本地。

**36. D**　长期持续高利用率摊薄 CapEx、数据主权/合规要求 → 本地更划算。其他选项都更适合云。

**37. B**　GH200 Grace Hopper Superchip：Grace（Arm CPU）+ Hopper GPU，用 NVLink-C2C 一致性互联。

**38. C**　EDR 100、HDR 200、NDR 400、XDR 800 Gb/s。DGX H100 的计算网卡是 400 Gb/s NDR ConnectX-7。

**39. D**　GB200 NVL72：一个液冷机柜，36 颗 Grace CPU + 72 颗 Blackwell GPU，所有 GPU 在同一个 NVLink 域内。

**40. A**　GPU 闲 + IO wait 高 = 数据喂不饱 GPU。改进：并行文件系统、本地 NVMe 缓存、GPUDirect Storage、更多 DataLoader worker、DALI。

**41. B**　DCGM（Data Center GPU Manager）负责健康检查、主动诊断（dcgmi diag）、策略告警、作业统计和遥测，面向数据中心 GPU。

**42. C**　dcgmi diag -r 1 是快速诊断（秒级），适合作业前检查；-r 2 中等，-r 3 是长时间深度诊断，适合上线验收或故障后排查。

**43. A**　Xid 79 是严重硬件类错误：先从调度器里隔离（drain）节点，再查 PCIe、供电、散热，必要时重启、重新插拔或 RMA。

**44. A, B**　GPU Operator 自动部署：驱动、Container Toolkit、Device Plugin、GFD、DCGM/DCGM Exporter、MIG Manager 等。Slurm 控制器和 UFM（InfiniBand 管理）不属于它。

**45. D**　NVIDIA Device Plugin 向 kubelet 注册 nvidia.com/gpu，Pod 在 resources.limits 里申请。

**46. B**　sinfo 看分区和节点状态；squeue 看作业队列；sbatch 提交脚本；scancel 取消作业。

**47. A**　MIG 提供硬件级隔离：独立的 SM、L2 缓存、显存和带宽，一个实例出错不影响其他实例。时间片和 MPS 都没有完整的显存/故障隔离。

**48. C**　多个虚拟机共享一张 GPU → NVIDIA vGPU（需授权）。PCIe 直通是一张卡给一个 VM。

**49. D**　不加 --gpus，Container Toolkit 不会把 GPU 设备和驱动工具（含 nvidia-smi）注入容器。本仓库故障记录 01 就是这个真实报错。宿主机不需要 CUDA Toolkit。

**50. B**　DCGM Exporter 暴露 /metrics，Prometheus 定时抓取并存储时间序列（也做告警规则），Grafana 负责可视化。

