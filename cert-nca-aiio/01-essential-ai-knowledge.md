# 领域 1：Essential AI Knowledge（AI 基础知识，约 38%）

这一块占比最大，题目偏概念辨析和"哪个 NVIDIA 产品干哪件事"。重点是**分清楚每个名词的边界**。
每节末尾的"必会"是考前必须能脱口而出的内容。

---

## §1.1 AI / ML / DL / 生成式 AI

- **AI（人工智能）**：让机器表现出智能行为的总称，包括规则系统。
- **ML（机器学习）**：AI 的子集，从数据中学习规律，而不是人工写规则。
  - 监督学习（有标签：分类、回归）、无监督学习（无标签：聚类、降维）、强化学习（奖励信号）。
- **DL（深度学习）**：ML 的子集，用多层神经网络自动学习特征；数据量和算力越大效果越好 → 这是 GPU 需求的来源。
- **生成式 AI（Generative AI）**：生成新内容（文本、图像、代码、音频）的模型，典型是 LLM（大语言模型）和扩散模型。
- **Agentic AI（智能体）**：LLM + 工具调用 + 规划 / 多步执行，能自主完成任务。

**必会**：AI ⊃ ML ⊃ DL；LLM 基于 **Transformer + 自注意力（self-attention）**。

## §1.2 AI 工作流：训练 vs 推理

典型端到端流程：**数据准备（采集/清洗/标注/ETL）→ 训练 → 优化（剪枝/量化/TensorRT）→ 部署推理 → 监控与再训练**。

| | 训练（Training） | 推理（Inference） |
| --- | --- | --- |
| 做什么 | 前向 + 反向传播，更新权重 | 只做前向，权重固定 |
| 算力 | 极高、持续数天到数月，多 GPU / 多节点 | 单次计算量小，但请求量大、长期运行 |
| 关注指标 | 训练时间、吞吐（samples/s）、扩展效率 | 延迟、吞吐、每 token 成本、并发 |
| 精度 | BF16/FP16 混合精度，FP8（Hopper+） | FP16/FP8/INT8/INT4/FP4 量化 |
| 典型基础设施 | DGX/HGX 集群 + InfiniBand + 并行文件系统 | 从单 GPU 到多 GPU 服务器，边缘设备，Kubernetes |

术语：**epoch**（完整遍历一次训练集）、**batch / mini-batch**、**learning rate**、**checkpoint**（定期保存训练状态，用于故障恢复）、
**fine-tuning**（在预训练模型上用领域数据继续训练）、**transfer learning**。

## §1.3 为什么用 GPU：CPU vs GPU

- **CPU**：少量强核心，大缓存，擅长低延迟的串行/分支复杂任务（"延迟优化"）。
- **GPU**：成千上万个简单核心，SIMT（单指令多线程）大规模并行，高显存带宽（HBM），擅长矩阵乘这类数据并行计算（"吞吐优化"）。
- 深度学习的核心是**矩阵乘加（GEMM）**，天然并行 → GPU 快几十到上百倍。
- **CUDA Core**：通用标量浮点/整数运算单元。
- **Tensor Core**：专门做矩阵乘加（MMA）的单元，**Volta（V100）首次引入**，支持混合精度。
- **RT Core**：光线追踪单元（Turing 起），跟 AI 训练无关——常见干扰项。
- 访存密集 vs 计算密集：本仓库 [vector_add 达到理论显存带宽 ~90%](../local-gpu/benchmark.md) 就是典型访存密集任务，它的上限是**带宽**而不是算力。

## §1.4 数值精度

| 格式 | 位宽 | 指数位 | 特点 / 用途 |
| --- | --- | --- | --- |
| FP64 | 64 | 11 | HPC 科学计算 |
| FP32 | 32 | 8 | 传统训练基线，主权重（master weights） |
| TF32 | 19（内部） | 8 | **Ampere 引入**的 Tensor Core 计算模式，FP32 输入自动加速，无需改代码 |
| BF16 | 16 | 8 | 与 FP32 **同样的动态范围**，训练更稳定，无需 loss scaling |
| FP16 | 16 | 5 | 范围小，训练需 **loss scaling** 防下溢 |
| FP8 | 8 | E4M3 / E5M2 | **Hopper Transformer Engine** 引入，训练和推理都可用 |
| FP4 / NVFP4 | 4 | — | **Blackwell** 第二代 Transformer Engine，主要用于推理 |
| INT8 / INT4 | 8 / 4 | — | 推理量化（需校准 calibration） |

- **混合精度训练（AMP）**：低精度做矩阵运算 + FP32 保存主权重 → 速度快、显存省、精度基本不变。
- **量化（Quantization）**：把权重/激活转成更低位宽 → 显存占用更小、吞吐更高，可能有少量精度损失。
- **结构化稀疏（2:4 sparsity）**：Ampere 引入，Tensor Core 可跳过一半的零值。

## §1.5 GPU 架构代际（必背表）

| 架构 | 代表产品 | 年份 | 关键新特性（考点） |
| --- | --- | --- | --- |
| Pascal | P100 | 2016 | 第一代 NVLink、HBM2 |
| Volta | V100 | 2017 | **第一代 Tensor Core** |
| Turing | T4 | 2018 | INT8/INT4 Tensor Core、RT Core；T4 是经典低功耗推理卡 |
| Ampere | A100、A30、A10 | 2020 | **MIG（最多 7 个实例）**、TF32、2:4 稀疏、第三代 NVLink（600 GB/s） |
| Ada Lovelace | L4、L40S、RTX 40 系列（含本机 RTX 4070） | 2022 | 第四代 Tensor Core 支持 FP8；L4 = 72W 低功耗推理/视频 |
| Hopper | H100、H200 | 2022 | **Transformer Engine（FP8）**、第四代 NVLink（900 GB/s）、机密计算、DPX 指令；H200 = 更大更快的 HBM3e |
| Grace Hopper | GH200 | 2023 | Grace CPU + Hopper GPU，**NVLink-C2C（900 GB/s）** 一致性互联 |
| Blackwell | B200、GB200、B300/GB300 | 2024–25 | **第二代 Transformer Engine（FP4）**、第五代 NVLink（1.8 TB/s）、GB200 NVL72 机柜级 NVLink 域 |

还要知道：**Grace** 是 NVIDIA 的 Arm 架构数据中心 CPU；**Vera Rubin** 是 Blackwell 之后的路线图代号（考试一般不深入考）。

## §1.6 NVIDIA 软件栈（分层记）

```
应用 / 行业方案   NIM、NeMo、Riva(语音)、Clara(医疗)、Isaac(机器人)、Metropolis(视觉)、Morpheus(安全)
企业平台           NVIDIA AI Enterprise（受支持的生产级软件套件，订阅授权）
容器 / 分发        NGC Catalog（GPU 优化容器、预训练模型、Helm chart）
框架               PyTorch、TensorFlow、JAX；RAPIDS（数据科学）；DALI（数据加载）
加速库             cuDNN（DNN 原语）、cuBLAS（线性代数）、NCCL（多 GPU 集合通信）、TensorRT（推理优化）
平台               CUDA Toolkit（编译器 nvcc、运行时）
驱动               NVIDIA GPU Driver（宿主机唯一必须装的东西）
```

| 名字 | 一句话 | 易混淆 |
| --- | --- | --- |
| **CUDA** | 并行计算平台和编程模型 | 不是一张卡也不是一个框架 |
| **cuDNN** | 卷积、注意力、归一化等 DNN 原语加速库 | 框架底层调用，用户一般不直接用 |
| **NCCL**（读作 nickel） | all-reduce / all-gather / broadcast 等多 GPU、多节点集合通信 | 不是调度器 |
| **TensorRT** | 推理优化器 + 运行时：层融合、精度校准（INT8/FP8）、kernel 自动选择 | 优化模型，不负责对外服务 |
| **TensorRT-LLM** | 专为 LLM 推理优化（in-flight batching、paged KV cache、量化） | |
| **Triton Inference Server** | 开源推理**服务**：多框架、多模型并发、**动态批处理**、HTTP/gRPC、Prometheus 指标 | 与 TensorRT 搭配：TensorRT 优化，Triton 服务 |
| **NIM** | 预打包、预优化的推理微服务容器，提供标准（OpenAI 兼容）API，"几分钟部署模型" | NIM 内部可以用 TensorRT-LLM/Triton 等 |
| **NeMo** | 构建、定制（微调）、部署生成式 AI 的端到端框架（含 Curator、Guardrails 等） | |
| **RAPIDS** | GPU 加速数据科学：cuDF（类 pandas）、cuML（类 scikit-learn）、cuGraph | 不是训练深度网络的 |
| **DALI** | GPU 上的数据加载与增强，解决 CPU 预处理瓶颈 | |
| **NGC** | GPU 优化软件的目录/仓库（容器每月更新、经过测试） | |
| **NVIDIA AI Enterprise** | 企业级、有支持、有安全维护的 AI 软件套件，可跑在本地/云/边缘 | 需要授权 |
| **Magnum IO** | 数据中心 IO 加速的伞形名称：GPUDirect RDMA/Storage、NCCL、NVSHMEM、UCX 等 | |

## §1.7 规模化训练：并行策略

- **数据并行（Data Parallel）**：每张 GPU 一份完整模型，把 mini-batch 切分；反向后用 **all-reduce** 同步梯度。最常用。
- **张量并行（Tensor Parallel）**：把单层的矩阵切到多 GPU；通信极频繁 → 通常放在**节点内 NVLink** 范围内。
- **流水线并行（Pipeline Parallel）**：按层切成多个 stage 放在不同 GPU，用 micro-batch 减少"气泡"。
- **模型放不进单卡显存** → 用模型并行（张量/流水线）、ZeRO/FSDP 分片，或量化。
- **扩展效率下降**的常见原因：节点间通信（梯度同步）开销、网络带宽不足、存储 IO 跟不上、负载不均。
- 估算显存：参数量 × 每参数字节数。例：70B 参数 × 2 字节（FP16/BF16）≈ **140 GB 权重**，单张 80 GB 卡放不下（推理还需要 KV cache）。
  训练时还要加梯度和优化器状态（Adam 混合精度大约 16 字节/参数）。

## §1.8 生成式 AI 与 LLM 推理

- **预训练（pretraining）**：海量数据从零训练基础模型，成本最高。
- **微调（fine-tuning）**：领域数据继续训练；**PEFT / LoRA**：冻结原权重，只训练小的低秩适配矩阵，便宜得多。
- **RAG（检索增强生成）**：把企业文档切块 → embedding → 存入**向量数据库** → 提问时检索相关片段拼进 prompt。
  **数据经常变、不想重训** → 选 RAG。
- **推理指标**：
  - **TTFT**（Time To First Token）：首 token 延迟，用户感受到的"开始回答"等待时间。
  - **TPOT / ITL**（每个输出 token 的间隔）：决定"打字速度"。
  - **吞吐**：tokens/s 或 requests/s（整机）。
  - 增大 batch：吞吐↑，单请求延迟通常↑ —— 延迟与吞吐的权衡。
- **KV cache**：缓存注意力的 K/V，长上下文和高并发时吃大量显存。

## §1.9 行业方案与边缘（了解）

- **Jetson**：嵌入式/机器人边缘 AI 模组；**IGX**：工业/医疗边缘平台；**Fleet Command**：边缘设备远程部署与管理。
- **Omniverse**：3D 协作与数字孪生平台；**Clara** 医疗；**Isaac** 机器人；**Metropolis** 智能视频分析；**Riva** 语音 AI。

---

### 我的补充（做错题后在这里写一句话）

- 
