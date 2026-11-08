# 考前速记表（一页）

## 数字

| 项目 | 数值 |
| --- | --- |
| 考试 | 50 题 / 60 分钟 / 平均 72 秒每题 / 英文 / 在线监考 |
| 领域权重 | AI 基础 38% · 基础设施 40% · 运维 22%（后两项为第三方整理，报名前核对官网） |
| NVLink 每 GPU 带宽 | A100 600 GB/s · H100 900 GB/s · B200 1.8 TB/s |
| NVLink-C2C | 900 GB/s（Grace↔Hopper） |
| PCIe Gen5 x16 | ~64 GB/s 单向 / ~128 GB/s 双向 |
| InfiniBand | EDR 100 · HDR 200 · NDR 400 · XDR 800 Gb/s |
| DGX H100 | 8× H100 SXM，640 GB HBM3，4 NVSwitch，8× 400 Gb/s ConnectX-7，最大 ~10.2 kW |
| DGX A100 | 8× A100，6 NVSwitch，~6.5 kW |
| GB200 NVL72 | 72 Blackwell GPU + 36 Grace CPU，单 NVLink 域，液冷 |
| SuperPOD SU（DGX H100） | 32 台 DGX = 256 GPU |
| MIG | 最多 7 实例；A100 40GB 最小 `1g.5gb`，80GB 卡最小 `1g.10gb` |
| L4 | 72 W 低功耗推理/视频 |
| PUE | 总功耗 ÷ IT 功耗，1.0 最理想 |
| 70B 模型 FP16 权重 | ≈ 140 GB |

## "第一次出现"对照

| 特性 | 架构 |
| --- | --- |
| NVLink | Pascal |
| Tensor Core | Volta |
| RT Core | Turing |
| MIG、TF32、2:4 稀疏 | Ampere |
| Transformer Engine（FP8） | Hopper |
| FP4、NVLink 5 | Blackwell |

## 一词一义（最容易混）

| 这个 | 是 | 不是 |
| --- | --- | --- |
| TensorRT | 推理**优化**器/运行时 | 推理服务 |
| Triton | 推理**服务**（动态批处理、多模型） | 编译器 |
| NIM | 预打包推理微服务（标准 API） | 训练框架 |
| NeMo | 生成式 AI 构建/定制框架 | 网络管理器 |
| NCCL | 集合通信库 | 调度器 |
| RAPIDS | GPU 数据科学（cuDF/cuML） | 深度学习训练框架 |
| DALI | GPU 数据加载与增强 | 存储系统 |
| DCGM | GPU 健康/诊断/遥测 | 驱动 |
| UFM | InfiniBand 网络管理 | GPU 监控 |
| DOCA | BlueField DPU 的 SDK | GPU 编程 |
| BCM | 集群部署与管理 | 作业框架 |
| GPU Operator | K8s 里自动装驱动/toolkit/插件/监控 | 调度器本身 |
| Device Plugin | 暴露 `nvidia.com/gpu` 资源 | 装驱动 |
| GFD | 给节点打 GPU 标签 | 监控 |
| MIG | 硬件隔离切分 | 时间片 |
| vGPU | 多 VM 共享，需授权 | 容器共享 |
| SHARP | IB 交换机内做归约 | 存储协议 |
| GPUDirect RDMA | 网卡 ↔ GPU 显存 | 存储 ↔ GPU（那是 GDS） |

## 命令

```
nvidia-smi topo -m           拓扑（NV# 最快，SYS 最慢）
nvidia-smi -q -d PERFORMANCE 降频原因
nvidia-smi -pm 1             持久模式
nvidia-smi -i 0 -mig 1       开 MIG（需重置 GPU）
nvidia-smi mig -lgip         列 MIG 规格
dcgmi diag -r 1|2|3          快速 | 中等 | 长诊断
sbatch / srun / squeue / sinfo / scancel / sacct
srun --container-image=nvcr.io#nvidia/pytorch:24.05-py3   (Pyxis)
docker run --rm --gpus all nvidia/cuda:12.4.1-base-ubuntu22.04 nvidia-smi
NCCL_DEBUG=INFO              看 NCCL 走 IB 还是 Socket
```

## 做题技巧

1. 题干里的关键词定答案：**"lossless"→ PFC/ECN 或 InfiniBand**；**"hardware isolation"→ MIG**；**"multiple VMs"→ vGPU**；
   **"without retraining / frequently changing data"→ RAG**；**"lowest latency inference optimization"→ TensorRT**；
   **"serve multiple frameworks / dynamic batching"→ Triton**；**"bypass CPU"→ GPUDirect**；**"offload infrastructure"→ DPU**。
2. 排除明显无关的：RT Core、NVENC、GeForce、Omniverse 常是干扰项。
3. "Choose two" 题两个都要对才得分，先找最确定的一个。
4. 不会的先标记跳过，最后回头；不留空题（选择题一般不倒扣分，以官方考试说明为准）。
