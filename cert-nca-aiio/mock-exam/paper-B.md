# 模拟考 B（50 题 / 60 分钟）

> 由 `build-answer-key.js` 从 `questions.js` 生成，请勿手改。自编练习题，非真题。
> 建议在 [交互式考场](index.html) 里计时作答；这份 Markdown 方便在 GitHub 上直接阅读或打印。

| 领域 | 题数 |
| --- | --- |
| 1. AI 基础知识 | 19 |
| 2. AI 基础设施 | 20 |
| 3. AI 运维 | 11 |

## 题目

**1.** A retailer wants to group customers into segments based on purchasing behavior, without any predefined labels. Which type of machine learning is this?

- A. Unsupervised learning
- B. Transfer learning
- C. Supervised learning
- D. Reinforcement learning

**2.** In neural network training, what is an epoch?

- A. One forward pass of a single sample
- B. The time needed to load the model into GPU memory
- C. One update of the learning rate
- D. One complete pass through the entire training dataset

**3.** Which neural network architecture, built around the self-attention mechanism, underlies most modern large language models?

- A. Recurrent neural network (RNN)
- B. Decision tree ensemble
- C. Transformer
- D. Convolutional neural network (CNN)

**4.** Which description best fits generative AI?

- A. Models that create new content such as text, images, or code based on patterns learned from data
- B. Models that only classify inputs into fixed categories
- C. Databases optimized for similarity search
- D. Rule-based expert systems with hand-written logic

**5.** Which 16-bit floating-point format keeps the same 8-bit exponent (dynamic range) as FP32 and is widely used for stable training?

- A. FP8 E4M3
- B. FP16
- C. INT8
- D. BF16

**6.** What is the primary trade-off when quantizing a model from FP16 to INT8 for inference?

- A. Longer training time with no inference benefit
- B. It makes the model incompatible with GPUs
- C. Lower memory use and higher throughput, with a possible small loss in accuracy
- D. Higher memory use in exchange for better accuracy

**7.** What does LoRA (Low-Rank Adaptation) do during fine-tuning?

- A. Converts the model to INT4
- B. Freezes the base model weights and trains small low-rank adapter matrices
- C. Retrains all model weights from scratch
- D. Removes attention layers to speed up inference

**8.** When the batch size for an inference service is increased, what typically happens?

- A. Throughput increases, but per-request latency may increase
- B. GPU memory use decreases
- C. Throughput decreases and per-request latency decreases
- D. Both throughput and latency stay the same

**9.** Which NVIDIA GPU architecture introduced a second-generation Transformer Engine with FP4 precision support?

- A. Hopper
- B. Blackwell
- C. Turing
- D. Ampere

**10.** A cloud provider needs a low-profile, roughly 72 W data center GPU for energy-efficient video processing and AI inference. Which GPU fits best?

- A. NVIDIA H100 SXM
- B. NVIDIA B200
- C. NVIDIA L4
- D. NVIDIA A100 SXM

**11.** What does cuDNN provide?

- A. A GPU-accelerated dataframe library
- B. A network fabric manager
- C. A job scheduler for GPU clusters
- D. GPU-accelerated primitives for deep neural networks such as convolution, attention, and normalization

**12.** Which NVIDIA framework is designed for building, customizing (fine-tuning), and deploying generative AI models such as LLMs?

- A. NVIDIA UFM
- B. NVIDIA DALI
- C. NVIDIA NeMo
- D. NVIDIA DCGM

**13.** Image preprocessing on the CPU cannot keep up with GPU training speed. Which NVIDIA library moves data loading and augmentation onto the GPU?

- A. NCCL
- B. TensorRT
- C. cuBLAS
- D. DALI

**14.** Which ordering of the GPU software stack is correct from the bottom (closest to hardware) to the top?

- A. Driver → CUDA libraries → framework (e.g., PyTorch) → application
- B. Framework → driver → CUDA → application
- C. CUDA → driver → application → framework
- D. Application → framework → CUDA → driver

**15.** A container image built with CUDA 12.4 fails with 'CUDA driver version is insufficient' on a host whose driver supports up to CUDA 11.8. What is the correct fix?

- A. Add more GPU memory
- B. Upgrade the host NVIDIA driver to a version that supports CUDA 12.x
- C. Downgrade Docker
- D. Install the CUDA 12.4 Toolkit on the host

**16.** Scaling efficiency drops sharply when a data-parallel training job grows from one node to eight nodes. What is the most likely cause?

- A. The model has too few parameters to load
- B. Too much GPU memory is available
- C. The learning rate is too low
- D. Inter-node communication overhead for gradient synchronization

**17.** Which parallelism strategy splits a model's layers into sequential stages on different GPUs and uses micro-batches to reduce idle 'bubbles'?

- A. Pipeline parallelism
- B. Time-slicing
- C. Data parallelism
- D. Tensor parallelism

**18.** In a retrieval-augmented generation (RAG) pipeline, what is the role of a vector database?

- A. It caches TCP connections
- B. It stores model weights for training
- C. It stores document embeddings and retrieves the most semantically similar chunks for a query
- D. It schedules GPU jobs

**19.** Which sequence best represents a typical end-to-end AI workflow?

- A. Optimize → prepare data → deploy → train
- B. Prepare data → train → optimize → deploy for inference → monitor
- C. Train → deploy → prepare data → monitor
- D. Deploy → train → prepare data → optimize

**20.** What is the main advantage of NVLink over PCIe for GPU-to-GPU communication?

- A. It is required for a single-GPU workstation
- B. It connects GPUs across data centers
- C. It works without any drivers
- D. It provides much higher bandwidth and lower latency between GPUs

**21.** What is the total NVLink bandwidth per GPU on an NVIDIA H100 SXM?

- A. 900 GB/s
- B. 1.8 TB/s
- C. 64 GB/s
- D. 300 GB/s

**22.** How much total GPU memory does a DGX H100 system with eight 80 GB H100 GPUs provide?

- A. 1.28 TB
- B. 640 GB
- C. 80 GB
- D. 320 GB

**23.** What is the difference between NVIDIA HGX and NVIDIA DGX?

- A. They are identical names for the same product
- B. HGX is a cloud service and DGX is a GPU chip
- C. HGX is a GPU baseboard platform that OEM partners build servers around; DGX is NVIDIA's complete integrated AI system
- D. HGX is for gaming and DGX is for data centers

**24.** What does the 'NVIDIA-Certified Systems' program indicate about a partner server?

- A. It is manufactured only by NVIDIA
- B. It has been tested and validated by NVIDIA for performance, manageability, security, and networking with NVIDIA GPUs
- C. It includes a free DGX Cloud subscription
- D. It cannot run Kubernetes

**25.** In the DGX SuperPOD reference architecture with DGX H100 systems, how many DGX systems make up one scalable unit (SU)?

- A. 32
- B. 8
- C. 72
- D. 16

**26.** Which property of InfiniBand makes it well suited for large-scale AI training fabrics?

- A. It supports only copper cables
- B. It requires no fabric management
- C. Native RDMA with credit-based, lossless link-level flow control and low latency
- D. It relies on TCP retransmission for reliability

**27.** What is NVIDIA Spectrum-X?

- A. A GPU monitoring dashboard
- B. An InfiniBand subnet manager
- C. A liquid cooling system
- D. An Ethernet networking platform optimized for AI, combining Spectrum-4 switches and BlueField-3 SuperNICs

**28.** Which NVIDIA software is used to monitor, manage, and troubleshoot InfiniBand fabrics?

- A. NeMo
- B. UFM (Unified Fabric Manager)
- C. Triton
- D. DCGM

**29.** Why is the storage network often kept separate from the compute fabric in large AI clusters?

- A. Because GPUs cannot read from storage
- B. To reduce the number of GPUs needed
- C. To prevent storage I/O from interfering with latency-sensitive collective communication between GPUs
- D. Storage traffic cannot use Ethernet

**30.** For best GPUDirect RDMA performance, how should a GPU and its network adapter be placed?

- A. With the network adapter in a different server
- B. On different CPU sockets
- C. Connected only through the out-of-band network
- D. Under the same PCIe switch, close to each other in the topology

**31.** Hundreds of GPUs read training data concurrently and write large checkpoints frequently. Which storage type is most appropriate for this hot data?

- A. A high-performance parallel file system
- B. Tape archive
- C. A single NFS server
- D. USB external drives

**32.** Which storage tier is best suited to holding a massive, cost-efficient data lake of raw training data?

- A. GPU HBM
- B. CPU L3 cache
- C. Object storage (S3-compatible)
- D. Local tmpfs

**33.** A rack will hold four DGX H100 systems, each rated at about 10.2 kW maximum. Approximately how much power must the rack support?

- A. About 100 kW
- B. About 10 kW
- C. About 20 kW
- D. About 41 kW

**34.** What is the purpose of hot-aisle/cold-aisle containment in a data center?

- A. To increase network bandwidth
- B. To prevent hot exhaust air from mixing with cold intake air, improving cooling efficiency
- C. To isolate tenants for security
- D. To reduce the number of power supplies

**35.** What does an N+1 redundancy design for power or cooling mean?

- A. The required capacity plus at least one additional backup component
- B. One component shared by all racks
- C. Two complete independent systems
- D. Exactly the required capacity with no spare

**36.** A robotics company needs an embedded, power-efficient module to run AI inference on autonomous machines. Which NVIDIA platform fits?

- A. NVIDIA Quantum-2 switch
- B. NVIDIA UFM
- C. NVIDIA Jetson
- D. DGX SuperPOD

**37.** An organization runs steady training workloads on premises but occasionally needs extra capacity for short deadlines. Which strategy fits best?

- A. Hybrid: keep baseline workloads on premises and burst peak demand to the cloud
- B. Move everything to edge devices
- C. Replace GPUs with CPUs during peaks
- D. Pure on-premises with no expansion

**38.** Which TWO are benefits of deploying NVIDIA BlueField DPUs in AI servers? (Choose two.)

- A. Offloading networking functions such as virtual switching from the host CPU
- B. Isolating infrastructure services (security, storage, networking) from tenant workloads
- C. Increasing the amount of HBM on each GPU
- D. Replacing NVSwitch for GPU-to-GPU communication

**39.** A 70-billion-parameter LLM is to be served in FP16. Roughly how much GPU memory do the weights alone require, and what does this imply for an 80 GB GPU?

- A. About 560 GB; it needs eight GPUs just for weights
- B. About 140 GB; it needs at least two 80 GB GPUs (or quantization)
- C. About 70 GB; it fits with plenty of room for KV cache
- D. About 35 GB; it fits easily on one GPU

**40.** Multi-node training is far slower than expected. With NCCL_DEBUG=INFO, the logs show NCCL using `NET/Socket` instead of `NET/IB`. What does this indicate?

- A. The storage system is full
- B. The GPUs are in MIG mode
- C. NCCL is correctly using RDMA
- D. NCCL fell back to TCP sockets, so the InfiniBand/RDMA path is not being used

**41.** What does enabling GPU persistence mode (for example, with nvidia-persistenced) accomplish?

- A. It keeps the GPU driver state initialized even when no applications are running, reducing job startup latency
- B. It permanently disables ECC
- C. It enables MIG automatically
- D. It saves GPU memory contents across reboots

**42.** Under load, a GPU runs at much lower clocks than expected and its temperature is high. Which step identifies why the clocks are reduced?

- A. Run `squeue` to list jobs
- B. Run `nvidia-smi topo -m`
- C. Reinstall the CUDA Toolkit
- D. Run `nvidia-smi -q -d PERFORMANCE` to check the clock throttle (event) reasons

**43.** A node reports Xid 48 and an increasing count of uncorrectable (double-bit) ECC errors. What is the appropriate action?

- A. Continue scheduling jobs; ECC handles it
- B. Disable ECC to stop the errors
- C. Drain the node, reset the GPU, check row-remapping status, and RMA if errors persist
- D. Increase the power limit

**44.** Which orchestration platform is generally the better fit for long-running inference microservices that need autoscaling and rolling updates?

- A. PBS with no containers
- B. Kubernetes
- C. cron
- D. Slurm

**45.** Which combination lets Slurm users run NGC containers with commands such as `srun --container-image=...`?

- A. Enroot and Pyxis
- B. Docker Swarm
- C. kube-proxy and CoreDNS
- D. UFM and SHARP

**46.** What is a key limitation of GPU time-slicing compared with MIG?

- A. It works only on Blackwell GPUs
- B. It requires a vGPU license
- C. It provides no memory or fault isolation between workloads sharing the GPU
- D. It cannot be used in Kubernetes

**47.** On an A100 40GB in MIG mode, what is the smallest GPU instance profile and how many of them can be created?

- A. 1g.10gb, up to 4 instances
- B. 1g.5gb, up to 16 instances
- C. 2g.20gb, up to 8 instances
- D. 1g.5gb, up to 7 instances

**48.** Which component automatically labels Kubernetes nodes with GPU properties such as product name, memory size, and MIG configuration?

- A. The NVIDIA driver
- B. GPU Feature Discovery (GFD)
- C. Prometheus
- D. kube-scheduler

**49.** Which NVIDIA software provides bare-metal provisioning, OS image management, and deployment of Slurm or Kubernetes across an AI cluster?

- A. NVIDIA Riva
- B. NVIDIA Base Command Manager
- C. NVIDIA cuDNN
- D. NVIDIA TensorRT

**50.** nvidia-smi reports 100% GPU utilization, yet throughput is poor. Which metric better reveals how much of the GPU's compute capacity is actually being used?

- A. DCGM profiling metrics such as SM activity and tensor pipe activity
- B. The driver version
- C. The number of PCIe lanes
- D. Fan speed

## 答案与解析

| 题 | 答案 | 领域 | 考点 | 复习 |
| --- | --- | --- | --- | --- |
| 1 | A | D1 | AI/ML/DL 概念 | 01-essential-ai-knowledge.md §1.1 |
| 2 | D | D1 | 训练 vs 推理 | 01-essential-ai-knowledge.md §1.2 |
| 3 | C | D1 | 生成式 AI / RAG | 01-essential-ai-knowledge.md §1.1 |
| 4 | A | D1 | AI/ML/DL 概念 | 01-essential-ai-knowledge.md §1.1 |
| 5 | D | D1 | 数值精度 | 01-essential-ai-knowledge.md §1.4 |
| 6 | C | D1 | 数值精度 | 01-essential-ai-knowledge.md §1.4 |
| 7 | B | D1 | 生成式 AI / RAG | 01-essential-ai-knowledge.md §1.8 |
| 8 | A | D1 | 推理指标 | 01-essential-ai-knowledge.md §1.8 |
| 9 | B | D1 | GPU 架构代际 | 01-essential-ai-knowledge.md §1.5 |
| 10 | C | D1 | GPU 架构代际 | 01-essential-ai-knowledge.md §1.5 |
| 11 | D | D1 | 软件栈 | 01-essential-ai-knowledge.md §1.6 |
| 12 | C | D1 | 软件栈 | 01-essential-ai-knowledge.md §1.6 |
| 13 | D | D1 | 软件栈 | 01-essential-ai-knowledge.md §1.6 |
| 14 | A | D1 | 软件栈 | 01-essential-ai-knowledge.md §1.6 |
| 15 | B | D1 | CUDA 兼容性 | 01-essential-ai-knowledge.md §3.5 |
| 16 | D | D1 | 并行训练 | 01-essential-ai-knowledge.md §1.7 |
| 17 | A | D1 | 并行训练 | 01-essential-ai-knowledge.md §1.7 |
| 18 | C | D1 | 生成式 AI / RAG | 01-essential-ai-knowledge.md §1.8 |
| 19 | B | D1 | 训练 vs 推理 | 01-essential-ai-knowledge.md §1.2 |
| 20 | D | D2 | 节点内互联 | 02-ai-infrastructure.md §2.2 |
| 21 | A | D2 | 节点内互联 | 02-ai-infrastructure.md §2.2 |
| 22 | B | D2 | 计算节点 | 02-ai-infrastructure.md §2.1 |
| 23 | C | D2 | 计算节点 | 02-ai-infrastructure.md §2.1 |
| 24 | B | D2 | 计算节点 | 02-ai-infrastructure.md §2.1 |
| 25 | A | D2 | 参考架构 | 02-ai-infrastructure.md §2.7 |
| 26 | C | D2 | InfiniBand | 02-ai-infrastructure.md §2.3 |
| 27 | D | D2 | 以太网 / RoCE | 02-ai-infrastructure.md §2.3 |
| 28 | B | D2 | InfiniBand | 02-ai-infrastructure.md §2.3 |
| 29 | C | D2 | 网络拓扑 | 02-ai-infrastructure.md §2.3 |
| 30 | D | D2 | 节点内互联 | 02-ai-infrastructure.md §2.2 |
| 31 | A | D2 | 存储 | 02-ai-infrastructure.md §2.5 |
| 32 | C | D2 | 存储 | 02-ai-infrastructure.md §2.5 |
| 33 | D | D2 | 机房 | 02-ai-infrastructure.md §2.6 |
| 34 | B | D2 | 机房 | 02-ai-infrastructure.md §2.6 |
| 35 | A | D2 | 机房 | 02-ai-infrastructure.md §2.6 |
| 36 | C | D2 | 边缘 AI | 02-ai-infrastructure.md §2.8 |
| 37 | A | D2 | 本地 vs 云 | 02-ai-infrastructure.md §2.7 |
| 38 | A, B | D2 | DPU | 02-ai-infrastructure.md §2.4 |
| 39 | B | D2 | 容量估算 | 02-ai-infrastructure.md §1.7 |
| 40 | D | D3 | 节点间网络排障 | 03-ai-operations.md §3.6 |
| 41 | A | D3 | 监控 | 03-ai-operations.md §3.1 |
| 42 | D | D3 | 监控 | 03-ai-operations.md §3.6 |
| 43 | C | D3 | XID / 故障 | 03-ai-operations.md §3.2 |
| 44 | B | D3 | Slurm vs Kubernetes | 03-ai-operations.md §3.3 |
| 45 | A | D3 | Slurm | 03-ai-operations.md §3.5 |
| 46 | C | D3 | GPU 共享 | 03-ai-operations.md §3.4 |
| 47 | D | D3 | GPU 共享 | 03-ai-operations.md §3.4 |
| 48 | B | D3 | Kubernetes GPU | 03-ai-operations.md §3.3 |
| 49 | B | D3 | 集群管理 | 03-ai-operations.md §3.3 |
| 50 | A | D3 | 监控 | 03-ai-operations.md §3.1 |

**1. A**　无标签、发现分组 = 无监督学习（聚类）。有标签的分类/回归是监督学习；奖励信号是强化学习。

**2. D**　Epoch = 完整遍历一次训练集；一个 epoch 包含多个 iteration（每个 iteration 处理一个 mini-batch）。

**3. C**　现代 LLM 基于 Transformer，核心是自注意力机制。CNN 多用于图像，RNN 是早期序列模型。

**4. A**　生成式 AI 生成新内容（文本、图像、代码、音频）。「为相似度检索优化的数据库」描述的是向量数据库。

**5. D**　BF16 有 8 位指数，和 FP32 动态范围相同，训练稳定、一般不需要 loss scaling。FP16 只有 5 位指数，范围小。

**6. C**　量化 → 模型更小、显存占用更低、吞吐更高，代价是可能有少量精度损失（用校准把损失降到最低）。

**7. B**　LoRA 是参数高效微调（PEFT）：冻结原权重，只训练很小的低秩矩阵，显存和算力需求远低于全量微调。

**8. A**　更大的 batch 提高 GPU 利用率和吞吐，但每个请求要等批次凑齐和一起计算，单请求延迟往往上升，显存占用也增加。

**9. B**　Blackwell 引入第二代 Transformer Engine，支持 FP4（NVFP4）。Hopper 是第一代（FP8）。

**10. C**　L4（Ada Lovelace）功耗约 72W、半高单槽，面向视频和高效推理。H100/A100/B200 SXM 都是数百瓦到千瓦级训练卡。

**11. D**　cuDNN 是深度神经网络原语库，框架底层调用它来加速卷积、注意力等算子。

**12. C**　NeMo 是端到端生成式 AI 框架（数据整理 Curator、训练、微调、Guardrails、部署）。

**13. D**　DALI（Data Loading Library）在 GPU 上做解码、裁剪、增强，解决 CPU 预处理瓶颈。

**14. A**　自下而上：GPU 驱动 → CUDA（运行时与 cuDNN/cuBLAS/NCCL 等库）→ 框架（PyTorch 等）→ 应用。

**15. B**　决定能跑哪个 CUDA 版本的是宿主机驱动；容器里的 CUDA 主版本比驱动新就要升级驱动（数据中心卡也可用 forward compatibility 包）。在宿主机装 Toolkit 不解决问题。

**16. D**　多节点数据并行每步都要跨节点 all-reduce 梯度；网络带宽/延迟不足或拓扑不佳时，通信开销会吃掉扩展收益。

**17. A**　流水线并行按层分 stage，用 micro-batch 填充流水线减少空闲气泡。张量并行是切单层内的矩阵。

**18. C**　向量数据库存文档切块的 embedding，提问时按语义相似度检索最相关的片段，再交给 LLM 生成答案。

**19. B**　数据准备 → 训练 → 优化（量化、TensorRT）→ 部署推理 → 监控与再训练。

**20. D**　NVLink 是 GPU 之间的高带宽、低延迟直连（H100 每 GPU 900 GB/s，PCIe Gen5 x16 约 128 GB/s 双向）。

**21. A**　H100（第四代 NVLink）900 GB/s；A100 600 GB/s；B200（第五代）1.8 TB/s。

**22. B**　8 × 80 GB = 640 GB HBM3。

**23. C**　HGX：SXM GPU + NVSwitch 的基板平台，供 OEM 造服务器。DGX：NVIDIA 自家整机（硬件 + 软件 + 支持）。

**24. B**　NVIDIA-Certified Systems 是 OEM 服务器经 NVIDIA 测试验证的认证，可获得 NVIDIA AI Enterprise 支持。

**25. A**　一个 SU = 32 台 DGX H100（256 GPU），SuperPOD 由多个 SU 组成。72 是 NVL72 的 GPU 数。

**26. C**　InfiniBand 原生 RDMA、基于信用的链路层流控天然无损、延迟低，并支持 SHARP 在网计算。

**27. D**　Spectrum-X 是 AI 优化以太网平台：Spectrum-4 交换机 + BlueField-3 SuperNIC，提供自适应路由和拥塞控制。

**28. B**　UFM 管理 InfiniBand 网络（拓扑、遥测、告警、内置 Subnet Manager）。DCGM 管 GPU。

**29. C**　读数据/写 checkpoint 的大流量会和 NCCL 集合通信争抢带宽，分开能保证训练通信稳定。

**30. D**　GPU 和配对网卡在同一个 PCIe 交换芯片下（topo 显示 PIX）路径最短；跨 CPU 插槽（SYS）会严重降低 GPUDirect RDMA 性能。

**31. A**　大量并发读 + 大 checkpoint 写需要高聚合吞吐和 IOPS → 并行文件系统（Lustre、GPFS、WEKA、VAST 等）。

**32. C**　对象存储容量大、便宜、易扩展，适合数据湖/归档；热数据再放到并行文件系统或本地 NVMe。

**33. D**　4 × 10.2 kW ≈ 40.8 kW，远高于传统 5–15 kW 机柜，需要提前规划供电和散热。

**34. B**　冷热通道封闭防止冷热风混合，让送风更有效，降低制冷能耗（改善 PUE）。

**35. A**　N+1：需要的 N 个之外多一个备用；2N 是完全双份。

**36. C**　Jetson 是嵌入式/机器人边缘 AI 模组。SuperPOD 是数据中心级，Quantum-2 是 InfiniBand 交换机。

**37. A**　混合云：基础负载在本地（高利用率摊薄成本），峰值溢出到云上按需使用。

**38. A, B**　DPU 把网络、存储、安全卸载出主机 CPU，并把基础设施与租户隔离（零信任）。它不会增加 GPU 显存，也不替代 NVSwitch。

**39. B**　70B × 2 字节 ≈ 140 GB，单张 80 GB 放不下，需要张量并行到 ≥2 张卡，或量化到 INT8/FP8（约 70 GB）/INT4。还要给 KV cache 留显存。

**40. D**　NET/Socket = 回退到 TCP，没走 InfiniBand RDMA。要检查 IB 驱动/OFED、网卡状态、容器是否挂载了 RDMA 设备、NCCL 环境变量。

**41. A**　持久模式让驱动在没有客户端时也保持初始化，避免每次启动作业重新初始化 GPU 的延迟。推荐用 nvidia-persistenced 守护进程。

**42. D**　-d PERFORMANCE 会列出降频原因（温度、功耗上限、硬件 slowdown 等）。topo 看拓扑，与降频无关。

**43. C**　Xid 48 = 双比特（不可纠正）ECC 错误：隔离节点、重置 GPU、查行重映射；反复出现走 RMA。关闭 ECC 只会掩盖数据损坏。

**44. B**　Kubernetes 擅长长期服务：自动扩缩容、滚动升级、服务发现。Slurm 擅长多节点紧耦合的批处理训练。

**45. A**　Enroot 把容器镜像转成非特权沙箱，Pyxis 是 Slurm SPANK 插件，提供 --container-image 等参数。

**46. C**　时间片只是轮流使用 GPU，没有显存隔离和故障隔离，一个进程把显存吃满会影响其他进程。好处是任意 GPU 都能用、配置简单。

**47. D**　A100 40GB 最小规格 1g.5gb，最多 7 个。80GB 的卡（A100 80GB / H100 80GB）最小为 1g.10gb，同样最多 7 个。

**48. B**　GFD 给节点打 GPU 标签，供 nodeSelector/亲和性调度使用。它由 GPU Operator 部署。

**49. B**　Base Command Manager（原 Bright Cluster Manager）负责集群裸机部署、镜像管理、Slurm/K8s 部署和监控。

**50. A**　nvidia-smi 的 utilization 只表示采样周期内'有 kernel 在跑'的时间比例。DCGM 的 SM Activity、SM Occupancy、Tensor Active 等 profiling 指标才反映算力真实使用程度。

