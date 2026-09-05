# 本地 CUDA 基准（W1 D4）

**硬件/环境**：RTX 4070（12282 MiB），驱动 610.47，WSL2 Ubuntu 24.04.1，编译器
`/usr/local/cuda-13.3/bin/nvcc` release 13.3.73（见 [environment-baseline.md](../environment-baseline.md) 更新说明）。

**方法**：三个自包含的 CUDA C 程序（不依赖 PyTorch/torch extension，纯 `nvcc` 编译，任何人 clone 仓库后
`make && ./run_all.sh` 即可复现），每个程序内部先跑一次不计时的 warmup，再跑 3 次计时的正式测量，
用 `cudaEvent` 只计时 kernel 本身（不含 host↔device 拷贝）。跑的同时用
`nvidia-smi --query-gpu=... -lms 200` 后台采样 GPU 利用率/显存/温度。源码、Makefile、编排脚本见
[benchmarks/](benchmarks/)，原始输出见 [benchmarks/results/](benchmarks/results/)。

| 程序 | 参数 | 正确性 |
| --- | --- | --- |
| `vector_add` | N=16,777,216（float） | PASS，0 处不一致 |
| `block_reduce_sum` | N=16,777,216（float，全 1 求和） | PASS，结果=16777216.0 与期望完全一致 |
| `sgemm`（naive tiled，32×32 tile） | M=N=K=1024（float） | PASS，`C[0]=0.2048` 与理论值一致（误差<1%阈值） |
| `sgemm`（cuBLAS 参考） | 同上，作为上限对比 | 未做独立正确性检查，仅作为吞吐参考 |

原始正确性检查输出：[benchmarks/results/correctness-checks-20260905T020327.txt](benchmarks/results/correctness-checks-20260905T020327.txt)。

## 三次重复结果

原始 CSV：[vector_add](benchmarks/results/vector_add-20260905T020327.csv) ·
[block_reduce_sum](benchmarks/results/block_reduce_sum-20260905T020327.csv) ·
[sgemm](benchmarks/results/sgemm-20260905T020327.csv)

| 程序 | run1 | run2 | run3 | 均值 | 相对分散度 |
| --- | --- | --- | --- | --- | --- |
| vector_add（ms） | 0.4342 | 0.4362 | 0.4372 | 0.4359 | ±0.4%（466→460 GB/s，理论峰值约 504 GB/s 的 ~91%） |
| block_reduce_sum（ms） | 0.1587 | 0.1587 | 0.1587 | 0.1587 | 0%（三次完全一致，422.8 GB/s） |
| sgemm_naive_tiled（ms） | 1.5408 | 2.1996 | 2.2067 | 1.9824 | run1 比 run2/3 快 ~30%（1394→973 GFLOPS） |
| sgemm_cublas（ms） | 0.1516 | 0.1340 | 0.1338 | 0.1398 | run1 比 run2/3 慢 ~13%（14170→16055 GFLOPS） |

## 波动解释

- **vector_add / block_reduce_sum**：这两个是纯内存带宽受限的小 kernel，三次几乎无波动
  （`block_reduce_sum` 三次数字完全相同，已经低于 `cudaEvent` 计时器的有效分辨力）。带宽换算出的
  460+ GB/s 已经接近 RTX 4070 理论显存带宽的九成，说明 kernel 本身没有明显的调度/访存低效问题。
- **sgemm_naive_tiled 和 sgemm_cublas 波动方向相反**（naive 是"先快后慢"，cuBLAS 是"先慢后快"），
  且波动幅度（13-30%）明显大于前两个 kernel，无法用单一原因确定归因，记录两个可能因素而不下定论：
  1. **GPU 并非空跑**：Day 3/4 采集时 `nvidia-smi` 显示宿主机已有 9.7-9.9 GiB 显存被其他进程占用
     （见 [Day 3 证据](../evidence/docker-gpu-success.txt) 里 9091 MiB 的基线，本次采样在
     [benchmarks/results/*-nvidia-smi-*.csv](benchmarks/results/) 里进一步显示为 9755-10107 MiB 且
     利用率在 13-40% 间跳动）——说明测试期间 GPU 上还有其他工作负载在跑，会和本次基准抢 SM/带宽资源，
     每次抢占的时间点不同，就会产生和"kernel 本身效率"无关的运行时间波动。
  2. **GPU 时钟状态切换**：这几个 kernel 单次执行都在毫秒或亚毫秒级，如果 GPU 在两次测量之间回落到
     低功耗状态（idle 时是 P8，15W），下一次 launch 需要重新爬升到高性能状态（P0），爬升所需的时间
     可能占单次 kernel 耗时的相当比例，方向（先快后慢 or 先慢后快）会受当时具体时钟状态影响，难以在
     不能锁定时钟频率（`nvidia-smi -lgc` 需要管理员权限，WSL 直通环境下未验证是否可用）的前提下彻底
     排除这个因素。
  - 这两条都不是"确定的根因"，而是记录下一步如果要做更严谨的基准，应该做的事：关闭其他会用 GPU
    的后台程序、把重复次数从 3 次提到 20-50 次以上取中位数、并尝试锁定时钟频率。当前 3 次重复的目的
    是验证"流程可复现、结果方向合理"，不是给出可用于容量规划的严格性能数字。

## GPU 利用率与显存（nvidia-smi 200ms 采样）

采样文件：[vector_add](benchmarks/results/vector_add-nvidia-smi-20260905T020327.csv) ·
[block_reduce_sum](benchmarks/results/block_reduce_sum-nvidia-smi-20260905T020327.csv) ·
[sgemm](benchmarks/results/sgemm-nvidia-smi-20260905T020327.csv)

- 显存稳定在 9755-10107 MiB / 12282 MiB，和 Day 3 记录的宿主机基线占用一致，本次基准新增的
  几十 MB 缓冲区分配相对基线可忽略。
- 利用率采样值在 13-40% 之间波动，**但这不能代表 kernel 真实利用率**——三个程序的单次 kernel
  执行时间都在 0.13-2.2 毫秒量级，远小于 200ms 的采样间隔，`nvidia-smi` 采到的是"采样瞬间"的活动
  状态（很可能主要反映的是宿主机上其他并发进程的负载，而不是本次 benchmark 的 kernel），不是本次
  kernel 执行期间的平均利用率。要拿到真实的 per-kernel 利用率，需要用 Nsight Systems/Compute 或
  更高频率、和 kernel 生命周期对齐的采样方式，这一点留给 Day 5（GPU 指标支持矩阵）继续处理，不在这里
  把粗粒度采样值误报成精确利用率。

## 结论

三个 kernel 的正确性检查全部通过；`vector_add`/`block_reduce_sum` 达到了接近理论带宽上限的吞吐，
证明本地 GPU 计算链路（驱动→CUDA 13.3 toolkit→kernel 执行→结果回传）完全打通、可复现；`sgemm` 的
naive tiled 实现吞吐（~1000-1400 GFLOPS）明显低于 cuBLAS（~14000-16000 GFLOPS，约 10-16 倍差距），
符合预期——cuBLAS 用了 warp 级 MMA/寄存器分块等 naive tiled 版本没有实现的优化，这个差距本身就是
"手写 kernel vs. 厂商库"的典型基线参考，不代表本机硬件有问题。
