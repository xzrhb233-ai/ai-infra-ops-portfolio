# GPU 指标支持矩阵（W1 D5）

**结论先行**：DCGM Exporter 在本机（RTX 4070 + WSL2）**跑起来了但采不到任何指标**（`/metrics` 返回
`HTTP 200` + 空 body），原因记录在下面；因此采用 **`nvidia-smi --query-gpu` 定时采样** 作为本阶段
实际可用的连续采集方式。这不是"随便凑合"——下面逐字段验证过哪些是真实读数、哪些是驱动/硬件层面
就不支持，不支持的字段一律标注为 `N/A`/"不支持"，不写成 `0`。

## 1. DCGM Exporter 尝试结果

用 Day 3 装好的 Docker + NVIDIA Container Toolkit 跑：

```bash
docker run -d --rm --gpus all -p 9400:9400 --name dcgm-exporter \
  nvcr.io/nvidia/k8s/dcgm-exporter:3.3.5-3.4.1-ubuntu22.04
```

结果：容器正常启动，日志显示 `DCGM successfully initialized!`，但紧接着
`Not collecting DCP metrics: This request is serviced by a module of DCGM that is not currently loaded`，
之后不管加不加 `--cap-add SYS_ADMIN`，`curl http://localhost:9400/metrics` 都是 `HTTP 200` +
`Content-Length: 0`（完全没有指标行，不是"部分指标缺失"）。完整日志和排查过程见
[evidence/dcgm-exporter-attempt.log](../evidence/dcgm-exporter-attempt.log)。

**判断**：这是 DCGM 在消费级 GPU + WSL2 虚拟化直通场景下的已知限制类别，不是本机配置错误——DCGM
的字段采集（DCP 模块）设计目标是数据中心 GPU 和裸机 Linux 驱动，WSL2 的 GPU 直通链路没有暴露它需要
的驱动接口。测试完已清理容器（`docker rm -f dcgm-exporter`），未留下常驻资源。

## 2. `nvidia-smi --query-gpu` 逐字段验证

用同一条命令在**空闲**和**持续负载**（后台循环跑 `sgemm 2048`）两种状态下各采样验证，原始数据：
[metrics/results/gpu-metrics-idle-sample.csv](metrics/results/gpu-metrics-idle-sample.csv)（15s，空闲）、
[metrics/results/gpu-metrics-load-sample.csv](metrics/results/gpu-metrics-load-sample.csv)（15s，持续负载）。

| 字段 | 空闲值（典型） | 负载值（典型） | 判定 | 依据 |
| --- | --- | --- | --- | --- |
| `utilization.gpu` | 2-9% | 2-14%（毛刺） | **支持** | 数值随负载变化，但见下方"已知局限" |
| `utilization.memory` | 17-38%（毛刺） | 1%（稳定低） | **支持** | 负载下反而变低且稳定，符合"SGEMM 是计算密集不是显存带宽密集"的预期 |
| `memory.total` | 12282 MiB | 12282 MiB | **支持** | 常量，和硬件规格一致 |
| `memory.used` | ~9315 MiB | ~9200-9430 MiB（波动） | **支持** | 和 Day 3/4 记录的宿主机基线占用一致 |
| `temperature.gpu` | 39°C | 39→42°C（持续爬升） | **支持** | 负载下温度单调上升，是真实传感器读数 |
| `power.draw` | ~14.3 W | ~37-38 W | **支持** | 空闲/负载差 2.6 倍，符合 P8→P0 功耗差 |
| `power.limit` | 200 W | 200 W | **支持** | 常量，和 [environment-baseline.md](../environment-baseline.md) 记录的整卡上限一致 |
| `clocks.sm` | 210 MHz | 2505 MHz | **支持** | 空闲/负载差 12 倍，是最清晰的负载信号 |
| `clocks.mem` | 405 MHz | 10251-10501 MHz | **支持** | 同上 |
| `pstate` | P8 | P0/P2（跳动） | **支持** | 电源状态随负载切换，和 clocks/power 互相印证 |
| `fan.speed` | 0% | **仍然 0%**（温度已从 39°C 升到 42°C） | **不支持/不可信**，不是"风扇真的没转" | 空闲和持续负载 15 秒后数值完全相同，`nvidia-smi -q` 里也是明写 `0 %` 而非 `N/A`，但既然温度实测在升高、风扇却读数纹丝不动，说明这个字段在本机链路上没有真实回传信号，把它当"风扇转速=0"会产生误导性告警（例如"风扇故障"），因此判定为不可用而非真实值 |
| `temperature.memory` | `N/A` | `N/A` | **不支持** | `nvidia-smi -q` 明确输出 `N/A`，消费卡通常没有独立显存温度传感器暴露给驱动 |
| `ecc.errors.corrected.volatile.total` | `[N/A]` | 未测 | **不支持** | GeForce 消费卡默认不开 ECC，字段本身不适用 |
| Module/GPU 显存的独立功耗读数（`GPU Memory Power Readings`、`Module Power Readings`） | `N/A` | 未测 | **不支持** | `nvidia-smi -q` 明确输出 `N/A`，属于数据中心卡（如 H100）才有的分域功耗遥测 |
| `encoder.stats.sessionCount` | 0 | 未测 | **未验证**（不等于不支持） | 只在没有任何视频编码任务时采样，读数为 0 是"当前没有编码会话"，不是字段本身不可用；需要在有编码负载时复测才能下结论，暂标"未验证" |
| `pcie.link.gen.current` / `pcie.link.width.current` | Gen4 / x16 | 未变化 | **支持** | 常量读数，和硬件规格吻合 |

## 3. 连续采集方式

[metrics/sample-gpu-metrics.sh](metrics/sample-gpu-metrics.sh)：按固定间隔调用 `nvidia-smi
--query-gpu=...` 并追加写入 CSV，用法：

```bash
./sample-gpu-metrics.sh <采样间隔秒> <总时长秒> <输出CSV路径>
# 例：./sample-gpu-metrics.sh 1 60 results/gpu-metrics-run1.csv
```

这就是本阶段"至少一种方式可连续采集"的落地方式——不依赖 DCGM，任何装了驱动的机器都能跑。Day 6
会用同一个脚本做 5 分钟空闲 + 10 分钟负载的完整时间序列。

## 4. 已知局限（不要在后续报告里当成精确值使用）

- `utilization.gpu` 在两组采样里都有明显毛刺（负载下 2-14% 跳动，而不是稳定的高数字）。原因大概率是
  `nvidia-smi` 采样点和 1024×1024/2048×2048 规模的单次 SGEMM kernel（[Day 4 结果](benchmark.md)显示
  单次在 0.1-2.2 毫秒量级）之间的时间错位——采样间隔是 1 秒，kernel 本身跑完的时间比这短两到三个
  数量级，采样大概率落在"kernel 之间的间隙"或"进程重新拉起的开销"里，不是 GPU 真的只用了 2-14%。
  这个问题在 [benchmark.md](benchmark.md) 的"GPU 利用率与显存"一节已经指出过一次，这里是同一个局限
  在不同工具上的再次验证：**短于采样间隔的负载，靠外部轮询是测不准利用率的**，需要 Nsight 一类和
  kernel 生命周期对齐的工具，或者构造持续时间远大于采样间隔的负载。
- `fan.speed` 恒为 0% 且不随温度变化，已在上表标注为不可信；后续如果要做告警规则，不能拿这个字段
  做"风扇故障检测"。
