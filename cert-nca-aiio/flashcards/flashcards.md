# NCA-AIIO 速记卡 · Flashcards（736 张，中英双语）

> 由 `build.js` 从 `cards-*.js` 生成，请勿手改。翻卡和记录熟练度请用同目录的 [index.html](index.html)（可切换 双语 / 中文 / EN）；Anki 用户导入 [anki-import.txt](anki-import.txt)。

## 牌组 Decks

| 领域 Domain | 牌组 Deck | 张数 |
| --- | --- | --- |
| 领域 1 · AI 基础知识 · Essential AI Knowledge | [AI / ML / DL 基础概念 · AI / ML / DL fundamentals](#ai-basics) | 36 |
| 领域 1 · AI 基础知识 · Essential AI Knowledge | [训练、推理与 AI 工作流 · Training, inference & AI workflow](#workflow) | 25 |
| 领域 1 · AI 基础知识 · Essential AI Knowledge | [GPU 硬件原理 · GPU hardware principles](#gpu-hw) | 31 |
| 领域 1 · AI 基础知识 · Essential AI Knowledge | [GPU 架构代际与产品 · GPU generations & products](#gpu-gen) | 28 |
| 领域 1 · AI 基础知识 · Essential AI Knowledge | [数值精度与量化 · Numeric precision & quantization](#precision) | 20 |
| 领域 1 · AI 基础知识 · Essential AI Knowledge | [NVIDIA 软件栈 · NVIDIA software stack](#sw-stack) | 55 |
| 领域 1 · AI 基础知识 · Essential AI Knowledge | [分布式训练与集合通信 · Distributed training & collectives](#parallel) | 30 |
| 领域 1 · AI 基础知识 · Essential AI Knowledge | [生成式 AI 与 LLM 推理 · Generative AI & LLM inference](#genai) | 38 |
| 领域 1 · AI 基础知识 · Essential AI Knowledge | [行业方案与边缘平台 · Industry solutions & edge platforms](#industry) | 19 |
| 领域 2 · AI 基础设施 · AI Infrastructure | [计算节点与系统 · Compute nodes & systems](#compute) | 24 |
| 领域 2 · AI 基础设施 · AI Infrastructure | [节点内互联（PCIe / NVLink / NVSwitch） · Intra-node interconnect (PCIe / NVLink / NVSwitch)](#interconnect) | 23 |
| 领域 2 · AI 基础设施 · AI Infrastructure | [网络：InfiniBand 与 RDMA · Networking: InfiniBand & RDMA](#network-ib) | 26 |
| 领域 2 · AI 基础设施 · AI Infrastructure | [网络：以太网、拓扑与四张网 · Networking: Ethernet, topology & the four networks](#network-eth) | 27 |
| 领域 2 · AI 基础设施 · AI Infrastructure | [GPUDirect 与 Magnum IO · GPUDirect & Magnum IO](#gpudirect) | 10 |
| 领域 2 · AI 基础设施 · AI Infrastructure | [DPU（BlueField） · DPU (BlueField)](#dpu) | 12 |
| 领域 2 · AI 基础设施 · AI Infrastructure | [存储 · Storage](#storage) | 18 |
| 领域 2 · AI 基础设施 · AI Infrastructure | [机房：供电、散热与空间 · Data center: power, cooling & space](#datacenter) | 25 |
| 领域 2 · AI 基础设施 · AI Infrastructure | [参考架构与部署选择 · Reference architectures & deployment choices](#deploy) | 20 |
| 领域 3 · AI 运维 · AI Operations | [nvidia-smi 与 NVML · nvidia-smi & NVML](#nvidia-smi) | 24 |
| 领域 3 · AI 运维 · AI Operations | [DCGM 与监控体系 · DCGM & monitoring](#dcgm) | 30 |
| 领域 3 · AI 运维 · AI Operations | [XID、ECC 与硬件故障 · XID, ECC & hardware faults](#xid) | 24 |
| 领域 3 · AI 运维 · AI Operations | [Slurm 与 HPC 调度 · Slurm & HPC scheduling](#slurm) | 29 |
| 领域 3 · AI 运维 · AI Operations | [Kubernetes 与 GPU 编排 · Kubernetes & GPU orchestration](#k8s) | 34 |
| 领域 3 · AI 运维 · AI Operations | [GPU 共享与虚拟化 · GPU sharing & virtualization](#sharing) | 25 |
| 领域 3 · AI 运维 · AI Operations | [容器与 CUDA 兼容性 · Containers & CUDA compatibility](#containers) | 18 |
| 领域 3 · AI 运维 · AI Operations | [运维流程与排障 · Operations processes & troubleshooting](#ops) | 33 |
| 缩写速查 · Acronyms | [缩写速查（跨领域） · Acronyms (cross-domain)](#acronyms) | 52 |

## 领域 1 · AI 基础知识 · Essential AI Knowledge

<a id="ai-basics"></a>
### AI / ML / DL 基础概念 · AI / ML / DL fundamentals（36）

| 正面 Front | 背面 Back |
| --- | --- |
| **How are AI, ML, and DL related?**<br>AI、ML、DL 的包含关系 | AI ⊃ ML ⊃ DL. ML learns patterns from data; DL is ML that uses multi-layer neural networks.<br>AI ⊃ ML ⊃ DL。ML 从数据学规律；DL 是用多层神经网络的 ML。 |
| **Artificial Intelligence (AI)**<br>人工智能 | The umbrella term for machines showing intelligent behavior, including rule-based systems, search, and machine learning.<br>让机器表现出智能行为的总称，包括规则系统、搜索、机器学习等。 |
| **Machine Learning (ML)**<br>机器学习 | Learning patterns from data to make predictions or decisions instead of hand-coding rules.<br>从数据中学习模式来做预测或决策，而不是人工写死规则。 |
| **Deep Learning (DL)**<br>深度学习 | Uses deep (multi-layer) neural networks to learn features automatically; improves with more data and compute, which drives GPU demand.<br>用多层神经网络自动学习特征表示；数据和算力越多效果越好，是 GPU 需求的主要来源。 |
| **Supervised learning**<br>监督学习 | Training data has labels (input → correct answer). Typical tasks: classification and regression.<br>训练数据带标签（输入→正确答案）。典型任务：分类、回归。 |
| **Unsupervised learning**<br>无监督学习 | Data has no labels; the model finds structure itself. Typical tasks: clustering, dimensionality reduction, anomaly detection.<br>数据没有标签，模型自己发现结构。典型：聚类、降维、异常检测。 |
| **Reinforcement learning**<br>强化学习 | An agent acts in an environment and learns a policy from reward signals. Used in robotics, games, and RLHF.<br>智能体在环境中行动，根据奖励信号学习策略。用于机器人、游戏、RLHF。 |
| **Self-supervised learning**<br>自监督学习 | Builds the training signal from the data itself (e.g., predict the next token or a masked word). This is how LLMs are pretrained.<br>从数据本身构造监督信号（例如预测下一个 token、遮盖词），LLM 预训练就是这种方式。 |
| **Classification vs regression**<br>分类 vs 回归 | Classification outputs a discrete class (cat/dog); regression outputs a continuous value (house price).<br>分类：输出离散类别（猫/狗）；回归：输出连续数值（房价）。 |
| **Clustering**<br>聚类 | Automatically groups similar samples without labels, e.g., customer segmentation.<br>把相似样本自动分组，无需标签。例：客户分群。 |
| **Neural network**<br>神经网络 | A model made of layers of neurons (weighted sum + activation function); its parameters are weights and biases.<br>由层层神经元（加权求和 + 激活函数）组成的模型，参数是权重和偏置。 |
| **Weights and biases**<br>权重与偏置 | The trained parameters of a neural network. "70B parameters" counts these values.<br>神经网络中训练得到的参数。“参数量 70B”指的就是这些数值的个数。 |
| **Activation function**<br>激活函数 | Adds non-linearity (ReLU, GELU, sigmoid). Without it, stacked layers collapse into one linear transform.<br>给网络引入非线性，例如 ReLU、GELU、Sigmoid。没有它，多层网络等价于一层线性变换。 |
| **Loss function**<br>损失函数 | Measures the gap between predictions and true values; training minimizes it. Examples: cross-entropy, mean squared error.<br>衡量模型预测和真实值差距的函数，训练目标是最小化它。例：交叉熵、均方误差。 |
| **Gradient descent**<br>梯度下降 | Updates parameters in the opposite direction of the loss gradient to reduce loss step by step.<br>沿损失函数梯度的反方向更新参数，逐步降低损失。 |
| **Backpropagation**<br>反向传播 | Uses the chain rule to compute each parameter's gradient from the output layer backward. Core of training; not needed for inference.<br>用链式法则从输出层往回计算每个参数的梯度，是训练的核心步骤，推理时不需要。 |
| **Optimizer**<br>优化器 | The algorithm that turns gradients into parameter updates (SGD, Adam, AdamW). Adam stores two extra states per parameter (momentum and variance).<br>决定如何用梯度更新参数的算法，例如 SGD、Adam、AdamW。Adam 需要额外保存两份状态（动量和方差）。 |
| **Learning rate**<br>学习率 | Step size of each parameter update. Too large fails to converge; too small trains slowly.<br>每次参数更新的步长。太大不收敛，太小训练慢。 |
| **Hyperparameter**<br>超参数 | Settings chosen before training rather than learned: learning rate, batch size, number of layers, epochs.<br>训练前人为设定、不由训练学习的配置：学习率、batch size、层数、epoch 数等。 |
| **Epoch** | One complete pass through the training dataset.<br>完整遍历一次训练数据集。 |
| **Batch / mini-batch**<br>批 / 小批量 | The group of samples processed in one forward and backward pass. Batch size affects memory use, throughput, and convergence.<br>一次前向+反向处理的一组样本。batch size 影响显存占用、吞吐和收敛。 |
| **Iteration / step**<br>迭代 / 步 | Processing one mini-batch and updating parameters once. Steps per epoch = dataset size ÷ batch size.<br>处理一个 mini-batch 并更新一次参数。1 个 epoch = 数据量 ÷ batch size 个 step。 |
| **Overfitting**<br>过拟合 | Great on training data, poor on new data because the model memorized noise. Fixes: more data, regularization, dropout, early stopping.<br>模型在训练集上很好、在新数据上差，记住了噪声。对策：更多数据、正则化、dropout、early stopping。 |
| **Underfitting**<br>欠拟合 | The model is too simple or undertrained and performs poorly even on training data.<br>模型太简单或训练不够，训练集上都表现差。 |
| **Training / validation / test sets**<br>训练集 / 验证集 / 测试集 | Training set learns parameters; validation set tunes hyperparameters and early stopping; test set gives the final, unseen evaluation.<br>训练集用于学参数；验证集调超参、早停；测试集最终评估，训练中不可见。 |
| **Convolutional neural network (CNN)**<br>卷积神经网络 | Uses convolution kernels to extract local features; strong for images and video.<br>用卷积核提取局部特征，擅长图像和视频。 |
| **RNN / LSTM**<br>循环神经网络 / 长短期记忆网络 | Process sequences step by step; used early for speech and text. Hard to parallelize over long sequences, largely replaced by Transformers.<br>按时间步处理序列的网络，早期用于语音和文本；长序列难并行，已大量被 Transformer 取代。 |
| **Transformer** | Architecture based on self-attention that processes a whole sequence in parallel. Basis of modern LLMs and ViTs.<br>基于自注意力（self-attention）的架构，可并行处理整个序列。现代 LLM、ViT 都基于它。 |
| **Self-attention**<br>自注意力 | Each token scores its relevance to every other token and takes a weighted sum; compute grows with the square of sequence length.<br>序列中每个 token 计算与其他所有 token 的相关性并加权汇总；计算量随序列长度平方增长。 |
| **Foundation model**<br>基础模型 | A large model pretrained on massive data that can be adapted to many downstream tasks, e.g., LLMs and vision foundation models.<br>在海量数据上预训练、可适配多种下游任务的大模型，例如 LLM、视觉大模型。 |
| **Generative AI**<br>生成式 AI | Models that create new content (text, images, code, audio, video), such as LLMs and diffusion models.<br>生成新内容（文本、图像、代码、音频、视频）的模型，如 LLM、扩散模型。 |
| **Diffusion model**<br>扩散模型 | Generates images or video by progressively denoising random noise.<br>通过逐步去噪从随机噪声生成图像/视频的生成模型。 |
| **Agentic AI**<br>智能体 AI | An LLM combined with planning, tool use, and memory that completes multi-step tasks autonomously.<br>LLM 结合规划、工具调用、记忆，能自主多步完成任务。 |
| **Computer vision**<br>计算机视觉 | Machines understanding images and video: classification, detection, segmentation, tracking.<br>让机器理解图像和视频：分类、检测、分割、跟踪。 |
| **Natural language processing (NLP)**<br>自然语言处理 | Processing human language: translation, summarization, question answering, sentiment analysis.<br>处理人类语言：翻译、摘要、问答、情感分析。 |
| **Recommender system**<br>推荐系统 | Recommends content from user behavior; uses huge embedding tables and data. NVIDIA's framework: Merlin.<br>根据用户行为推荐内容；大型 embedding 表，数据量大。NVIDIA 对应 Merlin。 |

<a id="workflow"></a>
### 训练、推理与 AI 工作流 · Training, inference & AI workflow（25）

| 正面 Front | 背面 Back |
| --- | --- |
| **Order of the end-to-end AI workflow**<br>AI 端到端工作流顺序 | Data preparation (collect/clean/label/ETL) → training → optimization (quantize/prune/TensorRT) → deployment for inference → monitoring and retraining.<br>数据准备（采集/清洗/标注/ETL）→ 训练 → 优化（量化/剪枝/TensorRT）→ 部署推理 → 监控与再训练。 |
| **Training**<br>训练 | Forward + backward passes that repeatedly update weights. Huge compute over long periods, usually many GPUs and nodes.<br>前向 + 反向传播，反复更新权重。计算量极大、持续时间长，通常多 GPU / 多节点。 |
| **Inference**<br>推理 | Runs only the forward pass with fixed trained weights to produce predictions. Focus: latency, throughput, cost; runs continuously in production.<br>用训练好的固定权重只做前向计算，得到预测。关注延迟、吞吐、成本，长期在线运行。 |
| **Hardware priorities: training vs inference**<br>训练和推理的硬件侧重点 | Training: max compute, GPU memory, fast inter-node network, fast storage. Inference: latency, throughput per watt, cost, elastic scaling.<br>训练：最大算力、显存容量、节点间高速网络、高速存储。推理：延迟、吞吐/瓦、成本、弹性扩缩。 |
| **Pretraining**<br>预训练 | Training a foundation model from scratch on massive general data; the most expensive stage (thousands of GPUs, weeks to months).<br>在海量通用数据上从零训练基础模型，成本最高（成千上万 GPU、数周到数月）。 |
| **Fine-tuning**<br>微调 | Continuing to train a pretrained model on domain data to adapt it to a specific task.<br>在预训练模型基础上用领域数据继续训练，使其适配特定任务。 |
| **Transfer learning**<br>迁移学习 | Reusing knowledge learned on one task for another; fine-tuning is the most common form.<br>把在一个任务上学到的知识用于另一个任务，微调是最常见形式。 |
| **Data preparation**<br>数据准备 | Collecting, cleaning, deduplicating, labeling, and converting data. Often the most time-consuming stage; RAPIDS can accelerate it on GPUs.<br>采集、清洗、去重、标注、格式转换。常是最耗时的阶段，可用 RAPIDS 在 GPU 上加速。 |
| **ETL**<br>抽取-转换-加载 | Extract-Transform-Load. GPU acceleration via RAPIDS cuDF or the Spark RAPIDS Accelerator.<br>Extract-Transform-Load：抽取、转换、加载数据。GPU 加速可用 RAPIDS cuDF / Spark RAPIDS。 |
| **Data labeling**<br>数据标注 | Attaching correct answers to samples for supervised learning.<br>给样本加上正确答案，供监督学习使用。 |
| **Model optimization**<br>模型优化 | Shrinking and speeding up a model before deployment: quantization, pruning, distillation, layer fusion (TensorRT).<br>部署前减小模型、提高速度：量化、剪枝、蒸馏、层融合（TensorRT）。 |
| **Pruning**<br>剪枝 | Removing unimportant weights or structures to cut model size and compute.<br>移除不重要的权重或结构，减小模型和计算量。 |
| **Knowledge distillation**<br>知识蒸馏 | Training a small student model on a large teacher model's outputs so it approaches the teacher's quality.<br>用大模型（teacher）的输出训练小模型（student），小模型接近大模型效果。 |
| **Batch inference vs real-time inference**<br>批量推理 vs 实时推理 | Offline batch inference maximizes throughput (e.g., nightly jobs); online real-time inference minimizes latency (chat, recommendations).<br>批量离线推理追求吞吐（如夜间处理数据）；实时在线推理追求低延迟（如聊天、推荐）。 |
| **Latency**<br>延迟 | Time from sending one request to getting its result. A key metric for online services.<br>单个请求从发出到得到结果的时间。在线服务的关键指标。 |
| **Throughput**<br>吞吐 | Requests, samples, or tokens processed per unit of time.<br>单位时间处理的请求数、样本数或 token 数。 |
| **Latency vs throughput trade-off**<br>延迟与吞吐的权衡 | Larger batches raise GPU utilization and throughput, but each request waits and computes longer, so latency rises.<br>增大 batch 提高 GPU 利用率和吞吐，但单请求等待和计算时间变长，延迟上升。 |
| **Checkpoint**<br>检查点 | Periodically saved model weights and optimizer state, so training can resume from the latest checkpoint after an interruption.<br>定期保存模型权重和优化器状态，训练中断后可从最近检查点恢复。 |
| **Why large-scale training must checkpoint**<br>为什么大规模训练必须做 checkpoint | With thousands of GPUs running for weeks, hardware failures are near certain; without checkpoints you restart from scratch.<br>上千 GPU 长时间运行，硬件故障几乎必然发生；没有 checkpoint 就要从头训练。 |
| **Model drift**<br>模型漂移 | Real-world data shifts after deployment and accuracy drops; requires monitoring and retraining.<br>上线后真实数据分布变化导致效果下降，需要监控并再训练。 |
| **MLOps** | Applying DevOps practices to ML: data/model versioning, automated training pipelines, deployment, monitoring.<br>把 DevOps 实践用于机器学习：数据和模型版本管理、自动训练流水线、部署、监控。 |
| **Model registry**<br>模型仓库 | Stores and versions trained models with metadata for deployment.<br>存储和版本化训练好的模型及元数据，供部署使用。 |
| **MLPerf** | Industry-standard AI benchmarks from MLCommons, with Training and Inference categories.<br>MLCommons 发布的行业标准 AI 基准测试，分 Training 和 Inference 等类别。 |
| **Edge inference**<br>边缘推理 | Running inference near where data is produced (factory, car, camera): low latency, less bandwidth, better privacy.<br>在数据产生地附近（工厂、车、摄像头）推理：低延迟、省带宽、保护隐私。 |
| **Data center inference vs edge inference**<br>数据中心推理 vs 边缘推理 | Data center: large models, high concurrency, central management. Edge: power/size limits, offline capable, real-time.<br>数据中心：大模型、高并发、集中管理；边缘：功耗和体积受限、离线可用、实时性强。 |

<a id="gpu-hw"></a>
### GPU 硬件原理 · GPU hardware principles（31）

| 正面 Front | 背面 Back |
| --- | --- |
| **CPU vs GPU design goals**<br>CPU 与 GPU 的设计取向 | CPU: few powerful cores, large caches, high clocks; latency-optimized for serial, branch-heavy work. GPU: thousands of simple cores; throughput-optimized for data parallelism.<br>CPU：少量强核心、大缓存、高频率，延迟优化，擅长串行和复杂分支。GPU：成千上万简单核心，吞吐优化，擅长数据并行。 |
| **Why GPUs suit deep learning**<br>为什么 GPU 适合深度学习 | DL is dominated by large matrix multiply-accumulate operations that split into many independent parallel operations; GPUs have many cores and high memory bandwidth.<br>深度学习核心是大规模矩阵乘加，可拆成大量独立运算并行执行；GPU 并行核心多、显存带宽高。 |
| **Streaming Multiprocessor (SM)**<br>流式多处理器 | The GPU's basic compute unit, containing CUDA cores, Tensor Cores, registers, and shared memory/L1. A GPU has tens to hundreds of SMs.<br>GPU 的基本计算单元，内含 CUDA Core、Tensor Core、寄存器、共享内存/L1。GPU 由几十到上百个 SM 组成。 |
| **CUDA Core**<br>CUDA 核心 | Unit that executes general scalar floating-point and integer operations.<br>执行通用标量浮点/整数运算的单元。 |
| **Tensor Core**<br>张量核心 | Unit dedicated to matrix multiply-accumulate (MMA); introduced with Volta; the main engine of DL acceleration.<br>专门执行矩阵乘加（MMA）的单元，Volta 首次引入，深度学习加速的主力。 |
| **RT Core**<br>光线追踪核心 | Ray-tracing unit (since Turing) for graphics rendering; unrelated to AI training — a common distractor.<br>光线追踪加速单元（Turing 起），用于图形渲染，与 AI 训练无关——常见干扰项。 |
| **Warp**<br>线程束 | The basic GPU scheduling unit: 32 threads executing the same instruction together (SIMT).<br>GPU 调度的基本单位：32 个线程同时执行同一条指令（SIMT）。 |
| **SIMT**<br>单指令多线程 | Single Instruction, Multiple Threads: one instruction drives many threads working on different data.<br>Single Instruction, Multiple Threads：一条指令驱动多个线程处理不同数据。 |
| **CUDA kernel**<br>CUDA 内核函数 | A function executed in parallel on the GPU, launched as a grid → blocks → threads hierarchy.<br>在 GPU 上并行执行的函数，以 grid → block → thread 的层次启动。 |
| **Host vs device**<br>主机端 vs 设备端 | CUDA terms: host = CPU and its memory; device = GPU and its memory.<br>CUDA 术语：Host = CPU 及其内存；Device = GPU 及其显存。 |
| **High Bandwidth Memory (HBM)**<br>高带宽显存 | Stacked memory inside the GPU package with very high bandwidth; used by data center GPUs (A100 HBM2e, H100 HBM3, H200/B200 HBM3e).<br>堆叠在 GPU 封装内的高带宽显存，数据中心 GPU 使用（A100 HBM2e、H100 HBM3、H200/B200 HBM3e）。 |
| **GDDR memory**<br>GDDR 显存 | On-board memory with lower bandwidth and cost than HBM; used by L4, L40S, and RTX cards.<br>板载显存，带宽低于 HBM、成本低。用于 L4、L40S、RTX 系列等。 |
| **Memory bandwidth**<br>显存带宽 | Data read/written from GPU memory per second (TB/s). The bottleneck for memory-bound work such as LLM decode.<br>每秒能从显存读写的数据量（TB/s）。访存密集型任务（如 LLM decode）的瓶颈。 |
| **Compute-bound vs memory-bound**<br>计算密集 vs 访存密集 | Compute-bound: limited by FLOPS (large GEMMs). Memory-bound: limited by bandwidth (element-wise ops, LLM decode).<br>计算密集：受 FLOPS 限制（大矩阵乘）；访存密集：受带宽限制（逐元素运算、LLM decode）。 |
| **Arithmetic intensity**<br>算术强度 | Operations performed per byte moved (FLOPs/byte). Low → memory-bound; high → compute-bound.<br>每读写 1 字节数据做多少次运算（FLOPs/Byte）。低 → 访存瓶颈；高 → 计算瓶颈。 |
| **Roofline model**<br>屋顶线模型 | An analysis model that uses arithmetic intensity to decide whether performance is capped by compute or bandwidth.<br>用算术强度判断性能上限是算力还是带宽的分析模型。 |
| **FLOPS / TFLOPS / PFLOPS**<br>每秒浮点运算次数 | Floating-point operations per second. T = 10¹², P = 10¹⁵. When comparing, check the precision and whether sparsity is included.<br>每秒浮点运算次数。T = 10¹²，P = 10¹⁵。比较时要注意精度和是否含稀疏。 |
| **L2 cache**<br>二级缓存 | On-chip cache shared by all SMs; MIG also partitions L2 per instance.<br>所有 SM 共享的片上缓存；MIG 会把 L2 也按实例切分。 |
| **Shared memory**<br>共享内存 | Fast on-chip storage inside an SM shared by threads of one block; explicitly managed by the programmer.<br>SM 内、同一 block 线程共享的高速片上存储，程序员可显式管理。 |
| **Unified Memory**<br>统一内存 | CPU and GPU share one address space; data migrates on demand, simplifying programming.<br>CPU 和 GPU 共用一个地址空间，数据按需自动迁移，简化编程。 |
| **NVENC / NVDEC**<br>硬件视频编码 / 解码器 | Hardware video encode/decode engines on the GPU. Used for video analytics and transcoding, not training.<br>GPU 上的硬件视频编码 / 解码单元。视频分析、转码用，非训练用。 |
| **Copy engine**<br>拷贝引擎 | GPU unit that moves data (DMA) and can overlap with computation.<br>GPU 上负责数据搬运（DMA）的单元，可与计算重叠。 |
| **TDP / TGP**<br>设计功耗 | Designed GPU power limit. H100 SXM ≈ 700 W, H100 PCIe ≈ 350 W, L4 ≈ 72 W.<br>GPU 设计功耗上限。H100 SXM 约 700 W，H100 PCIe 约 350 W，L4 约 72 W。 |
| **GPU Boost and throttling**<br>GPU Boost 与降频 | The GPU adjusts clocks dynamically by power and thermal headroom; overheating or hitting the power cap triggers throttling.<br>GPU 根据功耗、温度余量动态调整频率；过热或触及功耗上限就会降频（throttle）。 |
| **Compute capability**<br>计算能力版本 | GPU architecture feature version: A100 = 8.0, Ada = 8.9, H100 = 9.0, B200 = 10.0. Compile targets (sm_XX) must match.<br>GPU 架构特性版本号：A100 = 8.0，Ada = 8.9，H100 = 9.0，B200 = 10.0。编译时 sm_XX 要匹配。 |
| **2:4 structured sparsity**<br>2:4 结构化稀疏 | Introduced in Ampere: when 2 of every 4 weights are zero, Tensor Cores skip them for up to ~2× throughput.<br>Ampere 引入：每 4 个权重中 2 个为零时，Tensor Core 可跳过，最高约 2 倍吞吐。 |
| **DPX instructions**<br>DPX 指令 | Hopper instructions that accelerate dynamic programming (genome alignment, route planning).<br>Hopper 引入的动态规划加速指令（基因组比对、路径规划等）。 |
| **Tensor Memory Accelerator (TMA)**<br>张量内存加速器 | Hopper hardware unit that moves large tensor blocks asynchronously, offloading the SMs.<br>Hopper 引入的硬件单元，异步搬运大块张量数据，减轻 SM 负担。 |
| **Confidential computing**<br>机密计算 | Supported from Hopper: data in use inside the GPU is encrypted and isolated from the host and administrators.<br>Hopper 起支持：GPU 内数据在使用中加密隔离，防止宿主机/管理员窥探。 |
| **RAS engine**<br>RAS 引擎 | Blackwell's reliability, availability, and serviceability engine for predictive fault detection and diagnostics.<br>Blackwell 引入的可靠性、可用性、可服务性引擎，用于预测性故障检测与诊断。 |
| **Decompression engine**<br>解压引擎 | Blackwell hardware decompression engine that accelerates data analytics and database queries.<br>Blackwell 引入的硬件解压引擎，加速数据分析/数据库查询。 |

<a id="gpu-gen"></a>
### GPU 架构代际与产品 · GPU generations & products（28）

| 正面 Front | 背面 Back |
| --- | --- |
| **Data center GPU architecture order**<br>数据中心 GPU 架构代际顺序 | Pascal → Volta → Turing → Ampere → (Ada Lovelace) → Hopper → Blackwell → Rubin (roadmap).<br>Pascal → Volta → Turing → Ampere → (Ada Lovelace) → Hopper → Blackwell → Rubin（路线图）。 |
| **Pascal (P100, 2016)** | First-generation NVLink; HBM2.<br>第一代 NVLink，HBM2。 |
| **Volta (V100, 2017)** | First-generation Tensor Cores; NVLink 2 (300 GB/s).<br>第一代 Tensor Core；NVLink 2（300 GB/s）。 |
| **Turing (T4, 2018)** | INT8/INT4 Tensor Cores and RT Cores. T4 is the classic 70 W low-power inference card (16 GB).<br>INT8/INT4 Tensor Core、RT Core。T4 是经典 70 W 低功耗推理卡（16 GB）。 |
| **Ampere (A100, 2020)** | MIG (up to 7 instances), TF32, 2:4 structured sparsity, 3rd-gen Tensor Cores, NVLink 3 (600 GB/s).<br>MIG（最多 7 实例）、TF32、2:4 结构化稀疏、第三代 Tensor Core、NVLink 3（600 GB/s）。 |
| **A100 memory options**<br>A100 显存规格 | 40 GB HBM2 (~1.6 TB/s) or 80 GB HBM2e (~2 TB/s).<br>40 GB HBM2（~1.6 TB/s）或 80 GB HBM2e（~2 TB/s）。 |
| **A30** | Mainstream Ampere compute card, 24 GB HBM2, supports MIG (up to 4 instances).<br>Ampere 主流计算卡，24 GB HBM2，支持 MIG（最多 4 个实例）。 |
| **A10 / A10G** | Ampere, 24 GB GDDR6, for inference and graphics; A10G is the variant in AWS g5 instances.<br>Ampere 24 GB GDDR6，推理与图形；A10G 是 AWS g5 实例里的变体。 |
| **Ada Lovelace (L4 / L40S / RTX 40)** | 4th-gen Tensor Cores with FP8; aimed at inference, graphics, and video. The RTX 4070 in this repo is Ada.<br>第四代 Tensor Core，支持 FP8；面向推理、图形、视频。本仓库的 RTX 4070 就是 Ada。 |
| **L4** | Ada, 24 GB GDDR6, ~72 W, low-profile single slot. Efficient inference and video processing.<br>Ada，24 GB GDDR6，约 72 W，半高单槽。高效推理和视频处理。 |
| **L40S** | Ada, 48 GB GDDR6, ~350 W. General-purpose AI (inference, small-scale training) plus graphics/Omniverse.<br>Ada，48 GB GDDR6，约 350 W。通用 AI（推理、小规模训练）+ 图形/Omniverse。 |
| **Hopper (H100, 2022)** | Transformer Engine (FP8), 4th-gen Tensor Cores, NVLink 4 (900 GB/s), confidential computing, 2nd-gen MIG, DPX.<br>Transformer Engine（FP8）、第四代 Tensor Core、NVLink 4（900 GB/s）、机密计算、第二代 MIG、DPX。 |
| **H100 SXM vs H100 PCIe** | SXM: 80 GB HBM3, ~3.35 TB/s, ~700 W, NVSwitch all-to-all. PCIe: 80 GB, lower bandwidth, ~350 W, standard servers.<br>SXM：80 GB HBM3、~3.35 TB/s、~700 W、NVSwitch 全互联。PCIe：80 GB、更低带宽、~350 W、标准服务器。 |
| **H100 NVL** | PCIe H100 for LLM inference, paired via NVLink bridge, with more memory (94 GB per card).<br>面向 LLM 推理的 PCIe 版 H100，成对用 NVLink bridge 连接，显存更大（94 GB/卡）。 |
| **H200** | Hopper with 141 GB HBM3e and ~4.8 TB/s. Mainly more memory and bandwidth than H100, which helps LLM inference.<br>Hopper 架构，141 GB HBM3e、~4.8 TB/s。相比 H100 主要提升显存容量和带宽，利好 LLM 推理。 |
| **Grace CPU** | NVIDIA's Arm-based data center CPU with LPDDR5X memory and high efficiency.<br>NVIDIA 的 Arm 架构数据中心 CPU，LPDDR5X 内存，高能效。 |
| **GH200 Grace Hopper Superchip** | Grace CPU + H100/H200 GPU over coherent NVLink-C2C (900 GB/s); the GPU can access large CPU memory directly.<br>Grace CPU + H100/H200 GPU，通过 NVLink-C2C（900 GB/s）一致性互联，GPU 可直接访问大容量 CPU 内存。 |
| **Blackwell (B200, 2024)** | 2nd-gen Transformer Engine (FP4/FP6), NVLink 5 (1.8 TB/s), dual-die design, RAS engine, decompression engine.<br>第二代 Transformer Engine（FP4/FP6）、NVLink 5（1.8 TB/s）、双芯片设计、RAS 引擎、解压引擎。 |
| **B200 memory**<br>B200 显存 | About 180–192 GB HBM3e at ~8 TB/s; a DGX B200 has 1,440 GB across 8 GPUs.<br>约 180–192 GB HBM3e、~8 TB/s；DGX B200 整机 8 卡共 1,440 GB。 |
| **GB200 Superchip** | 1 Grace CPU + 2 B200 GPUs connected by NVLink-C2C.<br>1 颗 Grace CPU + 2 颗 B200 GPU，NVLink-C2C 连接。 |
| **GB200 NVL72** | Liquid-cooled rack: 36 Grace CPUs + 72 Blackwell GPUs in one NVLink domain, acting like one giant GPU for trillion-parameter LLMs.<br>液冷机柜：36 Grace + 72 Blackwell GPU，在同一个 NVLink 域内，像一块巨型 GPU，面向万亿参数 LLM。 |
| **Blackwell Ultra (B300 / GB300)** | Enhanced Blackwell with larger HBM3e (~288 GB) and stronger FP4 inference.<br>Blackwell 增强版：更大 HBM3e（约 288 GB）、更强 FP4 推理。 |
| **Rubin / Vera Rubin** | The GPU architecture after Blackwell (Vera is the companion CPU). Roadmap level; know the name only.<br>Blackwell 之后的 GPU 架构代号（Vera 为配套 CPU）。路线图级别，了解即可。 |
| **Data center GPUs vs consumer GPUs**<br>数据中心卡 vs 消费级卡 | Data center: ECC, MIG, NVLink/NVSwitch, long-term driver support, 24×7 design, full DCGM support. Consumer (GeForce) cards are not built for data center deployment.<br>数据中心卡：ECC、MIG、NVLink/NVSwitch、长期驱动支持、7×24 设计、DCGM 完整支持。消费卡（GeForce）不面向数据中心部署。 |
| **RTX PRO professional GPUs**<br>RTX PRO 专业卡 | Workstation cards for graphics + AI (formerly Quadro), supporting vGPU virtual workstation use.<br>面向工作站和图形 + AI 的专业卡（原 Quadro 系列），支持 vGPU 图形工作站场景。 |
| **Jetson (Orin / Thor)** | Embedded edge AI modules for robots, drones, and smart cameras.<br>嵌入式边缘 AI 模组，用于机器人、无人机、智能摄像头。 |
| **DGX Spark / DGX Station** | Desktop AI development machines (Grace Blackwell) for local prototyping before moving to the data center.<br>桌面级 AI 开发机（Grace Blackwell），本地原型开发后再迁移到数据中心。 |
| **"First introduced in" cheat sheet**<br>“首次引入”速记 | NVLink = Pascal; Tensor Core = Volta; RT Core = Turing; MIG/TF32/sparsity = Ampere; FP8 Transformer Engine = Hopper; FP4/NVLink 5 = Blackwell.<br>NVLink=Pascal；Tensor Core=Volta；RT Core=Turing；MIG/TF32/稀疏=Ampere；FP8 Transformer Engine=Hopper；FP4/NVLink5=Blackwell。 |

<a id="precision"></a>
### 数值精度与量化 · Numeric precision & quantization（20）

| 正面 Front | 背面 Back |
| --- | --- |
| **FP64**<br>双精度浮点 | Double precision. Required for scientific computing/HPC; rarely used in DL.<br>双精度。科学计算/HPC 必需，深度学习基本不用。 |
| **FP32**<br>单精度浮点 | Single precision: 8 exponent + 23 mantissa bits. Traditional training baseline; holds master weights in mixed precision.<br>单精度，8 位指数 + 23 位尾数。传统训练基线，混合精度中保存主权重。 |
| **TF32** | Ampere Tensor Core math mode: 8-bit exponent (FP32 range) + 10-bit mantissa. Speeds up FP32 code with no code changes.<br>Ampere 引入的 Tensor Core 计算模式：8 位指数（同 FP32 范围）+ 10 位尾数。FP32 代码无需修改即可加速。 |
| **BF16 (bfloat16)** | 16 bits: 8 exponent + 7 mantissa bits. Same dynamic range as FP32, stable training, usually no loss scaling needed.<br>16 位：8 位指数 + 7 位尾数。与 FP32 动态范围相同，训练稳定，一般不需要 loss scaling。 |
| **FP16 (half precision)**<br>半精度 | 16 bits: 5 exponent + 10 mantissa bits. More precision than BF16 but smaller range; training needs loss scaling to avoid underflow.<br>16 位：5 位指数 + 10 位尾数。精度比 BF16 高但范围小，训练需要 loss scaling 防下溢。 |
| **FP8 (E4M3 / E5M2)** | Introduced with Hopper. E4M3 has more precision (often forward pass); E5M2 has more range (often gradients). Managed by the Transformer Engine.<br>Hopper 引入。E4M3 精度高（常用于前向），E5M2 范围大（常用于梯度）。由 Transformer Engine 管理。 |
| **FP4 / NVFP4** | 4-bit floating point supported by Blackwell, mainly for inference, with block-level scale factors to preserve accuracy.<br>Blackwell 支持的 4 位浮点，主要用于推理，配合块级缩放因子保持精度。 |
| **FP6** | 6-bit floating point supported by Blackwell, between FP8 and FP4.<br>Blackwell 支持的 6 位浮点格式，介于 FP8 和 FP4 之间。 |
| **INT8** | 8-bit integer, common for inference quantization; requires calibration to set scale factors.<br>8 位整数，推理量化常用；需要校准（calibration）确定缩放因子。 |
| **INT4** | 4-bit integer, common for LLM weight quantization (AWQ, GPTQ); 1/4 the memory of FP16.<br>4 位整数，LLM 权重量化常用（如 AWQ、GPTQ），显存减为 FP16 的 1/4。 |
| **Mixed precision training**<br>混合精度训练 | Matrix math in FP16/BF16 on Tensor Cores while keeping FP32 master weights: faster, less memory, accuracy essentially unchanged.<br>矩阵运算用 FP16/BF16（Tensor Core 加速），保留 FP32 主权重。更快、更省显存、精度基本不变。 |
| **Automatic Mixed Precision (AMP)**<br>自动混合精度 | The framework picks each operator's precision automatically, e.g., PyTorch torch.autocast.<br>框架自动选择每个算子的精度，例如 PyTorch torch.autocast。 |
| **Loss scaling**<br>损失缩放 | In FP16 training, multiply the loss by a factor so small gradients don't underflow to zero, then unscale before the update.<br>FP16 训练时把损失乘一个系数，防止小梯度下溢为 0，更新前再缩回。 |
| **Transformer Engine** | Hopper/Blackwell hardware+software feature that dynamically picks FP8 (or FP4) vs higher precision per layer and manages scale factors.<br>Hopper/Blackwell 的软硬件结合特性，按层动态选择 FP8（或 FP4）与更高精度，并管理缩放因子。 |
| **Quantization**<br>量化 | Converting weights/activations from high to low precision (FP8/INT8/INT4/FP4): less memory, more throughput, possible small accuracy loss.<br>把权重/激活从高精度转为低精度（FP8/INT8/INT4/FP4）：显存↓、吞吐↑，可能有少量精度损失。 |
| **Post-Training Quantization (PTQ)**<br>训练后量化 | Quantize directly after training using a small calibration set; low cost.<br>训练完直接量化，用少量校准数据，成本低。 |
| **Quantization-Aware Training (QAT)**<br>量化感知训练 | Simulates quantization error during training; smaller accuracy loss but requires extra training.<br>训练时模拟量化误差，精度损失更小但需要再训练。 |
| **Calibration**<br>校准 | Uses representative data to measure activation ranges and set quantization scale factors. Needed for TensorRT INT8.<br>用代表性数据统计激活分布，确定量化缩放因子。TensorRT INT8 需要。 |
| **Bytes per parameter**<br>每参数字节数 | FP32 = 4, FP16/BF16 = 2, FP8/INT8 = 1, INT4/FP4 = 0.5.<br>FP32 = 4，FP16/BF16 = 2，FP8/INT8 = 1，INT4/FP4 = 0.5。 |
| **Cost of lower precision**<br>低精度的代价 | Less dynamic range or resolution, which can hurt convergence or accuracy; compensate with scaling, calibration, or QAT.<br>动态范围或分辨率下降，可能影响收敛或精度；需要缩放、校准或 QAT 补偿。 |

<a id="sw-stack"></a>
### NVIDIA 软件栈 · NVIDIA software stack（55）

| 正面 Front | 背面 Back |
| --- | --- |
| **GPU software stack layers (bottom to top)**<br>GPU 软件栈分层（自下而上） | GPU driver → CUDA (runtime + CUDA-X libraries) → frameworks (PyTorch/TF/JAX) → platforms and services (NGC, AI Enterprise, NIM) → applications.<br>GPU 驱动 → CUDA（运行时 + CUDA-X 库）→ 框架（PyTorch/TF/JAX）→ 平台与服务（NGC、AI Enterprise、NIM）→ 应用。 |
| **NVIDIA GPU driver**<br>NVIDIA GPU 驱动 | Kernel modules + user-space libraries that let the OS and apps use the GPU. The only NVIDIA component required on the host for containerized workloads.<br>内核模块 + 用户态库，让操作系统和应用使用 GPU。宿主机上唯一必须安装的 NVIDIA 组件（容器场景）。 |
| **CUDA** | NVIDIA's parallel computing platform and programming model, including compiler, runtime, libraries, and tools.<br>NVIDIA 的并行计算平台与编程模型，包含编译器、运行时、库和工具。 |
| **CUDA Toolkit**<br>CUDA 工具包 | Developer kit: nvcc compiler, CUDA runtime, math libraries, cuda-gdb, Nsight tools. Not needed on the host to run containerized apps.<br>开发套件：nvcc 编译器、CUDA 运行时、数学库、cuda-gdb、Nsight 工具。运行容器化应用时宿主机不需要安装。 |
| **nvcc** | The CUDA C/C++ compiler. The W1 benchmarks in this repo were compiled with nvcc.<br>CUDA C/C++ 编译器。本仓库 W1 的 benchmark 就是用 nvcc 编译的。 |
| **CUDA-X** | Umbrella name for NVIDIA's CUDA-based acceleration libraries and tools (cuBLAS, cuDNN, NCCL, RAPIDS, etc.).<br>NVIDIA 基于 CUDA 的加速库和工具集合的统称（cuBLAS、cuDNN、NCCL、RAPIDS 等）。 |
| **cuBLAS** | GPU-accelerated basic linear algebra library (GEMM and more).<br>GPU 加速的基础线性代数库（矩阵乘 GEMM 等）。 |
| **cuDNN** | Library of deep neural network primitives: convolution, attention, normalization, activations. Called by frameworks under the hood.<br>深度神经网络原语库：卷积、注意力、归一化、激活等。框架底层调用。 |
| **NCCL** | NVIDIA Collective Communications Library ("nickel"): all-reduce, all-gather, broadcast across GPUs and nodes.<br>NVIDIA Collective Communications Library（读作 nickel）：all-reduce、all-gather、broadcast 等多 GPU/多节点集合通信。 |
| **cuFFT / cuSPARSE / cuRAND / cuSOLVER** | GPU-accelerated libraries for FFT, sparse matrices, random numbers, and linear solvers.<br>分别为 GPU 加速的快速傅里叶变换、稀疏矩阵、随机数、线性方程求解库。 |
| **CUTLASS** | CUDA C++ template library for writing high-performance custom matrix-multiply kernels.<br>CUDA C++ 模板库，用于编写高性能自定义矩阵乘 kernel。 |
| **Nsight Systems** | System-wide profiler: CPU/GPU timeline to find I/O, synchronization, and gaps between kernels.<br>系统级性能分析：CPU/GPU 时间线，找出 IO、同步、kernel 间空隙等瓶颈。 |
| **Nsight Compute** | Kernel-level profiler: occupancy, memory access, and instruction details of a single CUDA kernel.<br>Kernel 级性能分析：单个 CUDA kernel 的占用率、访存、指令细节。 |
| **TensorRT** | Inference optimizer + runtime: layer fusion, precision calibration (FP16/INT8/FP8), kernel auto-tuning; produces an optimized engine.<br>推理优化器 + 运行时：层融合、精度校准（FP16/INT8/FP8）、kernel 自动调优，生成优化后的 engine。 |
| **Portability of a TensorRT engine**<br>TensorRT engine 的可移植性 | An engine (plan file) is tied to the GPU architecture and TensorRT version; changing GPU type or upgrading usually requires a rebuild.<br>engine（plan 文件）与 GPU 架构和 TensorRT 版本绑定，换卡型或升级版本通常要重新构建。 |
| **trtexec** | TensorRT command-line tool for converting ONNX to an engine and benchmarking it.<br>TensorRT 命令行工具，用于把 ONNX 转成 engine 并做性能测试。 |
| **TensorRT-LLM** | Library optimized for LLM inference: in-flight batching, paged KV cache, quantization (FP8/INT4/FP4), tensor parallelism.<br>专为 LLM 推理优化的库：in-flight batching、paged KV cache、量化（FP8/INT4/FP4）、张量并行。 |
| **TensorRT Model Optimizer** | Library for quantization, pruning, distillation, and sparsity that outputs models deployable with TensorRT-LLM.<br>模型量化、剪枝、蒸馏、稀疏化的工具库，产出可供 TensorRT-LLM 部署的模型。 |
| **Triton Inference Server**<br>Triton 推理服务器 | Open-source serving software: multiple framework backends, dynamic batching, concurrent models, model repository, HTTP/gRPC, Prometheus metrics.<br>开源推理服务软件：多框架后端、动态批处理、多模型并发、模型仓库、HTTP/gRPC、Prometheus 指标。 |
| **Triton default ports**<br>Triton 默认端口 | HTTP 8000, gRPC 8001, Prometheus metrics 8002.<br>HTTP 8000、gRPC 8001、Prometheus 指标 8002。 |
| **Triton dynamic batching**<br>Triton 动态批处理 | The server merges independent requests into one batch automatically to raise throughput.<br>服务端把多个独立请求自动合并成一个 batch 执行，提高吞吐。 |
| **Triton model repository**<br>Triton 模型仓库 | Directory-based model store (model name/version/config.pbtxt) that Triton loads at startup.<br>按目录组织的模型存储（模型名/版本/配置 config.pbtxt），Triton 启动时加载。 |
| **Triton ensemble**<br>Triton 模型组合 | Chains preprocessing, model inference, and postprocessing into one server-side pipeline.<br>把预处理、模型推理、后处理串成一个流水线，在服务端一次完成。 |
| **perf_analyzer / Model Analyzer** | Triton's load-testing tool / tool that searches for the best model configuration (batch size, instance count).<br>Triton 的压测工具 / 自动搜索最佳模型配置（batch、实例数）的工具。 |
| **NVIDIA Dynamo** | Open-source framework for large-scale distributed LLM serving, with prefill/decode disaggregation and KV-cache-aware routing.<br>面向大规模分布式 LLM 推理的开源服务框架，支持 prefill/decode 分离、KV cache 感知路由。 |
| **NVIDIA Inference Microservices (NIM)**<br>NVIDIA 推理微服务 | Prepackaged, pre-optimized inference containers exposing standard (OpenAI-compatible) APIs; deploy quickly on any NVIDIA GPU environment.<br>预打包、预优化的推理微服务容器，提供标准（OpenAI 兼容）API，可在任何 NVIDIA GPU 环境快速部署。 |
| **Which engine runs inside a NIM?**<br>NIM 内部用什么引擎 | It selects an optimized backend per model and GPU, such as TensorRT-LLM or vLLM; transparent to the user.<br>按模型和 GPU 自动选择优化后端，例如 TensorRT-LLM、vLLM 等；对使用者透明。 |
| **NeMo** | Framework to build, customize, and deploy generative AI: data curation, training, fine-tuning, evaluation, guardrails.<br>构建、定制、部署生成式 AI 的框架：数据整理、训练、微调、评估、护栏。 |
| **NeMo Curator** | GPU-accelerated large-scale training-data curation: deduplication, filtering, classification.<br>大规模训练数据整理工具：去重、过滤、分类，GPU 加速。 |
| **NeMo Guardrails** | Adds programmable guardrails to LLM apps: topic control, safety, fact checking.<br>给 LLM 应用加可编程护栏：话题限制、安全、事实核查。 |
| **NeMo Retriever** | Collection of retrieval microservices for RAG (embedding, reranking), delivered as NIMs.<br>面向 RAG 的检索微服务集合（embedding、reranking），以 NIM 形式提供。 |
| **Megatron-LM / Megatron-Core** | NVIDIA's large-scale Transformer training library implementing tensor, pipeline, and sequence parallelism.<br>NVIDIA 的大规模 Transformer 训练库，实现张量/流水线/序列并行。 |
| **Nemotron** | NVIDIA's family of open models (LLMs, reasoning models) that can be customized with NeMo.<br>NVIDIA 发布的开放模型家族（LLM、推理模型），可用 NeMo 定制。 |
| **RAPIDS** | GPU-accelerated data science suite: cuDF (pandas-like), cuML (scikit-learn-like), cuGraph (graph analytics), cuVS (vector search).<br>GPU 加速数据科学套件：cuDF（类 pandas）、cuML（类 scikit-learn）、cuGraph（图分析）、cuVS（向量搜索）。 |
| **cuDF** | GPU DataFrame library with a pandas-like API; cudf.pandas mode accelerates pandas code with zero changes.<br>GPU DataFrame 库，API 类似 pandas；cudf.pandas 模式可零代码修改加速。 |
| **cuML** | GPU-accelerated classical ML algorithms with a scikit-learn-like API.<br>GPU 加速的传统机器学习算法库，API 类似 scikit-learn。 |
| **Spark RAPIDS Accelerator** | Plugin that runs Apache Spark SQL/DataFrame jobs on GPUs.<br>让 Apache Spark SQL/DataFrame 作业在 GPU 上运行的插件。 |
| **Dask** | Python parallel computing framework; with RAPIDS it scales data processing across GPUs and nodes.<br>Python 并行计算框架，与 RAPIDS 结合实现多 GPU/多节点数据处理。 |
| **DALI** | Data Loading Library: decodes and augments data on the GPU to remove the CPU preprocessing bottleneck.<br>Data Loading Library：在 GPU 上做数据解码与增强，解决 CPU 预处理瓶颈。 |
| **NGC Catalog**<br>NGC 目录 | NVIDIA's hub for GPU-optimized software: framework containers (monthly), pretrained models, Helm charts, SDKs.<br>NVIDIA GPU 优化软件中心：框架容器（每月更新）、预训练模型、Helm chart、SDK。 |
| **nvcr.io** | NGC's container registry, e.g., nvcr.io/nvidia/pytorch:24.05-py3.<br>NGC 的容器镜像仓库地址，例如 nvcr.io/nvidia/pytorch:24.05-py3。 |
| **NGC container tag YY.MM**<br>NGC 容器标签 YY.MM | e.g., 24.05 = May 2024 release; monthly, tested combinations of framework + CUDA + libraries.<br>如 24.05 表示 2024 年 5 月版本，每月发布，经过测试的框架 + CUDA + 库组合。 |
| **NGC API key**<br>NGC API 密钥 | Key required to pull restricted images and models (e.g., NIM) from NGC.<br>从 NGC 拉取受限镜像/模型（如 NIM）需要的密钥。 |
| **NVIDIA AI Enterprise** | Enterprise AI software suite including NIM, NeMo, Triton, RAPIDS, with enterprise support, security patches, and stable branches; licensed per GPU.<br>企业级 AI 软件套件：包含 NIM、NeMo、Triton、RAPIDS 等，提供企业支持、安全补丁、稳定分支；按 GPU 授权。 |
| **Value of NVIDIA AI Enterprise**<br>AI Enterprise 的价值 | Production support (SLA), security fixes, long-term stable API branches, compatibility on certified systems and clouds.<br>生产级支持（SLA）、安全漏洞修复、长期稳定的 API 分支、在认证系统/云上的兼容性保证。 |
| **Magnum IO** | Umbrella name for data center I/O acceleration: GPUDirect RDMA/Storage, NCCL, NVSHMEM, UCX, in-network computing.<br>数据中心 IO 加速栈的统称：GPUDirect RDMA/Storage、NCCL、NVSHMEM、UCX、网络在网计算等。 |
| **NVSHMEM** | OpenSHMEM implementation for GPU clusters; GPUs can initiate reads/writes to remote GPU memory directly.<br>面向 GPU 集群的 OpenSHMEM 实现，GPU 可直接发起对远端 GPU 内存的读写。 |
| **UCX** | Unified Communication X: high-performance communication framework that lets MPI, Spark, etc. use RDMA/GPUDirect.<br>Unified Communication X：高性能通信框架，MPI、Spark 等可通过它使用 RDMA/GPUDirect。 |
| **PyTorch / TensorFlow / JAX** | Mainstream deep learning frameworks; all use NVIDIA GPUs through CUDA, cuDNN, and NCCL.<br>主流深度学习框架，均通过 CUDA、cuDNN、NCCL 使用 NVIDIA GPU。 |
| **ONNX** | Open model exchange format: export models from any framework and run them with TensorRT or ONNX Runtime.<br>开放模型交换格式，可把不同框架训练的模型导出，再给 TensorRT/ONNX Runtime 推理。 |
| **NVIDIA HPC SDK** | Suite of HPC compilers (nvc/nvfortran), math libraries, and communication libraries.<br>HPC 编译器（nvc/nvfortran）、数学库、通信库的套件。 |
| **Driver branches: Production / New Feature / LTSB**<br>驱动分支：生产 / 新特性 / 长期支持 | Production Branch: stable with long-term fixes; New Feature Branch: newer features; LTSB: long-term support branch for stability-critical environments.<br>生产分支：稳定、长期修复；新特性分支：较新功能；LTSB：长期支持分支，适合要求稳定的环境。 |
| **Data Center driver vs Game Ready driver**<br>数据中心驱动 vs 游戏驱动 | Data Center drivers target data center GPUs and are enterprise-validated; Game Ready drivers target gaming cards.<br>数据中心驱动面向 Tesla/数据中心 GPU，经过企业验证；Game Ready 面向游戏卡。 |
| **Open GPU kernel modules**<br>开源 GPU 内核模块 | NVIDIA's open-source Linux GPU kernel modules; available from Turing on and required from Blackwell on.<br>NVIDIA 开源的 Linux GPU 内核模块，Turing 及以后可用，Blackwell 起为必需。 |
| **GPU System Processor (GSP)**<br>GPU 系统处理器 | A RISC-V processor on the GPU that handles part of driver initialization and management (GSP firmware).<br>GPU 上的 RISC-V 处理器，承担驱动部分初始化和管理工作（GSP 固件）。 |

<a id="parallel"></a>
### 分布式训练与集合通信 · Distributed training & collectives（30）

| 正面 Front | 背面 Back |
| --- | --- |
| **Data parallelism**<br>数据并行 | Each GPU holds a full model copy and gets a slice of the mini-batch; gradients are averaged with all-reduce after backward. The most common approach.<br>每张 GPU 一份完整模型，切分 mini-batch；反向后 all-reduce 平均梯度。最常用的并行方式。 |
| **Model parallelism**<br>模型并行 | Splits the model itself across GPUs when it doesn't fit in one GPU's memory; includes tensor and pipeline parallelism.<br>把模型本身切到多张 GPU 上，用于模型放不进单卡显存的情况，包括张量并行和流水线并行。 |
| **Tensor parallelism**<br>张量并行 | Splits matrices within a layer across GPUs; communicates every layer, so it is usually kept inside a node's NVLink domain.<br>把单层内的矩阵切分到多 GPU，每层都要通信，通信极频繁 → 一般限制在节点内 NVLink 域。 |
| **Pipeline parallelism**<br>流水线并行 | Splits layers into stages on different GPUs and uses micro-batches to fill the pipeline and reduce bubbles.<br>按层把模型分成多个 stage 放在不同 GPU，用 micro-batch 填充流水线减少气泡。 |
| **Pipeline bubble**<br>流水线气泡 | Idle time of some stages at the start and end of a pipeline; more micro-batches shrink its share.<br>流水线开始和结束时部分 stage 空闲的时间，micro-batch 越多气泡占比越小。 |
| **Sequence / context parallelism**<br>序列 / 上下文并行 | Splits activations along the sequence dimension to handle very long contexts.<br>沿序列长度切分激活，处理超长上下文。 |
| **Expert parallelism**<br>专家并行 | Places different MoE experts on different GPUs; requires all-to-all communication.<br>MoE 模型中把不同专家放到不同 GPU，需要 all-to-all 通信。 |
| **3D parallelism**<br>3D 并行 | Combining data + tensor + pipeline parallelism; standard for large-model training (e.g., Megatron).<br>数据 + 张量 + 流水线并行组合，大模型训练的常规做法（如 Megatron）。 |
| **ZeRO (DeepSpeed)** | Shards optimizer states (stage 1), gradients (stage 2), and parameters (stage 3) across GPUs to remove redundant memory.<br>把优化器状态（stage 1）、梯度（stage 2）、参数（stage 3）分片到各 GPU，减少冗余显存。 |
| **Fully Sharded Data Parallel (FSDP)**<br>全分片数据并行 | PyTorch's fully sharded data parallelism; same idea as ZeRO-3.<br>PyTorch 的全分片数据并行，思路同 ZeRO-3。 |
| **All-reduce**<br>全归约 | Sums (or averages) data from all GPUs and gives every GPU the full result. Used to sync gradients in data parallelism.<br>所有 GPU 的数据求和（或平均）后，每个 GPU 都得到完整结果。数据并行同步梯度用。 |
| **All-gather**<br>全收集 | Each GPU contributes a piece; every GPU ends up with all pieces concatenated.<br>每个 GPU 贡献一部分，最终每个 GPU 都拿到全部拼接结果。 |
| **Reduce-scatter**<br>归约-分散 | Reduces first, then scatters result shards to GPUs. All-reduce = reduce-scatter + all-gather.<br>先归约，再把结果分片发给各 GPU。all-reduce = reduce-scatter + all-gather。 |
| **Broadcast**<br>广播 | One GPU sends data to all GPUs (e.g., syncing initial weights).<br>一个 GPU 把数据发给所有 GPU（如初始权重同步）。 |
| **All-to-all**<br>全交换 | Every GPU sends different data to every other GPU; common in MoE expert parallelism and heavy on the network.<br>每个 GPU 给其他每个 GPU 发不同数据；MoE 专家并行常用，对网络压力大。 |
| **Ring all-reduce**<br>环形全归约 | GPUs form a ring and pass segments along; good bandwidth use, latency grows linearly with GPU count.<br>GPU 排成环逐段传递，带宽利用好，延迟随 GPU 数线性增长。 |
| **Tree all-reduce**<br>树形全归约 | Tree-shaped reduction; latency grows logarithmically, good for large scale and small messages. NCCL picks ring or tree automatically.<br>树形归约，延迟随 GPU 数对数增长，适合大规模、小消息。NCCL 会自动选 ring 或 tree。 |
| **nccl-tests** | Official NCCL benchmarks such as all_reduce_perf, reporting algbw and busbw.<br>NCCL 官方性能测试工具，如 all_reduce_perf，报告 algbw 和 busbw。 |
| **algbw vs busbw**<br>算法带宽 vs 总线带宽 | algbw = data size ÷ time; busbw corrects for the algorithm to reflect actual link bandwidth, comparable to NVLink/NIC specs.<br>algbw = 数据量 ÷ 时间；busbw 按算法修正后反映硬件链路实际带宽，可与 NVLink/网卡理论值对比。 |
| **Strong scaling vs weak scaling**<br>强扩展 vs 弱扩展 | Strong: fixed total problem, add GPUs to go faster. Weak: fixed work per GPU, problem grows with GPU count.<br>强扩展：总问题规模不变、加 GPU 看提速；弱扩展：每 GPU 负载不变、加 GPU 同时扩大问题。 |
| **Scaling efficiency**<br>扩展效率 | Actual speedup on N GPUs ÷ N. Drops due to communication overhead, insufficient network bandwidth, I/O, or load imbalance.<br>N 张 GPU 的实际加速比 ÷ N。下降常因通信开销、网络带宽不足、IO 或负载不均。 |
| **Gang scheduling**<br>成组调度 | All processes of a distributed job must get resources at the same time or none start; native in Slurm.<br>分布式作业的所有进程必须同时获得资源才能启动，否则全部等待；Slurm 原生支持。 |
| **Gradient accumulation**<br>梯度累积 | Accumulates gradients over several small batches before one update, emulating a large batch with little memory.<br>多个小 batch 累积梯度后再更新一次，用小显存模拟大 batch。 |
| **Activation checkpointing**<br>激活重计算 | Skips storing some activations in the forward pass and recomputes them in backward, trading compute for memory.<br>前向时不保存部分激活，反向时重新计算，用计算换显存。 |
| **Training memory estimate (Adam, mixed precision)**<br>训练显存估算（Adam 混合精度） | ~16 bytes/parameter (FP16 weights 2 + grads 2 + FP32 master 4 + two Adam states 8), excluding activations. 7B model ≈ 112 GB.<br>约 16 字节/参数（FP16 权重 2 + 梯度 2 + FP32 主权重 4 + Adam 两份状态 8），还不含激活。7B 模型约 112 GB。 |
| **Inference memory estimate**<br>推理显存估算 | Weights = parameters × bytes per parameter (70B × 2 B = 140 GB), plus KV cache and activations.<br>权重 = 参数量 × 每参数字节（70B × 2 B = 140 GB），再加 KV cache 和激活。 |
| **Model FLOPs Utilization (MFU)**<br>模型算力利用率 | Achieved model FLOPS ÷ hardware peak FLOPS; a common training-efficiency metric.<br>实际达到的模型 FLOPS ÷ 硬件峰值 FLOPS，衡量训练效率的常用指标。 |
| **MPI**<br>消息传递接口 | Message Passing Interface: HPC multi-process communication standard; mpirun launches multi-node jobs and works with NCCL.<br>Message Passing Interface：HPC 多进程通信标准，常用 mpirun 启动多节点作业，可与 NCCL 配合。 |
| **torchrun** | PyTorch's distributed launcher: starts one process per GPU and sets rank environment variables.<br>PyTorch 分布式启动器，为每张 GPU 起一个进程并设置 rank 等环境变量。 |
| **Rank / world size**<br>进程编号 / 进程总数 | Each process's ID / total process count in distributed training. Local rank is the ID within a node.<br>分布式训练中每个进程的编号 / 进程总数。local rank 是节点内编号。 |

<a id="genai"></a>
### 生成式 AI 与 LLM 推理 · Generative AI & LLM inference（38）

| 正面 Front | 背面 Back |
| --- | --- |
| **Large language model (LLM)**<br>大语言模型 | A Transformer-based model trained on massive text that understands and generates language; billions to trillions of parameters.<br>基于 Transformer、在海量文本上训练、能理解和生成语言的模型，参数量从数十亿到万亿。 |
| **Token**<br>词元 | The basic unit of text a model processes (word or subword). In English, 1 token ≈ 0.75 words. Billing and performance are measured in tokens.<br>模型处理文本的基本单位（词或子词）。英文约 1 token ≈ 0.75 个单词。计费和性能都按 token 计。 |
| **Tokenizer**<br>分词器 | Splits text into tokens and maps them to IDs.<br>把文本切成 token 并映射为 ID 的组件。 |
| **Context window**<br>上下文窗口 | Maximum tokens the model handles at once (input + output). Longer context means a larger KV cache.<br>模型一次能处理的最大 token 数（输入 + 输出）。越长 KV cache 越大。 |
| **Embedding**<br>嵌入向量 | Maps text/images to dense vectors where similar meanings are close together. Used for retrieval and RAG.<br>把文本/图像映射成稠密向量，语义相近的内容向量距离近。用于检索和 RAG。 |
| **Prompt engineering**<br>提示词工程 | Steering model output by designing the input prompt (instructions, examples, format) without changing weights.<br>通过设计输入提示词（指令、示例、格式）来引导模型输出，不改变权重。 |
| **Few-shot / zero-shot**<br>少样本 / 零样本 | Giving a few examples / no examples in the prompt for the model to complete the task.<br>在 prompt 中给几个示例 / 不给示例直接让模型完成任务。 |
| **Temperature**<br>温度 | Sampling randomness. Low → more deterministic; high → more varied.<br>采样随机度。低 → 输出更确定；高 → 更多样。 |
| **Top-p / top-k sampling**<br>Top-p / Top-k 采样 | Sample only from tokens within cumulative probability p or the k most likely tokens, controlling diversity.<br>只从累计概率前 p 或概率最高的 k 个 token 中采样，控制多样性。 |
| **Hallucination**<br>幻觉 | The model produces plausible but false content. Mitigate with RAG, guardrails, fact checking.<br>模型生成看似合理但不真实的内容。缓解：RAG、护栏、事实校验。 |
| **Retrieval-augmented generation (RAG)**<br>检索增强生成 | Chunk docs → embed → store in a vector DB; at query time retrieve relevant chunks into the prompt. First choice when data changes often and you don't want to retrain.<br>文档切块 → embedding → 存入向量库；提问时检索相关片段拼入 prompt 再生成。数据经常变、不想重训时首选。 |
| **RAG pipeline components**<br>RAG 的流程组件 | Document parsing and chunking → embedding model → vector database → retrieval (+ reranker) → LLM generation.<br>文档解析与切块 → embedding 模型 → 向量数据库 → 检索（+ reranker 重排）→ LLM 生成。 |
| **Vector database**<br>向量数据库 | Stores embeddings and retrieves by vector similarity (e.g., Milvus). GPU acceleration via cuVS.<br>存储 embedding，按向量相似度检索（如 Milvus）。GPU 加速可用 cuVS。 |
| **Reranker**<br>重排序模型 | Rescores and reorders initial retrieval results to improve the relevance of RAG context.<br>对初步检索结果重新打分排序，提高 RAG 上下文的相关性。 |
| **Chunking**<br>切块 | Splitting long documents into suitably sized pieces before embedding; affects retrieval quality.<br>把长文档切成合适长度的片段再做 embedding，影响检索质量。 |
| **Supervised fine-tuning (SFT)**<br>监督微调 | Fine-tuning on instruction–response pairs so the model learns to follow instructions.<br>用指令-回答对数据微调模型，让它学会遵循指令。 |
| **RLHF**<br>基于人类反馈的强化学习 | Reinforcement learning from human feedback: train a reward model on human preferences, then optimize the LLM toward them.<br>基于人类反馈的强化学习：用人类偏好训练奖励模型，再优化 LLM，使输出更符合人类偏好。 |
| **Parameter-efficient fine-tuning (PEFT)**<br>参数高效微调 | Trains only a small number of extra parameters with the main model frozen. LoRA, P-tuning, and adapters are examples.<br>只训练少量额外参数，冻结主模型。LoRA、P-tuning、Adapter 都属于此类。 |
| **LoRA**<br>低秩适配 | Low-Rank Adaptation: freezes the original weights and trains small low-rank matrices added to layers. Far cheaper than full fine-tuning.<br>Low-Rank Adaptation：冻结原权重，训练小的低秩矩阵加到原层上。显存和成本远低于全量微调。 |
| **Full fine-tuning**<br>全量微调 | Updates all parameters; highest ceiling but memory and compute costs approach a share of pretraining.<br>更新所有参数，效果上限高，但显存和算力成本接近预训练规模的一部分。 |
| **RAG vs fine-tuning: how to choose**<br>RAG 与微调怎么选 | Frequently changing knowledge or need for citations → RAG; changing style/format/specific skills → fine-tuning; they can be combined.<br>知识频繁变化、需要引用来源 → RAG；改变风格/格式/特定能力 → 微调；二者可结合。 |
| **Mixture of Experts (MoE)**<br>混合专家模型 | Each layer has many expert subnetworks and each token activates only a few: huge total parameters, small per-token compute.<br>每层有多个专家子网络，每个 token 只激活其中少数，总参数大而单 token 计算量小。 |
| **Prefill vs decode**<br>预填充 vs 解码 | Prefill processes the whole prompt at once (compute-bound); decode generates tokens one by one (memory-bandwidth-bound).<br>Prefill：一次性处理整个输入 prompt，计算密集；Decode：逐个生成 token，受显存带宽限制。 |
| **KV cache**<br>键值缓存 | Caches attention keys/values already computed to avoid recomputation; grows linearly with context length and concurrency and uses lots of memory.<br>缓存注意力层已算过的 Key/Value，避免重复计算；随上下文长度和并发数线性增长，吃大量显存。 |
| **Paged attention / paged KV cache**<br>分页注意力 / 分页 KV 缓存 | Manages KV cache in pages like an OS, reducing fragmentation and increasing concurrency (vLLM and TensorRT-LLM support it).<br>像操作系统分页一样管理 KV cache，减少显存碎片，提高并发（vLLM、TensorRT-LLM 都支持）。 |
| **In-flight / continuous batching**<br>飞行中批处理 / 连续批处理 | Requests join the batch as they arrive and leave when done instead of waiting for the whole batch, greatly raising LLM serving throughput.<br>请求随到随加入、完成即退出 batch，而不是等整批结束，大幅提高 LLM 服务吞吐。 |
| **Speculative decoding**<br>投机解码 | A small draft model proposes several tokens and the large model verifies them in one pass, cutting generation latency.<br>小模型先草拟多个 token，大模型一次验证，降低生成延迟。 |
| **Disaggregated serving**<br>分离式服务 | Runs prefill and decode on separate GPU pools that scale independently (e.g., NVIDIA Dynamo).<br>把 prefill 和 decode 放到不同 GPU 池分别扩展（如 NVIDIA Dynamo）。 |
| **Time to first token (TTFT)**<br>首 token 延迟 | Time from sending a request to receiving the first token; driven mainly by prefill and queuing.<br>从发送请求到收到第一个 token 的时间，主要受 prefill 和排队影响。 |
| **TPOT / ITL**<br>每 token 输出时间 / token 间延迟 | Time Per Output Token / Inter-Token Latency: the gap between later tokens, i.e., the "typing speed".<br>Time Per Output Token / Inter-Token Latency：后续每个 token 的间隔，决定“打字速度”。 |
| **End-to-end latency estimate**<br>端到端延迟估算 | ≈ TTFT + TPOT × (output tokens − 1).<br>≈ TTFT + TPOT × (输出 token 数 − 1)。 |
| **Tokens per second**<br>每秒 token 数（吞吐） | Tokens generated per second by the whole system; depends on concurrency, batch, model size, and precision.<br>整机每秒生成 token 数；与并发数、batch、模型大小、精度有关。 |
| **Guardrails**<br>护栏 | Checks, filters, and steers LLM behavior on input and output (safety, topics, compliance).<br>在输入和输出侧检查、过滤、引导 LLM 行为（安全、话题、合规）。 |
| **Multimodal model**<br>多模态模型 | Handles several input/output types such as text, images, and audio (e.g., vision-language models).<br>能同时处理文本、图像、音频等多种输入或输出的模型（如 VLM 视觉语言模型）。 |
| **Tool calling / function calling**<br>工具调用 / 函数调用 | The LLM outputs a structured call; the app runs the external tool (API, database, search) and returns the result to the model.<br>LLM 输出结构化调用请求，由应用执行外部工具（API、数据库、搜索）后把结果返回给模型。 |
| **NVIDIA AI Blueprints**<br>NVIDIA AI 蓝图 | NVIDIA's reference generative AI workflows (RAG, digital humans, video analytics) built on NIM.<br>NVIDIA 提供的生成式 AI 参考工作流（如 RAG、数字人、视频分析），基于 NIM 构建。 |
| **Scaling laws**<br>缩放定律 | Empirical rule that model quality improves as a power law with parameters, data, and compute; justifies ever-larger clusters.<br>模型效果随参数量、数据量、算力按幂律提升的经验规律，是持续扩大集群的依据。 |
| **Test-time scaling / reasoning models**<br>推理时扩展 / 推理模型 | Spending more compute at inference (long chains of thought) to improve answers, which increases inference compute demand.<br>推理时花更多计算（长思考链）提升答案质量，推理算力需求随之增加。 |

<a id="industry"></a>
### 行业方案与边缘平台 · Industry solutions & edge platforms（19）

| 正面 Front | 背面 Back |
| --- | --- |
| **Omniverse** | Platform for 3D collaboration, simulation, and digital twins, built on OpenUSD.<br>3D 协作、仿真与数字孪生平台，基于 OpenUSD。 |
| **Cosmos** | NVIDIA's world foundation model platform for physical AI (robots, autonomous vehicles).<br>NVIDIA 面向物理 AI（机器人、自动驾驶）的世界基础模型平台。 |
| **Isaac** | Robotics development platform: simulation (Isaac Sim), perception, manipulation libraries.<br>机器人开发平台：仿真（Isaac Sim）、感知、操作库。 |
| **Metropolis** | Vision AI / intelligent video analytics platform (smart cities, retail, factories).<br>智能视频分析 / 视觉 AI 平台（智慧城市、零售、工厂）。 |
| **DeepStream SDK** | GPU-accelerated streaming video analytics pipeline SDK; core of Metropolis.<br>GPU 加速的流式视频分析管线 SDK，Metropolis 的核心组件。 |
| **Clara** | Healthcare AI platform: medical imaging, genomics (Parabricks), drug discovery (BioNeMo).<br>医疗健康 AI 平台：医学影像、基因组学（Parabricks）、药物研发（BioNeMo）。 |
| **Riva** | Speech AI SDK: automatic speech recognition (ASR), text-to-speech (TTS), translation.<br>语音 AI SDK：语音识别（ASR）、语音合成（TTS）、翻译。 |
| **Maxine** | Audio/video enhancement SDK: noise removal, eye-contact correction, super-resolution.<br>音视频增强 SDK：降噪、视线校正、超分辨率等。 |
| **Morpheus** | Cybersecurity AI framework for real-time anomaly detection on network traffic and logs.<br>网络安全 AI 框架：对网络流量、日志做实时异常检测。 |
| **Merlin** | Recommender system framework with GPU acceleration across data processing, training, and inference.<br>推荐系统框架：数据处理、训练、推理全流程 GPU 加速。 |
| **Holoscan** | Platform for real-time AI on edge sensor data (e.g., medical devices).<br>边缘传感器数据（医疗器械等）实时 AI 处理平台。 |
| **DRIVE** | Autonomous vehicle platform (in-vehicle compute + software stack).<br>自动驾驶平台（车载计算 + 软件栈）。 |
| **cuOpt** | GPU-accelerated combinatorial optimization solver (e.g., vehicle routing).<br>GPU 加速的组合优化求解器（车辆路径规划等）。 |
| **CUDA-Q / cuQuantum** | Hybrid quantum-classical programming platform / quantum circuit simulation acceleration libraries.<br>量子-经典混合计算编程平台 / 量子电路仿真加速库。 |
| **TAO Toolkit** | Low-code transfer learning tool to fine-tune vision AI models with little data.<br>低代码迁移学习工具，用少量数据微调视觉 AI 模型。 |
| **IGX** | Edge AI platform for industrial and medical use, emphasizing functional safety and long lifecycle.<br>面向工业和医疗的边缘 AI 平台，强调功能安全和长生命周期。 |
| **Fleet Command** | Cloud service for remotely deploying and managing edge AI (zero-touch provisioning, OTA updates, security).<br>边缘 AI 远程部署和管理的云服务（零接触配置、OTA 更新、安全）。 |
| **Sovereign AI**<br>主权 AI | A nation or region building AI capability on its own infrastructure, data, and talent, emphasizing data sovereignty.<br>国家或地区用本土基础设施、数据和人才构建 AI 能力，强调数据主权。 |
| **AI factory**<br>AI 工厂 | NVIDIA's framing of the data center as a factory that produces intelligence (tokens), measured by token throughput and energy efficiency.<br>NVIDIA 提出的概念：把数据中心看作生产“智能”（token）的工厂，以 token 吞吐和能效衡量。 |

## 领域 2 · AI 基础设施 · AI Infrastructure

<a id="compute"></a>
### 计算节点与系统 · Compute nodes & systems（24）

| 正面 Front | 背面 Back |
| --- | --- |
| **PCIe card vs SXM module**<br>PCIe 卡 vs SXM 模组 | PCIe: fits standard slots, lower power, GPUs talk over PCIe or an NVLink bridge. SXM: mounted on an HGX baseboard, all-to-all NVSwitch, higher power and performance.<br>PCIe：插标准槽，功耗低，GPU 间走 PCIe 或 NVLink bridge。SXM：装在 HGX 基板上，NVSwitch 全互联，功耗和性能更高。 |
| **Why choose SXM for large-scale training**<br>为什么大规模训练选 SXM | GPUs need high NVLink/NVSwitch bandwidth (tensor parallelism, all-reduce), and SXM allows higher power and performance.<br>GPU 之间需要 NVLink/NVSwitch 的高带宽（张量并行、all-reduce），且 SXM 功耗上限更高、性能更强。 |
| **HGX** | NVIDIA's GPU baseboard platform (4 or 8 SXM GPUs + NVSwitch) that OEMs (Dell, HPE, Supermicro, Lenovo…) build servers around.<br>NVIDIA 的 GPU 基板平台（4 或 8 块 SXM GPU + NVSwitch），OEM 厂商（Dell、HPE、Supermicro、Lenovo 等）基于它制造服务器。 |
| **DGX** | NVIDIA's complete AI system: hardware + DGX OS + software stack + enterprise support, ready out of the box.<br>NVIDIA 自家的完整 AI 系统：硬件 + DGX OS + 软件栈 + 企业支持，开箱即用。 |
| **HGX vs DGX in one sentence**<br>一句话区分 HGX 与 DGX | HGX is the GPU board platform for OEMs; DGX is the complete system NVIDIA sells.<br>HGX 是给 OEM 的 GPU 主板平台；DGX 是 NVIDIA 卖的整机。 |
| **MGX** | NVIDIA's modular server reference design so OEMs can quickly combine CPU/GPU/DPU configurations.<br>NVIDIA 的模块化服务器参考设计，OEM 用它快速组合不同 CPU/GPU/DPU 配置。 |
| **NVIDIA-Certified Systems**<br>NVIDIA 认证系统 | OEM servers tested and validated by NVIDIA (performance, manageability, security, networking, scalability); eligible for NVIDIA AI Enterprise support.<br>OEM 服务器经 NVIDIA 测试验证（性能、管理、安全、网络、可扩展性），可获 NVIDIA AI Enterprise 支持。 |
| **DGX A100 configuration**<br>DGX A100 配置 | 8× A100 (320 or 640 GB total), 6 NVSwitches, 8× 200 Gb/s HDR compute NICs, 2 AMD EPYC CPUs, ~6.5 kW.<br>8× A100（共 320 或 640 GB）、6 个 NVSwitch、8 个 200 Gb/s HDR 计算网卡、2 颗 AMD EPYC，约 6.5 kW。 |
| **DGX H100 configuration**<br>DGX H100 配置 | 8× H100 SXM (640 GB HBM3 total), 4 NVSwitch chips, 8× 400 Gb/s ConnectX-7 compute ports, 2 Intel Xeon CPUs, 2 TB RAM, ~10.2 kW max.<br>8× H100 SXM（共 640 GB HBM3）、4 颗 NVSwitch 芯片、8 个 400 Gb/s ConnectX-7 计算端口、2 颗 Intel Xeon、2 TB 内存，最大约 10.2 kW。 |
| **DGX H100 NIC roles**<br>DGX H100 网卡分工 | 8 single-port 400G ConnectX-7 for the compute fabric (one per GPU); dual-port ConnectX-7/BlueField-3 for storage and in-band management.<br>8 个 ConnectX-7 单端口 400G 用于计算网络（每 GPU 一个）；另有双端口 ConnectX-7/BlueField-3 用于存储和带内管理。 |
| **DGX H100 local storage**<br>DGX H100 本地存储 | OS drives + ~30 TB NVMe data drives used as a dataset cache.<br>操作系统盘 + 约 30 TB NVMe 数据盘，用作数据集缓存。 |
| **DGX H200** | 8× H200 with ~1.1 TB HBM3e total, for larger model inference and training.<br>8× H200，共约 1.1 TB HBM3e，适合更大模型推理与训练。 |
| **DGX B200 configuration**<br>DGX B200 配置 | 8× B200 (1,440 GB HBM3e total), NVLink 5, ~14 kW-class max power.<br>8× B200（共 1,440 GB HBM3e），NVLink 5，最大约 14 kW 级。 |
| **DGX GB200** | DGX system built from GB200 NVL72 racks, liquid-cooled, used in DGX SuperPOD.<br>以 GB200 NVL72 机柜为单元的 DGX 系统，液冷，用于 DGX SuperPOD。 |
| **GB200 NVL72 total NVLink bandwidth**<br>GB200 NVL72 NVLink 总带宽 | 72 GPUs linked through NVLink Switch trays; ~130 TB/s total NVLink bandwidth in the rack.<br>72 颗 GPU 通过 NVLink Switch 托盘互联，机柜内 NVLink 总带宽约 130 TB/s。 |
| **What does "72" in NVL72 mean?**<br>NVL72 中的 “72” | The number of Blackwell GPUs in one NVLink domain.<br>一个 NVLink 域里的 Blackwell GPU 数量。 |
| **DGX OS** | Operating system of DGX systems, Ubuntu-based, preloaded with GPU driver, Fabric Manager, DCGM, container runtime.<br>DGX 系统的操作系统，基于 Ubuntu，预装 GPU 驱动、Fabric Manager、DCGM、容器运行时等。 |
| **Baseboard Management Controller (BMC)**<br>基板管理控制器 | Independent management chip on the motherboard; via the out-of-band network it provides remote power, sensors, logs, remote console (IPMI/Redfish).<br>服务器主板上的独立管理芯片，经带外网络提供远程电源控制、传感器、日志、远程控制台（IPMI/Redfish）。 |
| **Role of the CPU in a GPU server**<br>CPU 在 GPU 服务器中的作用 | Runs the OS, data preprocessing and loading, kernel launches, network and storage I/O; too little CPU leaves GPUs waiting for data.<br>运行操作系统、数据预处理与加载、调度 kernel、网络和存储 IO；CPU 不足会让 GPU 等数据。 |
| **System memory vs GPU memory**<br>系统内存与 GPU 显存的关系 | System memory should be ≥ total GPU memory (often 2×) for preprocessing, pinned memory, and caching.<br>建议系统内存 ≥ 总显存（常见 2 倍），以便数据预处理、pinned memory 和缓存。 |
| **Benefit of Grace Hopper / Grace Blackwell**<br>Grace Hopper / Grace Blackwell 的好处 | CPU and GPU share coherent NVLink-C2C (900 GB/s), so the GPU can access large CPU memory fast, avoiding the PCIe bottleneck.<br>CPU 和 GPU 通过 NVLink-C2C 一致性互联（900 GB/s），GPU 可高速访问大容量 CPU 内存，减少 PCIe 瓶颈。 |
| **Common inference server GPUs**<br>推理服务器常见卡型 | L4, L40S, H100 NVL / PCIe, H200, B200; chosen by model size, latency, and cost.<br>L4、L40S、H100 NVL / PCIe、H200、B200；按模型大小、延迟和成本选择。 |
| **AWS GPU instance examples**<br>AWS GPU 实例举例 | p4d (8× A100 40GB), p5 (8× H100), p5e (H200), g5 (A10G), g6 (L4), g6e (L40S).<br>p4d（8× A100 40GB）、p5（8× H100）、p5e（H200）、g5（A10G）、g6（L4）、g6e（L40S）。 |
| **GPU server selection criteria**<br>GPU 服务器选型要考虑 | GPU model and count, GPU memory, GPU interconnect, NIC count and speed, CPU/RAM, local NVMe, power and cooling, software support.<br>GPU 型号与数量、显存容量、GPU 间互联、网卡数量与速率、CPU/内存、本地 NVMe、功耗与散热、软件支持。 |

<a id="interconnect"></a>
### 节点内互联（PCIe / NVLink / NVSwitch） · Intra-node interconnect (PCIe / NVLink / NVSwitch)（23）

| 正面 Front | 背面 Back |
| --- | --- |
| **PCIe x16 one-way bandwidth per generation**<br>PCIe 每代 x16 单向带宽 | Gen3 ≈ 16 GB/s, Gen4 ≈ 32 GB/s, Gen5 ≈ 64 GB/s, Gen6 ≈ 128 GB/s. Double for bidirectional.<br>Gen3 ≈ 16 GB/s，Gen4 ≈ 32 GB/s，Gen5 ≈ 64 GB/s，Gen6 ≈ 128 GB/s。双向翻倍。 |
| **PCIe switch**<br>PCIe 交换芯片 | Expands PCIe lanes so GPUs, NICs, and NVMe under the same switch communicate directly without going through the CPU.<br>扩展 PCIe 通道，把多块 GPU、网卡、NVMe 挂在同一交换芯片下，让它们之间直接通信不经过 CPU。 |
| **NVLink** | High-bandwidth, low-latency point-to-point interconnect between GPUs (and GPU–CPU), far faster than PCIe.<br>GPU 之间（及 GPU-CPU）的高带宽、低延迟点对点互联，带宽远高于 PCIe。 |
| **NVLink bandwidth per GPU by generation**<br>NVLink 每代每 GPU 带宽 | NVLink 1 (P100) 160 GB/s → 2 (V100) 300 → 3 (A100) 600 → 4 (H100) 900 GB/s → 5 (B200) 1.8 TB/s.<br>NVLink 1（P100）160 GB/s → 2（V100）300 → 3（A100）600 → 4（H100）900 GB/s → 5（B200）1.8 TB/s。 |
| **How many NVLinks does an H100 have?**<br>H100 有多少条 NVLink | 18 links at 50 GB/s each (bidirectional) = 900 GB/s.<br>18 条，每条 50 GB/s（双向），合计 900 GB/s。 |
| **NVSwitch** | NVLink switch chip that lets every GPU in a node talk to every other at full NVLink bandwidth, with no multi-hop.<br>NVLink 交换芯片：让节点内所有 GPU 两两以全 NVLink 带宽通信，不需要多跳。 |
| **NVLink bridge**<br>NVLink 桥接器 | Bridge connecting PCIe cards over NVLink, typically just 2 cards.<br>PCIe 卡之间的 NVLink 桥接器，通常只连 2 张卡。 |
| **NVLink Switch System / NVLink domain**<br>NVLink 交换系统 / NVLink 域 | External NVSwitches extend NVLink beyond one server to form a larger NVLink domain (e.g., 72 GPUs in NVL72).<br>用外置 NVSwitch 把 NVLink 扩展出单台服务器，组成更大的 NVLink 域（如 NVL72 的 72 GPU）。 |
| **NVLink-C2C** | Coherent chip-to-chip interconnect (Grace↔Hopper, Grace↔Blackwell), 900 GB/s.<br>芯片到芯片的一致性互联（Grace↔Hopper、Grace↔Blackwell），900 GB/s。 |
| **Fabric Manager** | Service required on NVSwitch systems (HGX A100/H100, etc.) to configure NVSwitches and NVLink partitions; if not running, CUDA initialization fails.<br>NVSwitch 系统（HGX A100/H100 等）上必须运行的服务，负责配置 NVSwitch 和 NVLink 分区；没运行会导致 CUDA 初始化失败。 |
| **GPUDirect P2P**<br>GPUDirect 点对点 | GPUs in the same node access each other's memory directly (over NVLink or PCIe) without going through CPU memory.<br>同一节点内 GPU 之间直接访问对方显存（经 NVLink 或 PCIe），不经过 CPU 内存。 |
| **NUMA**<br>非一致性内存访问 | Non-Uniform Memory Access: on multi-socket systems each CPU reaches local memory fast and remote memory slower. GPUs and NICs also belong to a NUMA node.<br>非一致性内存访问：多 CPU 插槽系统里，每颗 CPU 访问本地内存快、远端慢。GPU 和网卡也属于某个 NUMA 节点。 |
| **Why CPU affinity matters**<br>CPU 亲和性为什么重要 | Binding processes to CPU cores on the same NUMA node as their GPU/NIC avoids cross-socket traffic that cuts bandwidth and adds latency.<br>进程绑定到与 GPU/网卡同一 NUMA 节点的 CPU 核，避免跨插槽访问降低带宽、增加延迟。 |
| **nvidia-smi topo -m** | Prints the topology matrix between GPUs, NICs, and CPUs, plus CPU/NUMA affinity.<br>打印 GPU、网卡、CPU 之间的拓扑矩阵和 CPU/NUMA 亲和性。 |
| **topo matrix: NV#**<br>拓扑矩阵：NV# | Directly connected by # NVLinks; fastest.<br>通过 # 条 NVLink 直连，最快。 |
| **topo matrix: PIX**<br>拓扑矩阵：PIX | Traverses at most one PCIe switch; a very short path. Ideal pairing for GPUDirect RDMA.<br>最多经过一个 PCIe 交换芯片，路径很短。GPUDirect RDMA 理想配对。 |
| **topo matrix: PXB**<br>拓扑矩阵：PXB | Traverses multiple PCIe switches but not the CPU host bridge.<br>经过多个 PCIe 交换芯片，但不经过 CPU 主桥。 |
| **topo matrix: PHB**<br>拓扑矩阵：PHB | Traverses a PCIe host bridge (the CPU); slower.<br>经过 PCIe Host Bridge（CPU），较慢。 |
| **topo matrix: NODE**<br>拓扑矩阵：NODE | Crosses multiple PCIe host bridges within one NUMA node.<br>在同一 NUMA 节点内跨多个 PCIe Host Bridge。 |
| **topo matrix: SYS**<br>拓扑矩阵：SYS | Crosses NUMA nodes via the CPU-to-CPU SMP interconnect (UPI/xGMI); slowest.<br>跨 NUMA 节点，需经过 CPU 之间的 SMP 互联（UPI/xGMI），最慢。 |
| **topo matrix from fastest to slowest**<br>拓扑矩阵从快到慢 | NV# &gt; PIX &gt; PXB &gt; PHB &gt; NODE &gt; SYS.<br>NV# &gt; PIX &gt; PXB &gt; PHB &gt; NODE &gt; SYS。 |
| **nvbandwidth** | NVIDIA tool that measures bandwidth for GPU↔GPU and CPU↔GPU copy paths.<br>NVIDIA 的带宽测量工具，测 GPU↔GPU、CPU↔GPU 各种拷贝路径的带宽。 |
| **p2pBandwidthLatencyTest** | CUDA sample that measures GPU-to-GPU P2P bandwidth and latency.<br>CUDA samples 里的 GPU 之间 P2P 带宽和延迟测试程序。 |

<a id="network-ib"></a>
### 网络：InfiniBand 与 RDMA · Networking: InfiniBand & RDMA（26）

| 正面 Front | 背面 Back |
| --- | --- |
| **Why AI clusters need a fast network**<br>为什么 AI 集群需要高速网络 | Multi-node training syncs gradients/activations across nodes every step; network bandwidth and latency directly set scaling efficiency.<br>多节点训练每步都要跨节点同步梯度/激活，网络带宽和延迟直接决定扩展效率。 |
| **Remote Direct Memory Access (RDMA)**<br>远程直接内存访问 | The NIC reads/writes remote host memory directly without the remote CPU or kernel stack: low latency, high bandwidth, low CPU use.<br>网卡直接读写远端主机内存，不经过对方 CPU 和内核协议栈：低延迟、高带宽、低 CPU 占用。 |
| **InfiniBand (IB)** | Network designed for HPC/AI: native RDMA, credit-based lossless flow control, low latency, in-network computing (SHARP).<br>为 HPC/AI 设计的网络：原生 RDMA、基于信用的无损流控、低延迟、在网计算（SHARP）。 |
| **InfiniBand speed generations**<br>InfiniBand 速率代际 | SDR → DDR → QDR (40) → FDR (56) → EDR (100) → HDR (200) → NDR (400) → XDR (800 Gb/s).<br>SDR → DDR → QDR(40) → FDR(56) → EDR(100) → HDR(200) → NDR(400) → XDR(800 Gb/s)。 |
| **HDR / NDR / XDR** | HDR = 200 Gb/s, NDR = 400 Gb/s, XDR = 800 Gb/s per port.<br>HDR = 200 Gb/s，NDR = 400 Gb/s，XDR = 800 Gb/s（每端口）。 |
| **Credit-based flow control**<br>基于信用的流控 | IB link-layer flow control: the sender transmits only when the receiver grants buffer credits, so congestion never drops packets (lossless).<br>IB 链路层流控：发送方只有在接收方给出缓冲“信用”时才发送，因此不会因拥塞丢包（无损）。 |
| **Subnet Manager (SM)**<br>子网管理器 | Required IB management entity: discovers topology, assigns LIDs, computes routing tables. Implemented by OpenSM or UFM's built-in SM.<br>IB 网络必需的管理实体：发现拓扑、分配 LID、计算路由表。实现：OpenSM 或 UFM 内置 SM。 |
| **What happens without a Subnet Manager?**<br>没有 Subnet Manager 会怎样 | IB ports stay in the Initializing state and cannot communicate.<br>IB 端口停在 Initializing 状态，无法通信。 |
| **Local Identifier (LID)**<br>本地标识符 | 16-bit subnet-local address the Subnet Manager assigns to an IB port.<br>Subnet Manager 给 IB 端口分配的子网内 16 位地址。 |
| **GUID**<br>全局唯一标识符 | Globally unique 64-bit identifier of an IB device/port, similar to a MAC address.<br>IB 设备/端口的全球唯一 64 位标识，类似 MAC 地址。 |
| **Partition / PKey**<br>分区 / 分区键 | IB isolation mechanism (like a VLAN): only ports in the same partition can talk; used for multi-tenancy.<br>IB 的网络隔离机制（类似 VLAN），只有同一分区的端口能互相通信，用于多租户。 |
| **Adaptive routing**<br>自适应路由 | Switches choose paths dynamically by congestion to balance load. Supported by IB and Spectrum-X.<br>交换机根据拥塞情况动态选择路径，均衡负载。IB 和 Spectrum-X 都支持。 |
| **IPoIB** | IP over InfiniBand: runs IP on IB so ordinary TCP/IP apps can use the IB network.<br>IP over InfiniBand：在 IB 上跑 IP 协议，方便普通 TCP/IP 应用使用 IB 网络。 |
| **ConnectX** | NVIDIA (formerly Mellanox) NIC family supporting both IB and Ethernet. ConnectX-6 = 200G, ConnectX-7 = 400G, ConnectX-8 = 800G.<br>NVIDIA（原 Mellanox）的网卡系列，同时支持 IB 和以太网。ConnectX-6 = 200G，ConnectX-7 = 400G，ConnectX-8 = 800G。 |
| **Quantum switch family**<br>Quantum 交换机系列 | NVIDIA InfiniBand switches: Quantum (HDR), Quantum-2 (NDR, 64× 400G ports), Quantum-X800 (XDR).<br>NVIDIA InfiniBand 交换机：Quantum（HDR）、Quantum-2（NDR，64 个 400G 端口）、Quantum-X800（XDR）。 |
| **Unified Fabric Manager (UFM)**<br>统一网络管理器 | InfiniBand fabric management platform: topology view, telemetry, alerts, health checks, built-in Subnet Manager.<br>InfiniBand 网络管理平台：拓扑可视化、遥测、告警、健康检查，内置 Subnet Manager。 |
| **SHARP** | Scalable Hierarchical Aggregation and Reduction Protocol: performs all-reduce and other reductions inside IB switches, cutting data movement and latency.<br>Scalable Hierarchical Aggregation and Reduction Protocol：在 IB 交换机内完成 all-reduce 等归约，减少数据往返、降低延迟。 |
| **ibstat / ibstatus** | Show local IB port state, rate, and LID. Ports should be Active / LinkUp.<br>查看本机 IB 网卡端口状态、速率、LID。端口应为 Active / LinkUp。 |
| **ibv_devinfo** | Lists RDMA devices and their attributes (verbs layer).<br>列出 RDMA 设备及其属性（verbs 层）。 |
| **iblinkinfo / ibdiagnet** | Show link status across the whole IB fabric / fabric-wide diagnostics (error counters, speed mismatches).<br>查看整个 IB 网络的链路状态 / 全网诊断（错误计数、速率不匹配等）。 |
| **perftest (ib_write_bw, etc.)**<br>perftest 工具 | RDMA bandwidth and latency tests: ib_write_bw, ib_read_bw, ib_send_lat, etc.<br>RDMA 带宽和延迟测试工具：ib_write_bw、ib_read_bw、ib_send_lat 等。 |
| **DOCA-OFED / MLNX_OFED** | Driver and RDMA software stack for NVIDIA NICs (newer versions are part of DOCA-Host).<br>NVIDIA 网卡的驱动和 RDMA 软件栈（新版整合进 DOCA-Host）。 |
| **LinkX cables**<br>LinkX 线缆 | NVIDIA's cable and transceiver line: DACs, AOCs, optical transceivers.<br>NVIDIA 的线缆与光模块产品线：DAC、AOC、光模块。 |
| **DAC / AOC / optical transceiver**<br>DAC / AOC / 光模块 | DAC: passive copper, a few meters, cheap and low power; AOC: active optical cable, longer reach; transceiver + fiber: long distances in the data center.<br>DAC：无源铜缆，几米内、便宜省电；AOC：有源光缆，更长；光模块 + 光纤：数据中心长距离。 |
| **OSFP / QSFP** | High-speed port/transceiver form factors. A twin-port OSFP on a Quantum-2 switch carries two 400G NDR links.<br>高速端口/光模块封装形式。Quantum-2 交换机的双口 OSFP 可承载两路 400G NDR。 |
| **What to check for IB fabric health**<br>IB 网络健康常看什么 | Port state, link speed/width degradation, symbol error and link recovery counters, congestion.<br>端口状态、链路速率与宽度是否降级、符号错误/链路恢复计数、拥塞。 |

<a id="network-eth"></a>
### 网络：以太网、拓扑与四张网 · Networking: Ethernet, topology & the four networks（27）

| 正面 Front | 背面 Back |
| --- | --- |
| **RoCE** | RDMA over Converged Ethernet: running RDMA on Ethernet.<br>RDMA over Converged Ethernet：在以太网上跑 RDMA。 |
| **RoCE v1 vs RoCE v2** | v1: Layer 2 Ethernet, not routable. v2: encapsulated in UDP/IP (UDP 4791), routable across Layer 3; the mainstream choice.<br>v1：二层以太网，不可路由；v2：封装在 UDP/IP 中（UDP 4791），可跨三层路由，是主流。 |
| **iWARP** | TCP-based RDMA implementation; rarely used in AI clusters.<br>基于 TCP 的 RDMA 实现，AI 集群中较少使用。 |
| **Network requirements for RoCE**<br>RoCE 对网络的要求 | Needs a near-lossless fabric with congestion control such as PFC + ECN; packet loss sharply degrades performance.<br>需要接近无损：PFC + ECN 等拥塞控制；丢包会导致性能急剧下降。 |
| **Priority Flow Control (PFC)**<br>基于优先级的流控 | Ethernet pauses transmission hop by hop per priority to prevent buffer overflow and loss.<br>以太网按优先级逐跳暂停发送，防止缓冲溢出丢包。 |
| **Explicit Congestion Notification (ECN)**<br>显式拥塞通知 | Switches mark packets under congestion so senders slow down instead of packets being dropped.<br>交换机在拥塞时给包打标记，通知发送端降速，而不是丢包。 |
| **DCQCN** | Common RoCE congestion control algorithm that adjusts send rate based on ECN marks.<br>RoCE 常用的拥塞控制算法，结合 ECN 标记调整发送速率。 |
| **InfiniBand vs Ethernet (RoCE): choosing**<br>InfiniBand 与以太网（RoCE）怎么选 | IB: native lossless, low latency, SHARP; the AI training benchmark. Ethernet: familiar operations, merges with existing networks, needs congestion-control tuning.<br>IB：原生无损、低延迟、SHARP，AI 训练性能标杆。以太网：运维生态熟悉、可与现有网络融合，需调优拥塞控制。 |
| **Spectrum-X** | NVIDIA's AI Ethernet platform: Spectrum-4 switches + BlueField-3 SuperNICs with adaptive routing, congestion control, performance isolation.<br>NVIDIA 面向 AI 的以太网平台：Spectrum-4 交换机 + BlueField-3 SuperNIC，自适应路由、拥塞控制、性能隔离。 |
| **Spectrum-4** | NVIDIA Ethernet switch ASIC/switch with 51.2 Tb/s capacity, used in Spectrum-X.<br>NVIDIA 以太网交换芯片/交换机，51.2 Tb/s 交换容量，用于 Spectrum-X。 |
| **SuperNIC** | NIC designed for AI east-west traffic (BlueField-3 SuperNIC, ConnectX-8 SuperNIC); works with Spectrum-X for congestion control and packet reordering.<br>专为 AI 东西向流量设计的网卡（BlueField-3 SuperNIC、ConnectX-8 SuperNIC），配合 Spectrum-X 做拥塞控制和乱序重排。 |
| **Cumulus Linux** | Network operating system for NVIDIA Ethernet switches.<br>NVIDIA 以太网交换机的网络操作系统。 |
| **East-west vs north-south traffic**<br>东西向 vs 南北向流量 | East-west: between servers inside the data center (GPU↔GPU, to storage). North-south: in and out of the data center (user requests, internet).<br>东西向：数据中心内服务器之间（GPU↔GPU、到存储）；南北向：进出数据中心（用户请求、互联网）。 |
| **Fat-tree**<br>胖树 | Multi-tier leaf-spine network that gets "fatter" toward the top, achieving non-blocking full bisection bandwidth; standard AI compute fabric topology.<br>叶-脊多层网络，越往上带宽越“胖”，可实现无阻塞全对分带宽，AI 计算网络的标准拓扑。 |
| **Leaf-spine**<br>叶-脊架构 | Servers connect to leaf switches; every leaf connects to every spine, so any two servers are at most leaf-spine-leaf apart over equal-cost paths.<br>服务器连叶交换机，叶全连脊交换机；任意两台服务器最多经过 叶-脊-叶 三跳，路径等价。 |
| **Non-blocking**<br>无阻塞 | Uplink bandwidth equals downlink bandwidth (1:1, no oversubscription), so any server pairs can talk at full speed simultaneously.<br>上行带宽 = 下行带宽（1:1 无收敛），任意服务器对可同时满速通信。 |
| **Oversubscription ratio**<br>收敛比 | Total downlink bandwidth ÷ total uplink bandwidth, e.g., 2:1. Compute fabrics usually require 1:1.<br>下行总带宽 ÷ 上行总带宽，如 2:1。计算网络通常要求 1:1。 |
| **Bisection bandwidth**<br>对分带宽 | Total bandwidth between two halves when the network is cut in half; measures overall communication capacity.<br>把网络一分为二后两半之间的总带宽，衡量网络整体通信能力。 |
| **Rail-optimized topology**<br>轨道优化拓扑 | GPU N's NIC in every server connects to the same leaf switch (rail N); same-index GPUs are one hop apart, matching NCCL traffic.<br>所有服务器的第 N 号 GPU 网卡连到同一台“第 N 号”叶交换机；同号 GPU 一跳可达，与 NCCL 通信模式匹配。 |
| **Compute fabric**<br>计算网络 | East-west network for cross-node GPU↔GPU traffic (IB or Spectrum-X), carrying distributed training traffic.<br>GPU↔GPU 跨节点东西向通信网络，IB 或 Spectrum-X，承载分布式训练流量。 |
| **Storage fabric**<br>存储网络 | Network for reaching high-performance shared storage, kept separate from the compute fabric so I/O doesn't disturb collectives.<br>节点访问高性能共享存储的网络，与计算网络隔离，避免 IO 干扰集合通信。 |
| **In-band management network**<br>带内管理网络 | SSH, cluster management, job scheduling, image and package downloads; goes through the OS.<br>SSH、集群管理、作业调度、镜像和软件包下载，走操作系统。 |
| **Out-of-band (OOB) management network**<br>带外管理网络 | Connects BMCs (IPMI/Redfish) and switch management ports; works even when the OS is down for remote power cycling and logs.<br>连接 BMC（IPMI/Redfish）和交换机管理口；操作系统宕机也能远程开关机、看日志。 |
| **The four networks of a SuperPOD**<br>SuperPOD 的四张网络 | Compute fabric, storage fabric, in-band management network, out-of-band management network.<br>计算网络、存储网络、带内管理网络、带外管理网络。 |
| **MTU / jumbo frames**<br>最大传输单元 / 巨帧 | Ethernet maximum transmission unit; storage and RDMA networks often use 9000-byte jumbo frames for efficiency (consistent end to end).<br>以太网最大传输单元；存储和 RDMA 网络常用 9000 字节巨帧提高效率（全路径一致）。 |
| **VLAN / VRF** | Ethernet Layer 2 isolation / Layer 3 routing isolation, used for multi-tenancy and network segmentation.<br>以太网二层隔离 / 三层路由隔离，用于多租户和网络分段。 |
| **LACP / link aggregation**<br>链路聚合 | Bonds multiple Ethernet links into one logical link for bandwidth and redundancy (common on management/storage networks).<br>多条以太网链路绑定成一条逻辑链路，增加带宽和冗余（常用于管理/存储网络）。 |

<a id="gpudirect"></a>
### GPUDirect 与 Magnum IO · GPUDirect & Magnum IO（10）

| 正面 Front | 背面 Back |
| --- | --- |
| **The GPUDirect family**<br>GPUDirect 家族 | GPUDirect P2P (GPU↔GPU in a node), GPUDirect RDMA (NIC↔GPU memory), GPUDirect Storage (storage↔GPU memory).<br>GPUDirect P2P（节点内 GPU↔GPU）、GPUDirect RDMA（网卡↔GPU 显存）、GPUDirect Storage（存储↔GPU 显存）。 |
| **GPUDirect RDMA** | The NIC reads/writes GPU memory directly, eliminating staging copies through CPU memory; lowers cross-node latency and CPU load.<br>网卡直接读写 GPU 显存，省掉经过 CPU 内存的中转拷贝，降低跨节点通信延迟和 CPU 负载。 |
| **Data path without GPUDirect RDMA**<br>没有 GPUDirect RDMA 时的数据路径 | GPU memory → copy to CPU memory → NIC sends → remote CPU memory → copy to remote GPU: two extra copies.<br>GPU 显存 → 拷到 CPU 内存 → 网卡发送 → 对端 CPU 内存 → 拷到对端 GPU，多两次拷贝。 |
| **GPUDirect Storage (GDS)** | Local NVMe, NVMe-oF, or parallel file systems DMA directly to/from GPU memory, bypassing the bounce buffer in CPU memory.<br>本地 NVMe、NVMe-oF 或并行文件系统通过 DMA 直接读写 GPU 显存，绕过 CPU 内存中的 bounce buffer。 |
| **Bounce buffer**<br>中转缓冲区 | A staging buffer in CPU memory used when moving data between devices; GDS eliminates it.<br>数据在设备之间搬运时，先暂存到 CPU 内存的中转缓冲区。GDS 就是消除它。 |
| **cuFile** | User-space API library for GPUDirect Storage.<br>GPUDirect Storage 的用户态 API 库。 |
| **Topology requirement for GPUDirect RDMA**<br>GPUDirect RDMA 的拓扑要求 | GPU and NIC should sit under the same PCIe switch (PIX); crossing CPU sockets (SYS) severely hurts performance.<br>GPU 与网卡最好在同一 PCIe 交换芯片下（PIX）；跨 CPU 插槽（SYS）性能会大幅下降。 |
| **nvidia-peermem** | Kernel module that lets RDMA NIC drivers access GPU memory directly; GPUDirect RDMA depends on it (or DMA-BUF).<br>让 RDMA 网卡驱动能直接访问 GPU 显存的内核模块，GPUDirect RDMA 依赖它（或 DMA-BUF）。 |
| **GPUDirect Video / Async** | Other GPUDirect members: video capture cards write directly to GPU memory / the GPU triggers network operations directly.<br>其他 GPUDirect 成员：视频采集卡直写显存 / GPU 直接触发网络操作。 |
| **What Magnum IO includes**<br>Magnum IO 包括什么 | GPUDirect RDMA/Storage, NCCL, NVSHMEM, UCX, SHARP in-network computing, network management (UFM), and other I/O acceleration.<br>GPUDirect RDMA/Storage、NCCL、NVSHMEM、UCX、SHARP 在网计算、网络管理（UFM）等 IO 加速技术。 |

<a id="dpu"></a>
### DPU（BlueField） · DPU (BlueField)（12）

| 正面 Front | 背面 Back |
| --- | --- |
| **Data Processing Unit (DPU)**<br>数据处理器 | An "infrastructure processor" combining a fast NIC, Arm CPU cores, and acceleration engines to handle networking, storage, and security.<br>集成高速网卡、Arm CPU 核和加速引擎的“基础设施处理器”，处理网络、存储、安全任务。 |
| **CPU / GPU / DPU roles**<br>CPU / GPU / DPU 分工 | CPU: general compute and control; GPU: accelerated compute; DPU: data center infrastructure (data movement, networking, storage, security).<br>CPU：通用计算与控制；GPU：加速计算；DPU：数据中心基础设施（数据搬运、网络、存储、安全）。 |
| **Core value of a DPU**<br>DPU 的核心价值 | Offloads and accelerates infrastructure tasks from the host CPU and isolates them from tenant workloads (zero trust).<br>把基础设施任务从主机 CPU 卸载（offload）、加速，并与租户工作负载隔离（零信任）。 |
| **BlueField** | NVIDIA's DPU product line. BlueField-2 = 200 Gb/s, BlueField-3 = 400 Gb/s.<br>NVIDIA 的 DPU 产品线。BlueField-2 = 200 Gb/s，BlueField-3 = 400 Gb/s。 |
| **DOCA** | Software framework/SDK for BlueField DPUs (libraries, drivers, services); plays the role CUDA plays for GPUs.<br>BlueField DPU 的软件框架/SDK：库、驱动、服务，地位类似 CUDA 之于 GPU。 |
| **Networking functions a DPU offloads**<br>DPU 能卸载的网络功能 | Virtual switching (OVS), overlay encapsulation (VXLAN), load balancing, telemetry.<br>虚拟交换（OVS）、overlay 封装（VXLAN）、负载均衡、遥测。 |
| **Storage functions a DPU offloads**<br>DPU 能卸载的存储功能 | NVMe-oF (presenting remote storage as local NVMe), encryption, compression, storage virtualization.<br>NVMe-oF（把远端存储呈现为本地 NVMe）、加密、压缩、存储虚拟化。 |
| **Security functions a DPU offloads**<br>DPU 能卸载的安全功能 | Firewall, IPsec/TLS encryption, intrusion detection, micro-segmentation.<br>防火墙、IPsec/TLS 加密、入侵检测、微分段。 |
| **Why DPU isolation matters (zero trust)**<br>DPU 隔离的意义（零信任） | The infrastructure control plane runs on the DPU, so even if the host is compromised, tenants cannot tamper with network/storage policy.<br>基础设施控制面运行在 DPU 上，即使主机被攻破，租户也无法篡改网络/存储策略。 |
| **DPU mode vs NIC mode**<br>DPU 模式 vs NIC 模式 | DPU mode: Arm cores run infrastructure services. NIC mode: used only as a regular high-speed NIC.<br>DPU 模式：Arm 核运行基础设施服务；NIC 模式：只当普通高速网卡使用。 |
| **Common DPU misconceptions**<br>DPU 常见误区 | A DPU does not add GPU memory, does not replace NVSwitch, and does not train models.<br>DPU 不增加 GPU 显存、不替代 NVSwitch、不用来训练模型。 |
| **BlueField's role in an AI cloud**<br>BlueField 在 AI 云中的角色 | Provides network isolation, storage access, and security in multi-tenant GPU clouds while freeing host CPUs for AI work.<br>多租户 GPU 云中实现网络隔离、存储接入和安全，同时释放主机 CPU 给 AI 工作负载。 |

<a id="storage"></a>
### 存储 · Storage（18）

| 正面 Front | 背面 Back |
| --- | --- |
| **Storage needs of AI training**<br>AI 训练对存储的需求 | Many GPUs read datasets concurrently (high aggregate throughput and IOPS) and periodically write large checkpoints (high write bandwidth).<br>大量 GPU 并发读数据集（高聚合吞吐、高 IOPS），周期性写大 checkpoint（高写带宽）。 |
| **Storage tiers**<br>存储分层 | GPU memory → system memory → local NVMe → high-performance shared storage/parallel FS → object storage/archive.<br>GPU 显存 → 系统内存 → 本地 NVMe → 高性能共享存储/并行文件系统 → 对象存储/归档。 |
| **Local NVMe**<br>本地 NVMe | In-node SSDs: lowest latency and fast, good for dataset caching and scratch, but not shared and data may be lost on node failure.<br>节点内 SSD：延迟最低、速度快，适合数据集缓存和临时文件，但不在节点间共享，节点故障数据可能丢失。 |
| **Parallel file system**<br>并行文件系统 | Stripes data across many storage servers that clients access in parallel for high aggregate bandwidth. Examples: Lustre, IBM Storage Scale (GPFS), WEKA, VAST, DDN.<br>数据条带化分布在多台存储服务器，客户端并行访问，提供高聚合带宽。例：Lustre、IBM Storage Scale (GPFS)、WEKA、VAST、DDN。 |
| **Lustre components**<br>Lustre 组件 | MDS/MDT (metadata server/target), OSS/OST (object storage server/target), clients.<br>MDS/MDT（元数据服务器/目标）、OSS/OST（对象存储服务器/目标）、客户端。 |
| **NFS**<br>网络文件系统 | Traditional network file system; fine for home directories, code, and configs, but often a bottleneck under large-scale concurrent training I/O.<br>传统网络文件系统，适合家目录、代码和配置；大规模并发训练 IO 下容易成为瓶颈。 |
| **Object storage**<br>对象存储 | S3-compatible, large capacity, low cost, easy to scale, higher latency. For data lakes, raw data, archives, model artifacts.<br>S3 兼容，容量大、成本低、易扩展，延迟较高。用于数据湖、原始数据、归档、模型制品。 |
| **Block storage**<br>块存储 | Presented to a single host as a block device (cloud disks, SAN); common for system disks and databases.<br>以块设备形式提供给单台主机（云盘、SAN），常用于系统盘和数据库。 |
| **NVMe-oF** | NVMe over Fabrics: access remote NVMe over RDMA/TCP with latency close to local.<br>NVMe over Fabrics：通过 RDMA/TCP 网络访问远端 NVMe，延迟接近本地。 |
| **Checkpoint pressure on storage**<br>Checkpoint 对存储的压力 | Large-model checkpoints can reach several TB and training may pause while writing; low write bandwidth stretches these stalls.<br>大模型 checkpoint 可达数 TB，写入期间训练可能暂停；写带宽不足会显著拉长停顿时间。 |
| **Small files problem**<br>小文件问题 | Huge numbers of small files stress metadata and IOPS. Fix: pack into large sharded formats (WebDataset, TFRecord).<br>海量小文件导致元数据压力大、IOPS 瓶颈。对策：打包成大文件分片格式（WebDataset、TFRecord 等）。 |
| **Symptoms of a data loader bottleneck**<br>数据加载瓶颈的症状 | Low, fluctuating GPU utilization; high CPU iowait; unstable step time.<br>GPU 利用率低、波动，CPU iowait 高，step 时间不稳定。 |
| **Fixes for a data loading bottleneck**<br>数据加载瓶颈的对策 | Parallel file system, local NVMe caching, GPUDirect Storage, more DataLoader workers, DALI preprocessing on GPU, prefetching.<br>并行文件系统、本地 NVMe 缓存、GPUDirect Storage、增加 DataLoader worker、DALI 在 GPU 上预处理、数据预取。 |
| **Throughput vs IOPS vs latency**<br>吞吐 vs IOPS vs 延迟 | Throughput: large sequential read/write speed (GB/s). IOPS: small I/Os per second. Latency: response time of one I/O. Training usually needs high throughput.<br>吞吐：大文件顺序读写速度（GB/s）；IOPS：每秒小 IO 次数；延迟：单次 IO 响应时间。训练通常要高吞吐。 |
| **Caching**<br>缓存 | Keeps hot data on local NVMe or in memory to reduce repeated access to shared storage.<br>把热数据缓存在本地 NVMe 或内存，减少重复访问共享存储。 |
| **RAID**<br>磁盘冗余阵列 | RAID 0 striping (fast, no redundancy), RAID 1 mirroring, RAID 5/6 parity, RAID 10 mirror + stripe.<br>磁盘冗余阵列：RAID 0 条带（快、无冗余），RAID 1 镜像，RAID 5/6 校验，RAID 10 镜像+条带。 |
| **NVIDIA-certified storage for SuperPOD**<br>NVIDIA 认证存储（SuperPOD） | Partner storage solutions validated by NVIDIA to meet DGX SuperPOD performance requirements.<br>经 NVIDIA 验证、满足 DGX SuperPOD 性能要求的存储合作伙伴方案。 |
| **Where should datasets live?**<br>数据集放在哪里 | Raw data → object storage/data lake; active hot training data → parallel file system; per-node copies → local NVMe cache.<br>原始数据 → 对象存储/数据湖；当前训练热数据 → 并行文件系统；每节点副本 → 本地 NVMe 缓存。 |

<a id="datacenter"></a>
### 机房：供电、散热与空间 · Data center: power, cooling & space（25）

| 正面 Front | 背面 Back |
| --- | --- |
| **PUE formula**<br>PUE 公式 | PUE = total facility power ÷ IT equipment power. Ideal is 1.0; lower is better.<br>PUE = 数据中心总功耗 ÷ IT 设备功耗。理想值 1.0，越低越好。 |
| **PUE worked example**<br>PUE 计算例 | Total 1.5 MW, IT 1.2 MW → PUE = 1.25; every 1 W of IT load costs 0.25 W extra in cooling, power distribution, etc.<br>总 1.5 MW、IT 1.2 MW → PUE = 1.25；即每 1 W IT 负载额外消耗 0.25 W 在制冷、配电等。 |
| **Water Usage Effectiveness (WUE)**<br>用水效率 | Data center water use ÷ IT energy (L/kWh); measures water efficiency.<br>数据中心用水量 ÷ IT 能耗（L/kWh），衡量水资源效率。 |
| **Typical rack power density**<br>典型机柜功率密度 | Traditional racks ≈ 5–15 kW. AI racks: air-cooled DGX ≈ 40 kW/rack, liquid-cooled NVL72 ≈ 120 kW class.<br>传统机柜约 5–15 kW/柜。AI 机柜：风冷 DGX 约 40 kW/柜，液冷 NVL72 约 120 kW 级。 |
| **Power for 4 DGX H100 in one rack**<br>4 台 DGX H100 一柜的功率 | 4 × 10.2 kW ≈ 41 kW, far above a traditional rack; plan power and cooling ahead.<br>4 × 10.2 kW ≈ 41 kW，远超传统机柜，需提前规划供电和散热。 |
| **Power to heat conversion**<br>功率换算热量 | 1 W ≈ 3.412 BTU/h; nearly all IT power becomes heat, requiring equal cooling capacity.<br>1 W ≈ 3.412 BTU/h；IT 消耗的电几乎全部变成热，需要等量的散热能力。 |
| **Air cooling**<br>风冷 | Fans + room air conditioning (CRAC/CRAH). Tops out around a few tens of kW per rack and loses efficiency at high density.<br>风扇 + 机房空调（CRAC/CRAH）。上限约每柜几十 kW，高密度时效率下降。 |
| **CRAC vs CRAH** | CRAC: room air conditioner with its own compressor. CRAH: room air handler that uses chilled water.<br>CRAC：自带压缩机的机房空调；CRAH：使用冷冻水的机房空气处理机。 |
| **Hot aisle / cold aisle**<br>冷热通道 | Racks face each other: cold aisles feed cold air to server fronts; hot aisles collect hot exhaust from the backs.<br>机柜面对面排列：冷通道送冷风进服务器前面板，热通道收集后部热风。 |
| **Aisle containment**<br>冷/热通道封闭 | Doors and roof panels enclose an aisle to stop hot and cold air mixing, improving cooling efficiency and PUE.<br>用门和顶板封闭通道，防止冷热风混合，提高制冷效率、降低 PUE。 |
| **Rear-door heat exchanger (RDHx)**<br>后门热交换器 | Water-cooled coil in the rack's rear door that removes exhaust heat directly, raising the density limit of air-cooled racks.<br>机柜后门装水冷盘管，直接带走排出的热风，可提升风冷机柜的密度上限。 |
| **Direct-to-chip liquid cooling**<br>冷板式液冷 | Coolant flows through cold plates on GPUs/CPUs to carry heat away directly. Required for high-density systems like GB200 NVL72.<br>冷却液流过贴在 GPU/CPU 上的冷板直接带走热量。GB200 NVL72 等高密度系统必须使用。 |
| **Coolant Distribution Unit (CDU)**<br>冷却液分配单元 | Liquid cooling equipment for coolant circulation, heat exchange, and temperature/flow control.<br>液冷系统中负责冷却液循环、换热与温度/流量控制的设备。 |
| **Immersion cooling**<br>浸没式液冷 | Whole servers submerged in dielectric fluid; very high density but changes operations significantly.<br>整台服务器浸在绝缘冷却液中散热，密度极高，运维方式改变较大。 |
| **Benefits of liquid cooling**<br>液冷的好处 | Supports higher density, lowers fan power and PUE, quieter, enables heat reuse.<br>支持更高功率密度、降低风扇功耗和 PUE、更低噪音、可回收余热。 |
| **ASHRAE recommended inlet temperature**<br>ASHRAE 推荐进风温度 | About 18–27 °C (ASHRAE recommended range), with humidity control.<br>约 18–27 °C（ASHRAE 推荐范围），并控制湿度。 |
| **Uninterruptible Power Supply (UPS)**<br>不间断电源 | Bridges short outages and filters power fluctuations until generators start.<br>市电中断时短时供电，并过滤电力波动，等待发电机启动。 |
| **Power Distribution Unit (PDU)**<br>机柜配电单元 | Distributes power to rack devices; smart PDUs meter and switch outlets remotely.<br>机柜配电单元，把电源分配给各设备，智能 PDU 可远程计量和开关。 |
| **A/B dual power feeds**<br>A/B 双路供电 | Dual server PSUs connect to two independent feeds so one feed failing doesn't stop the server.<br>服务器双电源分别接两路独立供电，一路故障不影响运行。 |
| **Three-phase power**<br>三相电 | High-density AI racks typically use three-phase power (e.g., 415 V) to deliver enough power.<br>高密度 AI 机柜通常使用三相电（如 415 V）以提供足够功率。 |
| **N / N+1 / 2N redundancy**<br>N / N+1 / 2N 冗余 | N: just enough; N+1: one extra spare; 2N: two complete independent systems.<br>N：刚好够用；N+1：额外一个备用；2N：完整双套独立系统。 |
| **Uptime Institute Tier I–IV**<br>Uptime Tier 等级 | Data center availability tiers: Tier I basic to Tier IV fully fault tolerant (2N+).<br>数据中心可用性等级：Tier I 基本，Tier IV 完全容错（2N+）。 |
| **Floor loading**<br>楼板承重 | A fully loaded GPU rack (especially liquid-cooled) can exceed 1 tonne; verify floor load before deployment.<br>满配 GPU 机柜（尤其液冷）重量可超过 1 吨，部署前要核对楼板承重。 |
| **Power capping**<br>功耗上限 | Limit GPU power with nvidia-smi -pl or management software to improve efficiency or avoid overload when power is constrained.<br>用 nvidia-smi -pl 或管理软件限制 GPU 功耗，在供电受限时提高能效或避免过载。 |
| **Data center planning factors**<br>数据中心规划要考虑的因素 | Power capacity, cooling method, power density, floor load, cabling (lengths/transceivers), space, redundancy, lead time, expandability.<br>供电容量、散热方式、功率密度、承重、网络布线（线缆长度/光模块）、空间、冗余、交付周期、扩展性。 |

<a id="deploy"></a>
### 参考架构与部署选择 · Reference architectures & deployment choices（20）

| 正面 Front | 背面 Back |
| --- | --- |
| **DGX BasePOD** | Reference architecture of DGX systems + networking + storage at smaller scale; an enterprise starting point.<br>基于 DGX 系统 + 网络 + 存储的参考架构，规模较小，适合企业起步。 |
| **DGX SuperPOD** | Turnkey large-scale AI data center solution: DGX systems, IB/Spectrum-X compute fabric, certified storage, management software, expert services.<br>交钥匙的大规模 AI 数据中心方案：DGX 系统、IB/Spectrum-X 计算网络、认证存储、管理软件、专家服务。 |
| **Scalable Unit (SU)**<br>可扩展单元 | Standard building block of a SuperPOD. DGX H100 SuperPOD: 1 SU = 32 DGX systems (256 GPUs).<br>SuperPOD 的标准构建块。DGX H100 SuperPOD：1 SU = 32 台 DGX（256 GPU）。 |
| **Why use a reference architecture**<br>为什么用参考架构 | A validated design lowers risk, shortens deployment, makes performance predictable, and comes with vendor support.<br>经过验证的设计降低风险、缩短部署时间、保证性能可预期、获得厂商支持。 |
| **On-premises pros**<br>本地部署的优点 | Lower TCO at sustained high utilization, data sovereignty and compliance, full control, predictable performance.<br>长期高利用率下 TCO 低、数据主权与合规、完全掌控、性能可预期。 |
| **On-premises cons**<br>本地部署的缺点 | Large upfront CapEx, long procurement lead time, needs facilities and an ops team, slow hardware refresh.<br>前期 CapEx 大、采购交付周期长、需要机房和运维团队、硬件更新周期长。 |
| **Cloud pros**<br>云的优点 | Pay as you go (OpEx), elastic scaling, fast start, no facilities needed, access to the latest hardware.<br>按需付费（OpEx）、弹性扩缩、启动快、无需机房、可试用最新硬件。 |
| **Cloud cons**<br>云的缺点 | Expensive at sustained full load, GPU quota/capacity limits, data egress fees, compliance constraints.<br>长期满载成本高、GPU 配额/容量受限、数据出云（egress）费用、合规限制。 |
| **CapEx vs OpEx**<br>资本支出 vs 运营支出 | CapEx: one-time capital spend (buying hardware). OpEx: ongoing operating spend (cloud usage, power, staff).<br>CapEx：一次性资本支出（买硬件）；OpEx：持续运营支出（云按需付费、电费、人力）。 |
| **Hybrid deployment**<br>混合部署 | Baseline workloads on-prem, peaks burst to cloud; or training in one place and inference in another.<br>基础负载在本地，高峰溢出（cloud bursting）到云；或训练在一处、推理在另一处。 |
| **Cloud bursting**<br>云突发扩容 | Temporarily extending jobs to the cloud when on-prem capacity runs short.<br>本地容量不足时临时把作业扩展到云上。 |
| **Signals that favor on-prem**<br>选本地的典型信号 | Sustained high utilization, data too large to move, data sovereignty/compliance, long-term stable demand.<br>持续高利用率、数据量大不便迁移、数据主权/合规要求、长期稳定需求。 |
| **Signals that favor cloud**<br>选云的典型信号 | Short-term, bursty, or uncertain demand; quick experiments; no facilities or ops team.<br>短期/突发/不确定的需求、快速验证、没有机房和运维团队。 |
| **DGX Cloud** | Managed AI platform NVIDIA offers with cloud partners: NVIDIA-optimized infrastructure, software, and expert support.<br>NVIDIA 与云厂商合作提供的托管 AI 平台：NVIDIA 优化的基础设施、软件和专家支持。 |
| **Total Cost of Ownership (TCO)**<br>总拥有成本 | Purchase + facilities + power + cooling + network + ops staff + software licenses + depreciation.<br>采购 + 机房 + 电力 + 散热 + 网络 + 运维人力 + 软件授权 + 折旧的总成本。 |
| **Impact of GPU utilization on cost**<br>GPU 利用率对成本的影响 | Idle GPUs still depreciate or bill; raising utilization (scheduling, sharing, reclaiming) is the most direct way to lower unit cost.<br>GPU 闲置也在折旧或计费；提高利用率（调度、共享、回收）是降低单位成本最直接的手段。 |
| **Data gravity**<br>数据引力 | The larger the data, the harder it is to move, so compute tends to go where the data lives.<br>数据量越大越难迁移，计算倾向于部署在数据所在位置。 |
| **Egress cost**<br>出云费用 | Fees charged for moving data out of a cloud; affects hybrid/multi-cloud cost.<br>把数据从云上传出时收取的流量费，影响混合/多云架构成本。 |
| **Edge deployment scenarios**<br>边缘部署场景 | Low latency, limited bandwidth, offline operation, privacy (factory inspection, retail, autonomous driving, medical devices).<br>低延迟、带宽受限、离线运行、隐私（工厂质检、零售、自动驾驶、医疗设备）。 |
| **Edge operations challenges**<br>边缘的运维挑战 | Dispersed sites, no on-site IT, weak physical security, unstable networks → need zero-touch deployment and remote management (Fleet Command).<br>站点分散、无现场 IT、物理安全差、网络不稳定 → 需要零接触部署与远程管理（Fleet Command）。 |

## 领域 3 · AI 运维 · AI Operations

<a id="nvidia-smi"></a>
### nvidia-smi 与 NVML · nvidia-smi & NVML（24）

| 正面 Front | 背面 Back |
| --- | --- |
| **NVML**<br>NVIDIA 管理库 | NVIDIA Management Library: the C management API provided by the driver. nvidia-smi, DCGM, and other monitoring tools build on it.<br>NVIDIA Management Library：驱动提供的 C 管理接口。nvidia-smi、DCGM、各类监控工具都基于它。 |
| **nvidia-smi** | NVML-based CLI to view GPU state, processes, memory, temperature, power, and change some settings.<br>基于 NVML 的命令行工具：查看 GPU 状态、进程、显存、温度、功耗，并修改部分配置。 |
| **What to read in default nvidia-smi output**<br>nvidia-smi 默认输出看什么 | Driver version, highest CUDA version the driver supports, per-GPU temperature/power/memory/utilization, ECC, processes using the GPU.<br>驱动版本、驱动支持的最高 CUDA 版本、每卡温度/功耗/显存/利用率、ECC、占用 GPU 的进程。 |
| **"CUDA Version" in nvidia-smi**<br>nvidia-smi 里的 “CUDA Version” | The highest CUDA version the driver supports — not the installed CUDA Toolkit version.<br>驱动支持的最高 CUDA 版本，不是已安装的 CUDA Toolkit 版本。 |
| **nvidia-smi -q** | Prints full detailed information for all GPUs.<br>打印所有 GPU 的完整详细信息。 |
| **nvidia-smi -q -d PERFORMANCE** | Shows clock throttle (clocks event) reasons: thermal, power cap, hardware slowdown, etc.<br>查看时钟降频原因（Clocks Event / Throttle Reasons）：温度、功耗上限、硬件 slowdown 等。 |
| **nvidia-smi -q -d ECC** | Shows ECC error counts (volatile/aggregate, correctable/uncorrectable).<br>查看 ECC 错误计数（易失/累计、可纠正/不可纠正）。 |
| **nvidia-smi -q -d ROW_REMAPPER** | Shows row-remapping status (A100 and later): remapped rows and whether a remap is pending.<br>查看行重映射状态（A100 及以后）：已重映射行数、是否有待生效的重映射。 |
| **nvidia-smi --query-gpu=... --format=csv -l 1** | Outputs selected fields as CSV on an interval (used for metric collection in this repo's W1).<br>按字段定时输出 CSV（本仓库 W1 的指标采集就用它）。 |
| **nvidia-smi dmon** | Scrolling per-device output of power, temperature, SM/memory utilization, etc.<br>按设备滚动输出功耗、温度、SM/显存利用率等。 |
| **nvidia-smi pmon** | Scrolling per-process GPU usage.<br>按进程滚动输出 GPU 使用情况。 |
| **Which command shows GPU/NIC connection topology?**<br>用哪个命令查看 GPU、网卡之间的连接拓扑？ | nvidia-smi topo -m: prints the NV#/PIX/PXB/PHB/NODE/SYS matrix and CPU/NUMA affinity.<br>nvidia-smi topo -m：输出 NV#/PIX/PXB/PHB/NODE/SYS 矩阵和 CPU/NUMA 亲和性。 |
| **nvidia-smi nvlink -s** | Shows the status and speed of each NVLink.<br>查看每条 NVLink 的状态和速率。 |
| **nvidia-smi -pm 1** | Enables persistence mode (Linux) to keep the driver initialized and cut job start latency. The nvidia-persistenced daemon is preferred.<br>开启持久模式（Linux），保持驱动初始化，降低作业启动延迟。推荐改用 nvidia-persistenced 守护进程。 |
| **nvidia-persistenced**<br>持久化守护进程 | Daemon that keeps GPU driver state initialized even when no clients are running.<br>持久化守护进程，没有客户端时也保持 GPU 驱动状态初始化。 |
| **nvidia-smi -pl &lt;W&gt;** | Sets the GPU power limit in watts.<br>设置 GPU 功耗上限（瓦）。 |
| **nvidia-smi -lgc / -ac** | Locks GPU clock range / sets application clocks for stable benchmark results.<br>锁定 GPU 时钟范围 / 设置应用时钟，用于基准测试获得稳定结果。 |
| **nvidia-smi -c (compute mode)**<br>nvidia-smi -c（计算模式） | DEFAULT: shared by many processes; EXCLUSIVE_PROCESS: only one process may use the GPU; PROHIBITED: no compute.<br>DEFAULT：多进程共享；EXCLUSIVE_PROCESS：只允许一个进程使用 GPU；PROHIBITED：禁止计算。 |
| **nvidia-smi -e 1** | Enables ECC (takes effect after reboot or GPU reset).<br>开启 ECC（需要重启或 GPU 重置后生效）。 |
| **nvidia-smi -r** | Resets the GPU (requires no processes using it).<br>重置 GPU（要求没有进程在使用该 GPU）。 |
| **nvidia-smi -i 0 -mig 1** | Enables MIG mode on GPU 0 (takes effect after GPU reset).<br>在 0 号 GPU 上开启 MIG 模式（需 GPU 重置后生效）。 |
| **nvidia-bug-report.sh** | Collects a full diagnostic bundle of driver state, logs, and config for NVIDIA support.<br>收集驱动、日志、配置的完整诊断包，提交给 NVIDIA 支持时使用。 |
| **What utilization.gpu really means**<br>utilization.gpu 的真实含义 | Fraction of the sample period in which any kernel was running. 100% does not mean all SMs are fully busy.<br>采样周期内有任何 kernel 在执行的时间比例。100% 不代表所有 SM 都在满负荷工作。 |
| **CUDA_VISIBLE_DEVICES** | Environment variable that limits which GPUs a CUDA app sees (e.g., 0,1) and renumbers them.<br>环境变量，限制 CUDA 应用能看到哪些 GPU（如 0,1），并重新编号。 |

<a id="dcgm"></a>
### DCGM 与监控体系 · DCGM & monitoring（30）

| 正面 Front | 背面 Back |
| --- | --- |
| **Data Center GPU Manager (DCGM)**<br>数据中心 GPU 管理器 | Data center GPU management suite: health monitoring, active diagnostics, policy alerts, job statistics, telemetry, at cluster scale.<br>数据中心 GPU 管理套件：健康监控、主动诊断、策略告警、作业统计、遥测，可在集群规模使用。 |
| **DCGM vs nvidia-smi**<br>DCGM 与 nvidia-smi 的区别 | nvidia-smi is a single-node view/config tool; DCGM targets cluster ops: continuous background monitoring, diagnostics, policies, job-level stats, Prometheus/K8s integration.<br>nvidia-smi 是单机查看/配置工具；DCGM 面向集群运维：后台持续监控、诊断、策略、作业级统计、与 Prometheus/K8s 集成。 |
| **nv-hostengine** | DCGM's background daemon that continuously collects GPU data; clients like dcgmi connect to it.<br>DCGM 的后台守护进程，持续采集 GPU 数据，dcgmi 等客户端连接它。 |
| **dcgmi** | The DCGM command-line client.<br>DCGM 命令行客户端。 |
| **dcgmi discovery -l** | Lists the GPUs and NVSwitches DCGM can see.<br>列出 DCGM 能看到的 GPU 和 NVSwitch。 |
| **dcgmi diag -r 1** | Quick diagnostic (seconds): basic deployment and software checks; run before every job.<br>快速诊断（秒级）：基本部署和软件检查，适合每个作业前跑。 |
| **dcgmi diag -r 2** | Medium diagnostic (a few minutes): adds short stress and PCIe checks.<br>中等诊断（约几分钟）：增加短时压力和 PCIe 等检查。 |
| **dcgmi diag -r 3** | Long diagnostic (tens of minutes): memory, compute stress, bandwidth, power; for acceptance testing or post-failure investigation.<br>长诊断（数十分钟级）：显存、计算压力、带宽、功耗等全面测试，用于上线验收或故障后排查。 |
| **dcgmi health** | Enables and queries health watches (PCIe, memory, ECC, thermal, NVLink, and other subsystems).<br>开启并查询健康监控（PCIe、显存、ECC、温度、NVLink 等子系统）。 |
| **dcgmi policy** | Sets policies that alert or act on events such as DBEs, XIDs, or over-temperature.<br>设置策略：发生特定事件（如 DBE、XID、温度过高）时告警或执行动作。 |
| **dcgmi stats** | Job-level statistics: GPU utilization, memory, power, and errors during a job.<br>作业级统计：记录某作业期间 GPU 利用率、显存、功耗、错误等。 |
| **DCGM Exporter** | Exposes DCGM metrics in Prometheus format (default port 9400, /metrics); often deployed by the GPU Operator.<br>把 DCGM 指标以 Prometheus 格式暴露（默认端口 9400，路径 /metrics），常由 GPU Operator 部署。 |
| **Standard GPU monitoring pipeline**<br>GPU 监控标准链路 | DCGM Exporter → Prometheus (scrape/store/alert) → Grafana (dashboards); alerts go out through Alertmanager.<br>DCGM Exporter → Prometheus（抓取/存储/告警）→ Grafana（仪表盘）；告警经 Alertmanager 发出。 |
| **Where DCGM works**<br>DCGM 适用环境 | Data center GPUs with native Linux drivers. Tested in this repo: on a consumer GPU + WSL2, DCGM Exporter starts but collects no metrics.<br>数据中心 GPU + 原生 Linux 驱动。本仓库实测：消费卡 + WSL2 上 DCGM Exporter 能启动但采不到指标。 |
| **DCGM_FI_DEV_GPU_UTIL** | GPU utilization (same as utilization.gpu in nvidia-smi).<br>GPU 利用率（同 nvidia-smi 的 utilization.gpu）。 |
| **DCGM_FI_DEV_FB_USED** | Frame buffer (GPU memory) used.<br>已用显存（frame buffer）。 |
| **DCGM_FI_DEV_GPU_TEMP / POWER_USAGE** | GPU temperature / current power draw.<br>GPU 温度 / 当前功耗。 |
| **DCGM_FI_DEV_XID_ERRORS** | Most recent XID error number, used for alerting.<br>最近一次 XID 错误编号，用于告警。 |
| **DCGM_FI_PROF_SM_ACTIVE** | SM activity: fraction of time at least one warp is resident on an SM; reflects real load better than GPU_UTIL.<br>SM 活跃度：至少有一个 warp 在 SM 上的时间比例，比 GPU_UTIL 更能反映实际负载。 |
| **DCGM_FI_PROF_SM_OCCUPANCY** | SM occupancy: resident warps relative to the maximum.<br>SM 占用率：驻留 warp 数相对最大值的比例。 |
| **DCGM_FI_PROF_PIPE_TENSOR_ACTIVE** | Tensor Core pipe activity; shows whether mixed-precision math is actually using Tensor Cores.<br>Tensor Core 管线活跃度，反映混合精度矩阵运算是否在用 Tensor Core。 |
| **DCGM_FI_PROF_DRAM_ACTIVE** | Memory interface activity; high values mean memory-bound work.<br>显存接口活跃度，高说明访存密集。 |
| **DCGM profiling metrics (DCP)**<br>DCGM 性能剖析指标 | SM Active, Occupancy, Tensor Active, DRAM Active, PCIe/NVLink throughput — more accurate efficiency signals than utilization.<br>SM Active、Occupancy、Tensor Active、DRAM Active、PCIe/NVLink 吞吐等，比 utilization 更准确地反映效率。 |
| **Prometheus** | Open-source monitoring system: scrapes targets on an interval, stores time series, supports PromQL queries and alert rules.<br>开源监控系统：定时抓取（scrape）目标的指标，存为时间序列，支持 PromQL 查询和告警规则。 |
| **Grafana** | Open-source visualization platform that builds dashboards from Prometheus and other sources. NVIDIA provides an official DCGM dashboard.<br>开源可视化平台，连接 Prometheus 等数据源做仪表盘。NVIDIA 提供 DCGM 官方 dashboard。 |
| **Alertmanager** | Prometheus alert routing: grouping, deduplication, silencing, delivery to email, chat, PagerDuty, etc.<br>Prometheus 的告警路由组件：分组、去重、静默，发送到邮件、IM、PagerDuty 等。 |
| **GPU metrics you should monitor**<br>应该监控的 GPU 指标 | Utilization and SM Active, memory, temperature, power, clocks and throttle reasons, ECC/row remapping, XIDs, PCIe/NVLink throughput and errors.<br>利用率与 SM Active、显存、温度、功耗、时钟与降频原因、ECC/行重映射、XID、PCIe/NVLink 吞吐与错误。 |
| **Cluster metrics you should monitor**<br>应该监控的集群指标 | Node health, job queue time, GPU allocation rate, job success rate, network errors/congestion, storage throughput and capacity.<br>节点健康状态、作业排队时长、GPU 分配率、作业成功率、网络错误/拥塞、存储吞吐与容量。 |
| **Effect of the sampling interval**<br>采样间隔的影响 | Long intervals miss short spikes and anomalies; the collection pipeline itself can stall (the monitoring blind spot in this repo's W1 analysis.md).<br>间隔太长会漏掉短时尖峰和异常；采集链路自身也可能有停顿（本仓库 W1 analysis.md 的监控盲区）。 |
| **Log collection**<br>日志收集 | dmesg/journalctl (kernel and driver, XIDs), application logs, scheduler logs, centralized in ELK/Loki for search.<br>dmesg/journalctl（内核与驱动、XID）、应用日志、调度器日志，集中到 ELK/Loki 等系统便于检索。 |

<a id="xid"></a>
### XID、ECC 与硬件故障 · XID, ECC & hardware faults（24）

| 正面 Front | 背面 Back |
| --- | --- |
| **XID errors**<br>XID 错误 | GPU error codes the NVIDIA driver writes to the kernel log; view with dmesg or journalctl -k, e.g., "NVRM: Xid ... 79".<br>NVIDIA 驱动写入内核日志的 GPU 错误编号，用 dmesg 或 journalctl -k 查看，格式如 “NVRM: Xid ... 79”。 |
| **Xid 13** | Graphics Engine Exception: usually an application problem (out-of-bounds access, illegal instruction); check the code and driver version first.<br>Graphics Engine Exception：多为应用程序问题（越界访问、非法指令），先查代码和驱动版本。 |
| **Xid 31** | GPU memory page fault (MMU fault): usually an illegal memory access by the application.<br>GPU 内存页错误（MMU fault）：多为应用非法内存访问。 |
| **Xid 43** | GPU stopped processing: usually the user application faulted (e.g., was killed).<br>GPU 停止处理：通常是用户应用出错（如被终止）。 |
| **Xid 45** | Preemptive cleanup: typically follows a killed process or an earlier error; often ignorable.<br>被抢占/清理：通常因为进程被终止或其他错误的后续，常可忽略。 |
| **Xid 48** | Double-bit ECC error (DBE, uncorrectable): drain the node, reset the GPU, check row remapping/page retirement; RMA if it recurs.<br>双比特 ECC 错误（DBE，不可纠正）：隔离节点、重置 GPU、检查行重映射/页退役，反复出现则 RMA。 |
| **Xid 63** | ECC page retirement or row remapping recording event: usually needs a planned GPU reset to take effect.<br>ECC 页退役或行重映射记录事件：通常需要计划内重置 GPU 让其生效。 |
| **Xid 64** | ECC page retirement or row remapping recording failure: needs action, may require replacement.<br>ECC 页退役或行重映射记录失败：需要处理，可能需更换。 |
| **Xid 74** | NVLink error: check NVLink status and connections, reset; persistent errors need hardware investigation.<br>NVLink 错误：检查 NVLink 状态和线缆/连接器，重置；持续出现需硬件排查。 |
| **Xid 79** | GPU has fallen off the bus: severe. Drain the node, check PCIe, power, and cooling; reboot, reseat, or RMA.<br>GPU 从总线掉线（fallen off the bus）：严重。隔离节点，检查 PCIe、供电、散热，重启、重新插拔或 RMA。 |
| **Xid 92** | High single-bit ECC error rate: watch the trend; may signal aging hardware.<br>单比特 ECC 错误率过高：关注趋势，可能预示硬件老化。 |
| **Xid 94** | Contained ECC error: only the affected application is impacted; other processes continue (A100+).<br>被隔离的（contained）ECC 错误：只影响相关应用，其他进程不受影响（A100+）。 |
| **Xid 95** | Uncontained ECC error: requires a GPU reset (A100+).<br>未被隔离的（uncontained）ECC 错误：需要重置 GPU（A100+）。 |
| **Xid 119 / 120** | GSP firmware errors/timeouts: collect logs, update the driver, reset if needed.<br>GSP 固件相关错误/超时：收集日志，更新驱动，必要时重置。 |
| **Error Correcting Code (ECC)**<br>纠错码 | Automatically detects and corrects bit flips in GPU memory; enabled by default on data center GPUs.<br>自动检测并纠正显存位翻转，数据中心 GPU 默认开启。 |
| **SBE vs DBE**<br>单比特错误 vs 双比特错误 | Single-bit errors (SBE) are corrected automatically; double-bit errors (DBE) are uncorrectable and make applications fail.<br>单比特错误（SBE）可自动纠正；双比特错误（DBE）不可纠正，会导致应用出错。 |
| **Volatile vs aggregate ECC counts**<br>易失计数 vs 累计计数 | Volatile: since the driver last loaded. Aggregate: over the GPU's lifetime.<br>Volatile：自上次驱动加载以来的计数；Aggregate：GPU 生命周期累计。 |
| **Page retirement**<br>页退役 | Volta and earlier: faulty memory pages are marked as no longer used.<br>Volta 及以前：把出错的显存页标记为不再使用。 |
| **Row remapping**<br>行重映射 | A100 and later: replaces faulty memory rows with spare rows, usually effective after a GPU reset.<br>A100 及以后：用备用行替换出错的显存行，通常在 GPU 重置后生效。 |
| **Does disabling ECC fix ECC errors?**<br>关闭 ECC 能解决 ECC 错误吗 | No. Disabling ECC only hides errors and leads to silent data corruption.<br>不能。关闭 ECC 只会掩盖错误，导致静默数据损坏。 |
| **PCIe link degradation**<br>PCIe 链路降级 | Link Width/Gen in nvidia-smi -q below expected (x16 → x8, Gen5 → Gen3) cuts bandwidth; check the slot, riser, firmware.<br>nvidia-smi -q 中 Link Width/Gen 低于预期（如 x16 变 x8、Gen5 变 Gen3），带宽下降，需检查插槽、转接卡、固件。 |
| **GPU thermal throttling**<br>GPU 过热降频 | Hitting temperature thresholds triggers protective throttling; check fans/liquid cooling, inlet temperature, airflow, dust, rack layout.<br>温度达到阈值触发降频保护；检查风扇/液冷、进风温度、气流、灰尘、机柜布局。 |
| **Return Merchandise Authorization (RMA)**<br>退货授权（退修） | Returning failed hardware to the vendor for repair or replacement.<br>硬件故障退回厂商维修或更换。 |
| **Standard hardware fault workflow**<br>硬件故障标准处理流程 | Detect → isolate (drain, no new jobs) → diagnose (dcgmi diag, logs) → fix/reset/RMA → verify → return to service → document.<br>发现 → 隔离（drain，不再调度新作业）→ 诊断（dcgmi diag、日志）→ 修复/重置/RMA → 验证 → 恢复上线 → 记录。 |

<a id="slurm"></a>
### Slurm 与 HPC 调度 · Slurm & HPC scheduling（29）

| 正面 Front | 背面 Back |
| --- | --- |
| **Slurm** | Open-source HPC job scheduler/resource manager, the most common on AI training clusters; strong at batch, multi-node jobs, queues, and fair share.<br>开源 HPC 作业调度器/资源管理器，AI 训练集群最常用，擅长批处理、多节点作业、队列和公平共享。 |
| **slurmctld** | Slurm's central controller daemon (on the control node) that schedules and allocates resources.<br>Slurm 中央控制守护进程（控制节点），负责调度和资源分配。 |
| **slurmd** | Slurm daemon on each compute node that launches and monitors jobs.<br>每个计算节点上的 Slurm 守护进程，负责启动和监控作业。 |
| **slurmdbd** | Slurm database daemon that records job accounting.<br>Slurm 数据库守护进程，记录作业记账（accounting）信息。 |
| **Partition**<br>分区 | A logical queue of nodes in Slurm with its own limits and priority.<br>Slurm 中一组节点的逻辑队列，可设置不同的限制和优先级（类似队列）。 |
| **sbatch** | Submits a batch script; the job waits in the queue for scheduling.<br>提交批处理脚本，作业进入队列等待调度。 |
| **srun** | Launches parallel tasks on allocated resources, or requests resources and runs directly.<br>在分配的资源上启动并行任务；也可直接申请资源并运行。 |
| **salloc** | Requests an interactive allocation, then runs commands in a shell.<br>交互式申请资源分配，获得后在 shell 中运行命令。 |
| **squeue** | Shows the job queue and job states (PD pending, R running, etc.).<br>查看作业队列和作业状态（PD 排队、R 运行等）。 |
| **sinfo** | Shows partition and node states (idle, alloc, mix, drain, down).<br>查看分区和节点状态（idle、alloc、mix、drain、down）。 |
| **scancel** | Cancels a job.<br>取消作业。 |
| **sacct** | Queries accounting for finished jobs (duration, resources, exit code).<br>查询已完成作业的记账信息（时长、资源、退出码）。 |
| **scontrol** | Views and modifies Slurm config and state, e.g., scontrol show job / show node.<br>查看和修改 Slurm 配置与状态，如 scontrol show job / show node。 |
| **How to remove a node from scheduling**<br>如何把节点隔离出调度 | scontrol update nodename=&lt;node&gt; state=drain reason="..."; after repair, state=resume.<br>scontrol update nodename=&lt;节点&gt; state=drain reason="原因"；修复后 state=resume。 |
| **Slurm node state: drain**<br>Slurm 节点状态 drain | The node accepts no new jobs while running jobs finish. Used for maintenance and fault isolation.<br>节点不再接受新作业，正在运行的作业继续完成。用于维护和故障隔离。 |
| **GRES**<br>通用资源 | Generic RESources: how Slurm manages GPUs and other special resources, defined in gres.conf.<br>Generic RESources：Slurm 管理 GPU 等特殊资源的机制，在 gres.conf 中定义。 |
| **How to request GPUs in Slurm**<br>Slurm 申请 GPU 的写法 | --gres=gpu:4 or --gpus=4, --gpus-per-node=8.<br>--gres=gpu:4 或 --gpus=4、--gpus-per-node=8。 |
| **#SBATCH directives**<br>#SBATCH 指令 | Resource declarations at the top of a batch script, e.g., #SBATCH --nodes=2, --ntasks-per-node=8, --time=04:00:00.<br>批处理脚本开头的资源声明，如 #SBATCH --nodes=2、--ntasks-per-node=8、--time=04:00:00。 |
| **Fair-share**<br>公平共享 | Adjusts priority by each user's/account's historical usage; heavy users get lower priority.<br>根据用户/账户的历史使用量调整优先级，用得多的优先级降低。 |
| **Backfill scheduling**<br>回填调度 | Fills idle resources with small jobs without delaying higher-priority jobs, raising utilization.<br>在不推迟高优先级作业的前提下，用小作业填充空闲资源，提高利用率。 |
| **Preemption**<br>抢占 | Higher-priority jobs can suspend, requeue, or kill lower-priority jobs to get resources.<br>高优先级作业可以暂停、重新排队或终止低优先级作业以获得资源。 |
| **QoS (Slurm)**<br>服务质量（Slurm） | Quality of Service settings: resource caps, priority, preemption rules.<br>服务质量配置：限制资源上限、设置优先级、抢占规则。 |
| **Reservation**<br>预留 | Reserves nodes and a time window for specific users or maintenance.<br>为特定用户或维护窗口预留节点和时间段。 |
| **Job array**<br>作业数组 | Submits many similar jobs at once (e.g., hyperparameter sweeps), distinguished by index.<br>一次提交大量相似作业（如超参搜索），用索引区分。 |
| **Prolog / Epilog**<br>作业前 / 作业后脚本 | Scripts run on nodes before a job starts / after it ends; used for health checks (e.g., dcgmi diag -r 1) and cleanup.<br>作业开始前 / 结束后在节点上执行的脚本，常用于健康检查（如 dcgmi diag -r 1）和清理。 |
| **HealthCheckProgram**<br>健康检查程序 | Program Slurm runs periodically on nodes; drains the node automatically when it finds a problem.<br>Slurm 定期在节点上运行的健康检查程序，发现问题自动 drain 节点。 |
| **Pyxis + Enroot** | Enroot turns container images into unprivileged sandboxes; Pyxis is a Slurm plugin enabling srun --container-image=nvcr.io#nvidia/pytorch:xx.xx-py3.<br>Enroot：把容器镜像转为非特权沙箱运行；Pyxis：Slurm 插件，支持 srun --container-image=nvcr.io#nvidia/pytorch:xx.xx-py3。 |
| **Apptainer / Singularity** | Container runtimes common in HPC; run as non-root, suited to shared multi-user clusters.<br>HPC 常用的容器运行时，非 root 运行，适合多用户共享集群。 |
| **PMIx** | Process management interface; srun --mpi=pmix uses it to launch multi-node MPI jobs.<br>进程管理接口，srun --mpi=pmix 用它启动 MPI 多节点作业。 |

<a id="k8s"></a>
### Kubernetes 与 GPU 编排 · Kubernetes & GPU orchestration（34）

| 正面 Front | 背面 Back |
| --- | --- |
| **Kubernetes (K8s)** | Container orchestration: automated deployment, scaling, service discovery, rolling updates, self-healing. Strong for long-running services such as inference.<br>容器编排平台：自动部署、扩缩容、服务发现、滚动升级、自愈。擅长长期运行的服务（如推理）。 |
| **Slurm vs Kubernetes: how to choose**<br>Slurm 与 Kubernetes 怎么选 | Tightly coupled multi-node training, batch, fair share → Slurm. Inference microservices, autoscaling, rolling updates, cloud native → Kubernetes.<br>多节点紧耦合训练、批处理、公平共享 → Slurm；推理微服务、自动扩缩、滚动更新、云原生 → Kubernetes。 |
| **Pod** | Smallest schedulable unit in K8s: one or more containers sharing network and storage.<br>K8s 最小调度单元，包含一个或多个共享网络/存储的容器。 |
| **Node / kubelet**<br>节点 / kubelet | A node is a worker machine; kubelet is the agent on it that starts pods and reports resources.<br>Node 是工作节点；kubelet 是节点上的代理，负责启动 Pod 并上报资源。 |
| **Deployment / StatefulSet / Job** | Deployment: stateless services; StatefulSet: stateful services; Job: run-to-completion batch tasks.<br>Deployment：无状态服务；StatefulSet：有状态服务；Job：一次性批处理任务。 |
| **Namespace**<br>命名空间 | K8s unit for isolating and grouping resources; used for multi-tenancy and quotas.<br>K8s 中的资源隔离与分组单位，常用于多租户和配额。 |
| **ResourceQuota**<br>资源配额 | Caps total resources per namespace (e.g., number of GPUs).<br>按 namespace 限制资源总量（如 GPU 数）。 |
| **nvidia.com/gpu** | Extended resource registered by the NVIDIA device plugin; pods request whole GPUs in resources.limits.<br>NVIDIA Device Plugin 注册的扩展资源名，Pod 在 resources.limits 中申请整数个 GPU。 |
| **Do GPUs go only in limits in K8s?**<br>GPU 在 K8s 中只能写在 limits 吗 | As an extended resource, GPUs are set in limits (requests, if given, must equal limits); no overcommit.<br>GPU 作为扩展资源，在 limits 中指定（requests 若写必须等于 limits），不支持超额分配。 |
| **NVIDIA device plugin**<br>NVIDIA 设备插件 | DaemonSet that registers nvidia.com/gpu with the kubelet and assigns specific GPUs when pods start.<br>DaemonSet，向 kubelet 注册 nvidia.com/gpu 资源，并在 Pod 启动时分配具体 GPU。 |
| **NVIDIA GPU Operator** | Uses the Operator pattern to deploy and manage everything a GPU node needs, making GPU nodes as plug-and-play as CPU nodes.<br>用 Operator 自动部署和管理 GPU 节点所需全部组件，让 GPU 节点像 CPU 节点一样即插即用。 |
| **Components of the GPU Operator**<br>GPU Operator 包含哪些组件 | GPU driver container, Container Toolkit, device plugin, GPU Feature Discovery, DCGM/DCGM Exporter, MIG Manager, Node Feature Discovery, validator.<br>GPU 驱动容器、Container Toolkit、Device Plugin、GPU Feature Discovery、DCGM/DCGM Exporter、MIG Manager、Node Feature Discovery、Validator。 |
| **ClusterPolicy** | The GPU Operator's CRD that declares which components are enabled and how they are configured.<br>GPU Operator 的 CRD，集中声明各组件的开关和配置。 |
| **Driver container**<br>驱动容器 | The GPU Operator installs the driver on nodes as a container, so the host OS doesn't need a preinstalled driver.<br>GPU Operator 以容器方式在节点上安装驱动，无需在主机 OS 预装驱动。 |
| **GPU Feature Discovery (GFD)**<br>GPU 特性发现 | Labels nodes with GPU properties: model (nvidia.com/gpu.product), memory, count, MIG config, CUDA driver version.<br>给节点打 GPU 标签：型号（nvidia.com/gpu.product）、显存、数量、MIG 配置、CUDA 驱动版本。 |
| **Node Feature Discovery (NFD)**<br>节点特性发现 | Detects node hardware features (e.g., PCI devices) and labels them; the GPU Operator relies on it to find GPU nodes.<br>检测节点硬件特性（如 PCI 设备）并打标签，GPU Operator 依赖它识别 GPU 节点。 |
| **MIG Manager**<br>MIG 管理器 | GPU Operator component that configures MIG partitions automatically from node labels.<br>GPU Operator 组件，根据节点标签自动配置 MIG 分区。 |
| **MIG strategies in K8s: single vs mixed**<br>K8s 中 MIG 的 single 与 mixed 策略 | single: all MIG instances on a node share one profile and appear as nvidia.com/gpu; mixed: each profile is its own resource, e.g., nvidia.com/mig-1g.10gb.<br>single：节点上所有 MIG 实例同规格，仍以 nvidia.com/gpu 暴露；mixed：不同规格分别暴露为 nvidia.com/mig-1g.10gb 等资源。 |
| **GPU time-slicing in K8s**<br>K8s 中的 GPU 时间片 | The device plugin advertises one GPU as multiple replicas so pods share it in turns; no memory or fault isolation.<br>通过 Device Plugin 配置把一张 GPU 宣告为多个副本，多个 Pod 轮流共享；无显存和故障隔离。 |
| **NVIDIA Network Operator** | Deploys high-speed networking in K8s: NIC drivers (OFED), RDMA device plugin, SR-IOV, modules needed for GPUDirect RDMA.<br>在 K8s 中部署高速网络组件：网卡驱动（OFED）、RDMA 设备插件、SR-IOV、GPUDirect RDMA 所需模块。 |
| **SR-IOV**<br>单根 IO 虚拟化 | Splits one physical NIC into multiple virtual functions (VFs) assigned directly to pods/VMs with near-native performance.<br>把一块物理网卡虚拟成多个虚拟功能（VF），分给不同 Pod/VM 直接使用，接近原生性能。 |
| **Helm** | Kubernetes package manager; the GPU Operator and Network Operator install via Helm charts.<br>K8s 包管理器；GPU Operator、Network Operator 都通过 Helm chart 安装。 |
| **Operator pattern**<br>Operator 模式 | Automates operational knowledge (install, upgrade, repair) with custom controllers + CRDs.<br>用自定义控制器 + CRD 把运维知识自动化（安装、升级、修复）。 |
| **DaemonSet** | Ensures one pod copy runs on every (or selected) node; used to deploy the device plugin and DCGM Exporter.<br>确保每个（或选定的）节点上都运行一个 Pod 副本，Device Plugin、DCGM Exporter 都用它部署。 |
| **nodeSelector / affinity / taints &amp; tolerations**<br>节点选择 / 亲和性 / 污点与容忍 | Control which nodes pods land on; GPU nodes often carry a taint so only GPU jobs with a matching toleration schedule there.<br>控制 Pod 调度到哪些节点；GPU 节点常加 taint，只有声明 toleration 的 GPU 作业才能调度上去。 |
| **Horizontal Pod Autoscaler (HPA)**<br>水平自动扩缩 | Adds/removes pod replicas based on metrics (CPU, QPS, custom GPU metrics); used for inference services.<br>根据指标（CPU、QPS、自定义 GPU 指标）自动增减 Pod 副本数，用于推理服务。 |
| **Run:ai** | NVIDIA-acquired K8s AI workload orchestration: GPU quotas, fractional GPUs, queues, fair share, dynamic scheduling.<br>NVIDIA 收购的 K8s AI 工作负载编排平台：GPU 配额、分数 GPU、队列、公平共享、动态调度。 |
| **KAI Scheduler** | K8s AI scheduler open-sourced from the Run:ai scheduler, with gang scheduling, quotas, and fair share.<br>由 Run:ai 调度器开源而来的 K8s AI 调度器，支持 gang scheduling、配额与公平共享。 |
| **Batch scheduling options on K8s**<br>K8s 上的批调度方案 | Volcano, Kueue, KAI Scheduler, etc., adding the gang scheduling and queues the default scheduler lacks.<br>Volcano、Kueue、KAI Scheduler 等，补充原生调度器缺少的 gang scheduling 和队列功能。 |
| **Kubeflow / KServe** | Kubeflow: ML platform on K8s (pipelines, training jobs); KServe: model serving framework on K8s.<br>Kubeflow：K8s 上的 ML 平台（流水线、训练作业）；KServe：K8s 上的模型推理服务框架。 |
| **Dynamic Resource Allocation (DRA)**<br>动态资源分配 | Newer K8s device allocation mechanism that describes and shares GPUs and other devices more flexibly than device plugins.<br>K8s 较新的设备分配机制，比 Device Plugin 更灵活地描述和共享 GPU 等设备。 |
| **Base Command Manager (BCM)** | Cluster management software (formerly Bright Cluster Manager): bare-metal provisioning, OS images, Slurm/K8s deployment, monitoring, user management.<br>集群管理软件（原 Bright Cluster Manager）：裸机部署、OS 镜像、Slurm/K8s 部署、监控、用户管理。 |
| **NVIDIA Mission Control** | AI factory operations stack: combines cluster management (BCM), workload scheduling (Run:ai/Slurm), health monitoring, and automated failure recovery.<br>AI 工厂运维软件栈：整合集群管理（BCM）、工作负载调度（Run:ai/Slurm）、健康监控与自动故障恢复。 |
| **Base Command Platform** | Web/CLI platform on DGX Cloud for managing jobs, datasets, and workspaces.<br>DGX Cloud 上的 Web/CLI 平台，管理作业、数据集、工作区。 |

<a id="sharing"></a>
### GPU 共享与虚拟化 · GPU sharing & virtualization（25）

| 正面 Front | 背面 Back |
| --- | --- |
| **Five ways to share GPUs**<br>GPU 共享的五种方式 | PCIe passthrough, NVIDIA vGPU, MIG, time-slicing, MPS.<br>PCIe 直通、NVIDIA vGPU、MIG、时间片（time-slicing）、MPS。 |
| **PCIe passthrough**<br>GPU 直通 | Assigns a whole physical GPU directly to one VM; near bare-metal performance but one GPU per VM.<br>把整张物理 GPU 直接分配给一个虚拟机，接近裸机性能，但一张卡只能给一个 VM。 |
| **NVIDIA vGPU** | Shares one GPU among multiple VMs on a hypervisor (e.g., VMware vSphere); requires vGPU software and a license.<br>在 hypervisor（如 VMware vSphere）上把一张 GPU 分给多个虚拟机共享；需要 vGPU 软件和授权（license）。 |
| **vGPU components**<br>vGPU 组成 | Virtual GPU Manager on the hypervisor + guest driver in the VM + license server (NVIDIA License System).<br>hypervisor 上的 Virtual GPU Manager + 虚拟机内的 guest 驱动 + 授权服务器（NVIDIA License System）。 |
| **vGPU software editions**<br>vGPU 软件版本 | vPC (virtual desktops), vWS / RTX Virtual Workstation (pro graphics), vCS (Virtual Compute Server for compute/AI, now part of NVIDIA AI Enterprise).<br>vPC（虚拟桌面）、vWS / RTX Virtual Workstation（专业图形）、vCS（Virtual Compute Server，计算/AI，现含在 NVIDIA AI Enterprise 中）。 |
| **vGPU scheduling policies**<br>vGPU 调度策略 | Best effort (default; can use idle capacity), equal share, fixed share (predictable performance).<br>Best effort（默认，空闲时可多用）、Equal share（平均分）、Fixed share（固定份额，性能可预测）。 |
| **MIG-backed vGPU**<br>基于 MIG 的 vGPU | Assigns MIG instances to VMs, combining virtualization with MIG hardware isolation.<br>把 MIG 实例分配给虚拟机，兼具虚拟化与 MIG 硬件隔离。 |
| **Multi-Instance GPU (MIG)**<br>多实例 GPU | Partitions one GPU in hardware into up to 7 instances, each with its own SMs, L2 cache, memory, and bandwidth: hardware isolation and QoS.<br>把一张 GPU 硬件切分成最多 7 个独立实例，每个有独立的 SM、L2 缓存、显存和带宽，硬件级隔离与 QoS。 |
| **GPUs that support MIG**<br>支持 MIG 的 GPU | Data center GPUs from Ampere on: A100, A30, H100, H200, B200, etc. (A30 up to 4 instances). Consumer cards don't support it.<br>Ampere 起的数据中心 GPU：A100、A30、H100、H200、B200 等（A30 最多 4 实例）。消费级卡不支持。 |
| **MIG profiles on A100 40GB**<br>A100 40GB 的 MIG 规格 | 1g.5gb (up to 7), 2g.10gb, 3g.20gb, 4g.20gb, 7g.40gb.<br>1g.5gb（最多 7 个）、2g.10gb、3g.20gb、4g.20gb、7g.40gb。 |
| **Smallest MIG profile on 80 GB GPUs**<br>80 GB 卡的 MIG 最小规格 | A100 80GB / H100 80GB: smallest is 1g.10gb, up to 7 instances.<br>A100 80GB / H100 80GB 最小为 1g.10gb，最多 7 个。 |
| **Reading a MIG profile name like "3g.20gb"**<br>MIG 规格名 “3g.20gb” 的含义 | 3 compute slices (g) + 20 GB of memory.<br>3 个计算切片（g）+ 20 GB 显存。 |
| **GPU Instance (GI) vs Compute Instance (CI)**<br>GPU 实例 vs 计算实例 | GI: hardware partition of memory and compute slices. CI: further split of compute inside a GI, sharing the GI's memory.<br>GI：显存和计算切片的硬件分区；CI：在 GI 内进一步划分计算资源，共享 GI 的显存。 |
| **Steps to enable MIG**<br>开启 MIG 的步骤 | nvidia-smi -i 0 -mig 1 (GPU reset needed) → create GPU instances (-cgi) → create compute instances (-cci), or -C to create both.<br>nvidia-smi -i 0 -mig 1（需重置 GPU）→ 创建 GPU 实例（-cgi）→ 创建计算实例（-cci），或用 -C 一并创建。 |
| **nvidia-smi mig -lgip** | Lists the MIG GPU instance profiles the GPU supports and how many are available.<br>列出该 GPU 支持的 MIG GPU 实例规格和可用数量。 |
| **mig-parted** | NVIDIA's declarative MIG partitioning tool that applies layouts from a config file; used by the GPU Operator's MIG Manager.<br>NVIDIA 的声明式 MIG 分区工具，按配置文件批量设置，GPU Operator 的 MIG Manager 使用它。 |
| **Do MIG instances survive a reboot?**<br>MIG 实例重启后还在吗 | MIG mode persists, but instances usually need to be recreated, so production uses mig-parted/MIG Manager to automate it.<br>MIG 模式设置会保留，但实例通常需要重新创建，所以生产中用 mig-parted/MIG Manager 自动化。 |
| **Time-slicing**<br>时间片 | Multiple processes/containers take turns on the whole GPU; simple and works on any GPU, but no memory or fault isolation.<br>多个进程/容器轮流使用整张 GPU；配置简单、任何 GPU 可用，但没有显存隔离和故障隔离。 |
| **Multi-Process Service (MPS)**<br>多进程服务 | Lets kernels from multiple CUDA processes run concurrently on one GPU to raise utilization for small jobs; can cap SM share, but memory/fault isolation is limited.<br>让多个 CUDA 进程的 kernel 并发跑在同一 GPU 上，提高小任务利用率；可限制 SM 比例，但显存/故障隔离有限。 |
| **MPS control commands**<br>MPS 控制命令 | nvidia-cuda-mps-control -d starts the daemon; CUDA_MPS_ACTIVE_THREAD_PERCENTAGE caps the SM share per client.<br>nvidia-cuda-mps-control -d 启动守护进程；CUDA_MPS_ACTIVE_THREAD_PERCENTAGE 限制每个客户端可用的 SM 比例。 |
| **Strong isolation + multi-tenant: which?**<br>需要强隔离 + 多租户选什么 | MIG (containers) or MIG-backed vGPU (VMs).<br>MIG（容器场景）或 MIG-backed vGPU（虚拟机场景）。 |
| **Several VMs sharing a GPU: which?**<br>多个 VM 共享 GPU 选什么 | NVIDIA vGPU (licensed).<br>NVIDIA vGPU（需授权）。 |
| **Dev/test, small inference, squeezing idle GPUs: which?**<br>开发测试、小推理、榨干空闲 GPU 选什么 | Time-slicing (simple) or MPS (better concurrency), accepting weak isolation.<br>时间片（简单）或 MPS（并发更好），接受弱隔离。 |
| **One VM needs a full GPU at max performance: which?**<br>单 VM 要整卡最高性能选什么 | PCIe passthrough.<br>PCIe 直通。 |
| **Isolation strength from strongest to weakest**<br>隔离强度从强到弱 | Passthrough (exclusive) ≈ MIG (hardware partition) &gt; time-sliced vGPU &gt; MPS &gt; time-slicing (no isolation).<br>直通（独占）≈ MIG（硬件分区）&gt; vGPU 时间片 &gt; MPS &gt; 时间片（无隔离）。 |

<a id="containers"></a>
### 容器与 CUDA 兼容性 · Containers & CUDA compatibility（18）

| 正面 Front | 背面 Back |
| --- | --- |
| **Why use containers for AI**<br>为什么 AI 用容器 | Packages framework, CUDA, libraries, and dependencies into a consistent, reproducible, portable environment — no more "works on my machine".<br>把框架、CUDA、库和依赖打包成一致环境，可复现、可移植、易部署，避免“我机器上能跑”。 |
| **NVIDIA Container Toolkit**<br>NVIDIA 容器工具包 | Lets Docker, containerd, CRI-O, etc. access GPUs by injecting GPU devices and driver libraries at container start.<br>让 Docker、containerd、CRI-O 等容器运行时访问 GPU：在容器启动时注入 GPU 设备和驱动库。 |
| **Container Toolkit components**<br>Container Toolkit 组件 | libnvidia-container, nvidia-container-runtime, the nvidia-ctk CLI, CDI support.<br>libnvidia-container、nvidia-container-runtime、nvidia-ctk 命令行工具、CDI 支持。 |
| **nvidia-ctk runtime configure** | Writes the NVIDIA runtime into the Docker/containerd configuration.<br>把 NVIDIA 运行时写入 Docker/containerd 配置。 |
| **Container Device Interface (CDI)**<br>容器设备接口 | Standard spec describing how to expose devices to containers; the Container Toolkit can generate CDI specs for GPUs.<br>描述如何把设备暴露给容器的标准规范，Container Toolkit 可生成 GPU 的 CDI 描述。 |
| **docker run --gpus all** | Requests all GPUs for the container; or --gpus '"device=0,1"' to pick specific ones.<br>请求把所有 GPU 交给容器；也可 --gpus '"device=0,1"' 指定。 |
| **What happens without --gpus**<br>不加 --gpus 的后果 | The container has no GPU devices and no nvidia-smi: "executable file not found" (incident 01 in this repo).<br>容器里没有 GPU 设备和 nvidia-smi，报 executable file not found（本仓库故障记录 01）。 |
| **NVIDIA_VISIBLE_DEVICES** | Container env var selecting visible GPUs (all, none, or indexes/UUIDs).<br>容器环境变量，指定容器可见的 GPU（all、none 或编号/UUID）。 |
| **NVIDIA_DRIVER_CAPABILITIES** | Selects which driver capabilities are injected: compute, utility (nvidia-smi), graphics, video, etc.<br>指定注入哪些驱动能力：compute、utility（nvidia-smi）、graphics、video 等。 |
| **What must be installed on the host**<br>宿主机需要装什么 | Only the NVIDIA driver + Container Toolkit. CUDA Toolkit, cuDNN, and frameworks live in the container image.<br>只需要 NVIDIA 驱动 + Container Toolkit。CUDA Toolkit、cuDNN、框架都在容器镜像里。 |
| **CUDA driver backward compatibility**<br>CUDA 驱动向后兼容 | Newer drivers run applications built with older CUDA versions.<br>新驱动可以运行用旧 CUDA 版本构建的应用。 |
| **Container CUDA newer than the driver**<br>容器 CUDA 比驱动新会怎样 | Fails with "CUDA driver version is insufficient". Fix: upgrade the host driver; data center GPUs can also use the CUDA forward compatibility package.<br>报 “CUDA driver version is insufficient”。解决：升级宿主机驱动；数据中心卡也可用 CUDA forward compatibility 包。 |
| **Does installing a newer CUDA Toolkit on the host fix an old driver?**<br>在宿主机装新 CUDA Toolkit 能解决驱动不足吗 | No. The driver decides which CUDA versions can run; the Toolkit is only a development tool.<br>不能。能运行哪个 CUDA 版本由驱动决定，Toolkit 只是开发工具。 |
| **CUDA minor version compatibility**<br>CUDA 小版本兼容 | Since CUDA 11, apps built with a newer minor version usually run on an older driver of the same major version (except new features).<br>CUDA 11 起，同一主版本内用较新小版本构建的应用通常可在该主版本的较旧驱动上运行（新特性除外）。 |
| **CUDA forward compatibility package**<br>CUDA 前向兼容包 | Compat package (cuda-compat) that lets an older driver run apps from a newer CUDA major version on data center GPUs.<br>在数据中心 GPU 上让旧驱动运行更新 CUDA 主版本应用的兼容包（cuda-compat）。 |
| **Advantages of NGC containers**<br>NGC 容器的优势 | Monthly, tested, performance-tuned combinations of framework + CUDA + libraries from NVIDIA, reducing dependency conflicts.<br>NVIDIA 每月发布、经过测试与性能调优的框架 + CUDA + 库组合，减少依赖冲突。 |
| **CUDA base images: base / runtime / devel**<br>CUDA 基础镜像 base / runtime / devel | base: minimal CUDA runtime; runtime: adds CUDA math libraries; devel: adds compilers and headers for building.<br>base：最小 CUDA 运行时；runtime：加上 CUDA 数学库等；devel：再加编译器和头文件，用于构建。 |
| **Container image security practices**<br>镜像安全实践 | Use trusted sources (NGC), pin version tags, scan for vulnerabilities, keep images minimal, don't run as root.<br>使用可信来源（NGC）、固定版本标签、扫描漏洞、最小化镜像、不以 root 运行。 |

<a id="ops"></a>
### 运维流程与排障 · Operations processes & troubleshooting（33）

| 正面 Front | 背面 Back |
| --- | --- |
| **Cluster acceptance (burn-in)**<br>集群上线验收 | Before handover, run long stress and diagnostics: dcgmi diag -r 3, NCCL tests, HPL, storage tests, to confirm performance and stability.<br>交付前跑长时间压力和诊断：dcgmi diag -r 3、NCCL 测试、HPL、存储压测，确认性能和稳定性达标。 |
| **HPL (High Performance Linpack)** | Standard benchmark of cluster floating-point performance (used for TOP500), also used as a whole-system stability stress test.<br>衡量集群浮点性能的标准基准（TOP500 排名用），也用于整机稳定性压测。 |
| **Provisioning**<br>部署装机 | Mass-deploying nodes via PXE network boot + OS images (BCM, etc.) to keep configuration consistent.<br>通过 PXE 网络启动 + 系统镜像批量部署节点（BCM 等工具），保证配置一致。 |
| **Version baseline**<br>版本基线 | Standardize OS, kernel, GPU driver, CUDA, firmware (GPU, NIC, BMC), OFED, and container runtime to avoid "snowflake" nodes.<br>统一 OS、内核、GPU 驱动、CUDA、固件（GPU、网卡、BMC）、OFED、容器运行时版本，避免“雪花节点”。 |
| **Rolling upgrade**<br>滚动升级 | Drain nodes in batches → upgrade driver/firmware → verify → resume, keeping the cluster available throughout.<br>分批 drain 节点 → 升级驱动/固件 → 验证 → 恢复，保证集群整体持续可用。 |
| **Firmware update tools**<br>固件更新工具 | DGX uses tools such as nvfwupd; NIC firmware uses mlxfwmanager / mlxup.<br>DGX 用 nvfwupd 等工具更新固件；网卡固件用 mlxfwmanager / mlxup。 |
| **IPMI / Redfish** | Protocols for remote server management via the BMC: power control, sensors, logs, remote console. Redfish is the newer REST-based standard.<br>通过 BMC 远程管理服务器的协议：电源控制、传感器、日志、远程控制台。Redfish 是基于 REST 的新标准。 |
| **ipmitool** | IPMI CLI, e.g., ipmitool power status / power cycle.<br>IPMI 命令行工具，例如 ipmitool power status / power cycle。 |
| **Pre-job health checks**<br>作业前健康检查 | Run quick checks in Slurm Prolog or a K8s init container (dcgmi diag -r 1, NVLink/IB state) and isolate bad nodes automatically.<br>在 Slurm Prolog 或 K8s init 容器中跑快速检查（dcgmi diag -r 1、NVLink/IB 状态），有问题自动隔离节点。 |
| **Symptom: nvidia-smi can't communicate with the driver**<br>症状：nvidia-smi 报无法与驱动通信 | Check the driver module is loaded (lsmod \| grep nvidia), DKMS rebuilt it after a kernel upgrade, Secure Boot isn't blocking it.<br>检查驱动模块是否加载（lsmod \| grep nvidia）、内核升级后 DKMS 是否重编译、Secure Boot 是否阻止加载。 |
| **Symptom: CUDA init fails on HGX/DGX**<br>症状：HGX/DGX 上 CUDA 初始化失败 | Check that the nvidia-fabricmanager service is running and its version matches the driver.<br>检查 nvidia-fabricmanager 服务是否运行、版本是否与驱动一致。 |
| **Symptom: container can't see GPUs**<br>症状：容器里看不到 GPU | Check the --gpus flag, Container Toolkit config, device plugin/GPU Operator state in K8s, and whether the pod requested nvidia.com/gpu.<br>检查 --gpus 参数、Container Toolkit 配置、K8s 中 Device Plugin/GPU Operator 状态、Pod 是否申请了 nvidia.com/gpu。 |
| **Symptom: sudden GPU slowdown**<br>症状：GPU 性能突然下降 | Check throttle reasons (thermal/power), PCIe link width/gen, ECC errors, competing processes, clock settings.<br>看降频原因（温度/功耗）、PCIe 链路宽度/代数、ECC 错误、是否有其他进程抢占、时钟设置。 |
| **Symptom: slow multi-node training**<br>症状：多节点训练慢 | NCCL_DEBUG=INFO to see if NET/IB is used; nccl-tests for busbw; check IB port speed, topology, GPUDirect RDMA, congestion.<br>NCCL_DEBUG=INFO 看是否走 NET/IB；用 nccl-tests 测 busbw；检查 IB 端口速率、拓扑、GPUDirect RDMA、拥塞。 |
| **NCCL_DEBUG=INFO** | Prints NCCL init details: network used (IB/Socket), topology, channel count; the first step for communication issues.<br>打印 NCCL 初始化信息：使用的网络（IB/Socket）、拓扑、通道数，排查通信问题第一步。 |
| **NCCL falls back to NET/Socket — meaning?**<br>NCCL 回退到 NET/Socket 说明什么 | InfiniBand/RDMA isn't being used; traffic goes over TCP. Check RDMA drivers, NIC state, RDMA devices mounted in the container, NCCL_IB_HCA.<br>没有用上 InfiniBand/RDMA，走了 TCP。检查 RDMA 驱动、网卡状态、容器是否挂载 RDMA 设备、NCCL_IB_HCA 设置。 |
| **NCCL_SOCKET_IFNAME / NCCL_IB_HCA** | Choose the TCP network interface / InfiniBand devices NCCL uses.<br>指定 NCCL 使用的 TCP 网卡接口 / InfiniBand 网卡设备。 |
| **Symptom: low GPU utilization, high iowait**<br>症状：GPU 利用率低、iowait 高 | A data loading or storage bottleneck (see the storage deck).<br>数据加载或存储瓶颈（见存储牌组）。 |
| **Symptom: CUDA out of memory**<br>症状：CUDA 显存不足 | Smaller batch, mixed precision, gradient accumulation, activation checkpointing, quantization, model parallelism, or check for leftover processes holding memory.<br>减小 batch、混合精度、梯度累积、激活重计算、量化、模型并行，或检查是否有残留进程占用显存。 |
| **Symptom: XID in dmesg**<br>症状：dmesg 出现 XID | Use the XID number to tell app issues (13/31/43) from hardware issues (48/74/79/95); drain the node first for hardware issues.<br>按 XID 编号判断是应用问题（13/31/43）还是硬件问题（48/74/79/95），硬件问题先 drain 节点。 |
| **Runbook**<br>运维手册 | Standard steps for a specific alert or failure so on-call staff can act repeatably (this repo's runbooks/ folder).<br>针对特定告警/故障的标准处理步骤，让值班人员可重复执行（本仓库 runbooks/ 目录）。 |
| **Postmortem**<br>事后复盘 | After an incident, record timeline, root cause, impact, and action items; blameless and focused on improvement.<br>故障后记录时间线、根因、影响和改进项，强调不追责、持续改进。 |
| **MTTR / MTBF**<br>平均修复时间 / 平均故障间隔 | Mean Time To Repair / Mean Time Between Failures. Large-cluster ops aims to cut MTTR and increase productive training time.<br>平均修复时间 / 平均故障间隔时间。大集群运维要降低 MTTR、提高有效训练时间。 |
| **SLA / SLO / SLI**<br>服务等级协议 / 目标 / 指标 | SLA: promise to customers; SLO: internal target (e.g., 99.9% availability); SLI: the measured indicator.<br>SLA：对客户的服务承诺；SLO：内部目标（如 99.9% 可用）；SLI：实际测量的指标。 |
| **Capacity planning**<br>容量规划 | Plan expansion from GPU usage, queue times, and growth trends while reclaiming idle resources.<br>基于 GPU 使用率、排队时长、增长趋势规划扩容；同时回收闲置资源。 |
| **Management causes of low GPU utilization**<br>GPU 利用率低的常见管理原因 | Jobs holding idle GPUs (interactive/debug sessions), resource fragmentation, poor scheduling policy, data bottlenecks.<br>作业申请了 GPU 却空闲（交互式会话、调试）、资源碎片、调度策略不佳、数据瓶颈。 |
| **Chargeback / showback**<br>成本分摊 / 成本展示 | Track and bill (or show) GPU cost per team to encourage efficient use.<br>按团队统计并分摊（或展示）GPU 使用成本，促进资源合理使用。 |
| **Multi-tenant security measures**<br>多租户安全措施 | Least-privilege RBAC, namespace/account quotas, MIG or vGPU isolation, network partitions (PKey/VLAN), DPU isolation, controlled image sources.<br>RBAC 最小权限、namespace/账户配额、MIG 或 vGPU 隔离、网络分区（PKey/VLAN）、DPU 隔离、镜像来源控制。 |
| **Role-Based Access Control (RBAC)**<br>基于角色的访问控制 | Grants the minimum necessary permissions by role.<br>基于角色的访问控制：按角色授予最小必要权限。 |
| **Cloud cost discipline**<br>云上成本运维纪律 | Set a budget and teardown time before experiments, clean up right after (instances, storage, snapshots, load balancers, NAT), reconcile the bill (this repo's cost-safety.md).<br>实验前定预算和销毁时间，结束即清理（实例、存储、快照、负载均衡、NAT），核对账单（本仓库 cost-safety.md）。 |
| **Infrastructure as Code (IaC)**<br>基础设施即代码 | Describe and deploy infrastructure as code (Terraform, Ansible): reproducible, reviewable, destroyable (this repo's W2 Terraform work).<br>用代码（Terraform、Ansible）描述和部署基础设施，可复现、可审查、可销毁（本仓库 W2 Terraform 实践）。 |
| **Ansible** | Agentless configuration management that configures nodes in bulk over SSH (install drivers, change configs).<br>无代理的配置管理工具，通过 SSH 批量配置节点（装驱动、改配置）。 |
| **Terraform** | Declarative infrastructure tool that manages cloud resource lifecycle via plan → apply → destroy.<br>声明式基础设施编排工具，plan → apply → destroy 管理云资源生命周期。 |

## 缩写速查 · Acronyms

<a id="acronyms"></a>
### 缩写速查（跨领域） · Acronyms (cross-domain)（52）

| 正面 Front | 背面 Back |
| --- | --- |
| **AIIO** | AI Infrastructure and Operations.<br>AI 基础设施与运维。 |
| **NCA / NCP** | NVIDIA-Certified Associate / NVIDIA-Certified Professional.<br>NVIDIA 认证助理级 / 专业级。 |
| **GPU / CPU / DPU** | Graphics / Central / Data Processing Unit.<br>图形处理器 / 中央处理器 / 数据处理器。 |
| **SM** | Streaming Multiprocessor, the GPU's basic compute unit.<br>流式多处理器，GPU 的基本计算单元。 |
| **HBM** | High Bandwidth Memory.<br>高带宽显存。 |
| **NVML** | NVIDIA Management Library.<br>NVIDIA 管理库。 |
| **DCGM** | Data Center GPU Manager.<br>数据中心 GPU 管理器。 |
| **MIG** | Multi-Instance GPU.<br>多实例 GPU。 |
| **MPS** | Multi-Process Service.<br>多进程服务。 |
| **vGPU / vCS / vWS** | virtual GPU / Virtual Compute Server / Virtual Workstation.<br>虚拟 GPU / 虚拟计算服务器 / 虚拟工作站。 |
| **NCCL** | NVIDIA Collective Communications Library.<br>NVIDIA 集合通信库。 |
| **NIM** | NVIDIA Inference Microservices.<br>NVIDIA 推理微服务。 |
| **NGC** | NVIDIA GPU Cloud (now NVIDIA's catalog of GPU-optimized software).<br>NVIDIA GPU Cloud（现为 NVIDIA 的 GPU 优化软件目录）。 |
| **DALI** | Data Loading Library.<br>数据加载库。 |
| **RAPIDS / cuDF / cuML** | GPU data science suite / GPU DataFrame / GPU machine learning library.<br>GPU 数据科学套件 / GPU DataFrame / GPU 机器学习库。 |
| **DOCA** | Data Center Infrastructure-on-a-Chip Architecture (the BlueField SDK).<br>数据中心片上基础设施架构（BlueField SDK）。 |
| **RDMA** | Remote Direct Memory Access.<br>远程直接内存访问。 |
| **RoCE** | RDMA over Converged Ethernet.<br>基于融合以太网的 RDMA。 |
| **IB / HCA** | InfiniBand / Host Channel Adapter (an IB NIC).<br>InfiniBand / 主机通道适配器（IB 网卡）。 |
| **SHARP** | Scalable Hierarchical Aggregation and Reduction Protocol.<br>可扩展分层聚合与归约协议。 |
| **UFM** | Unified Fabric Manager.<br>统一网络管理器。 |
| **SM (InfiniBand context)**<br>SM（InfiniBand 语境） | Subnet Manager — not to be confused with the GPU's Streaming Multiprocessor.<br>子网管理器（注意与 GPU 的流式多处理器区分）。 |
| **PFC / ECN** | Priority Flow Control / Explicit Congestion Notification.<br>基于优先级的流控 / 显式拥塞通知。 |
| **GDS** | GPUDirect Storage.<br>GPU 直连存储。 |
| **NVMe-oF** | NVMe over Fabrics.<br>基于网络的 NVMe。 |
| **PUE** | Power Usage Effectiveness.<br>电能使用效率。 |
| **CDU / RDHx** | Coolant Distribution Unit / Rear Door Heat Exchanger.<br>冷却液分配单元 / 后门热交换器。 |
| **UPS / PDU** | Uninterruptible Power Supply / Power Distribution Unit.<br>不间断电源 / 配电单元。 |
| **BMC / IPMI** | Baseboard Management Controller / Intelligent Platform Management Interface.<br>基板管理控制器 / 智能平台管理接口。 |
| **OOB** | Out-of-Band (management).<br>带外（管理）。 |
| **BCM** | Base Command Manager.<br>Base Command 集群管理器。 |
| **GFD / NFD** | GPU Feature Discovery / Node Feature Discovery.<br>GPU 特性发现 / 节点特性发现。 |
| **CRD** | Custom Resource Definition (Kubernetes).<br>自定义资源定义（K8s）。 |
| **GRES** | Generic RESources (Slurm).<br>通用资源（Slurm）。 |
| **XID** | Error number the NVIDIA driver reports for GPU errors.<br>NVIDIA 驱动报告的 GPU 错误编号。 |
| **ECC / SBE / DBE** | Error Correcting Code / Single-Bit Error / Double-Bit Error.<br>纠错码 / 单比特错误 / 双比特错误。 |
| **RMA** | Return Merchandise Authorization.<br>退货授权（退修）。 |
| **TTFT / TPOT / ITL** | Time To First Token / Time Per Output Token / Inter-Token Latency.<br>首 token 延迟 / 每输出 token 时间 / token 间延迟。 |
| **RAG** | Retrieval-Augmented Generation.<br>检索增强生成。 |
| **LoRA / PEFT** | Low-Rank Adaptation / Parameter-Efficient Fine-Tuning.<br>低秩适配 / 参数高效微调。 |
| **RLHF / SFT** | Reinforcement Learning from Human Feedback / Supervised Fine-Tuning.<br>基于人类反馈的强化学习 / 监督微调。 |
| **MoE** | Mixture of Experts.<br>混合专家。 |
| **AMP** | Automatic Mixed Precision.<br>自动混合精度。 |
| **TF32 / BF16** | TensorFloat-32 / Brain Floating Point 16.<br>TensorFloat-32 / Brain 浮点 16 位。 |
| **PTQ / QAT** | Post-Training Quantization / Quantization-Aware Training.<br>训练后量化 / 量化感知训练。 |
| **FSDP / ZeRO** | Fully Sharded Data Parallel / Zero Redundancy Optimizer.<br>全分片数据并行 / 零冗余优化器。 |
| **MFU** | Model FLOPs Utilization.<br>模型算力利用率。 |
| **TCO** | Total Cost of Ownership.<br>总拥有成本。 |
| **CapEx / OpEx** | Capital Expenditure / Operational Expenditure.<br>资本支出 / 运营支出。 |
| **SU** | Scalable Unit (DGX SuperPOD building block).<br>可扩展单元（DGX SuperPOD 构建块）。 |
| **IaC** | Infrastructure as Code.<br>基础设施即代码。 |
| **MTTR / MTBF** | Mean Time To Repair / Mean Time Between Failures.<br>平均修复时间 / 平均故障间隔时间。 |
