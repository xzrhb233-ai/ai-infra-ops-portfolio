# Linux / 网络排错速查表

**目标**：不看文档，10 分钟内回答四个问题——进程是否存活、端口是否监听、DNS 是否正常、磁盘/内存是否不足。

**采集环境**：WSL2 Ubuntu 24.04.1 LTS（与 [环境基线](../environment-baseline.md) 一致）。原始命令输出见 [证据](../evidence/linux-network-triage-commands.txt)。

## 1. 进程是否存活 / 系统是否健康

| 问题 | 命令 | 如何判断 | 本机实测 |
| --- | --- | --- | --- |
| systemd 整体状态是否正常 | `systemctl is-system-running` | `running` 正常；`degraded` 说明有单元失败 | `running` |
| 有没有失败的服务单元 | `systemctl --failed` | 列表非空即有服务崩溃，需逐个 `systemctl status <unit>` | 0 个失败单元 |
| 目标进程是否存活、吃了多少资源 | `ps aux --sort=-%mem`（按内存）/ `ps aux --sort=-%cpu`（按 CPU） | 找不到进程名 → 进程未启动或已崩溃；`STAT` 为 `D`/`Z` → 不可中断睡眠/僵尸进程，需关注 | 28 个进程，systemd 相关服务全部 `S`/`Ss`，无僵尸/异常状态 |
| 实时资源占用谁最高 | `top -bn1`（一次性快照，避免交互挂起脚本）/ `htop` | 看 `%CPU`/`%MEM` 排序前几名是否符合预期 | load average 0.22，CPU 100% idle，无异常占用 |
| 内核最近是否报错 | `journalctl -k -n 20` | 出现 `error`/`fail`/`oops` 等关键字需深入排查 | 仅 WSL 虚拟 GPU 设备查询噪音（`dxgk ioctl failed`）和 journal 文件被重建的提示，非真实故障 |

## 2. 磁盘 / 内存是否不足

| 问题 | 命令 | 如何判断 | 本机实测 |
| --- | --- | --- | --- |
| 内存/交换区是否吃紧 | `free -h` | `available` 远小于 `total`，或 `Swap used` 持续增长 → 内存压力 | 62Gi 总内存，用了 1.0Gi，61Gi 可用；Swap 完全未用 |
| 哪个挂载点空间告急 | `df -h` | 真实盘（非 `tmpfs`/`none`）`Use%` 超过 80-90% 需处理 | `/`（1007G，8% 已用）、`C:\`（1.9T，96% 已用 — 需关注但属 Windows 侧） |
| 是谁占用了空间 | `du -sh <目录>`，从大目录逐层下钻（如 `/var/log`、`/home`） | 定位到具体大文件/目录后再决定清理还是轮转 | `/var/log` 788M，未达到需要立即清理的量级 |

## 3. 端口是否监听 / 进程与端口的对应关系

| 问题 | 命令 | 如何判断 | 本机实测 |
| --- | --- | --- | --- |
| 端口有没有被监听 | `ss -lntp` | 目标端口不在列表里 → 服务没启动或监听了错误的地址/接口 | 仅 53/tcp（systemd-resolved 的 DNS stub）在监听，无其他服务端口 |
| 哪个进程占用了某个端口/连接 | `lsof -i -P -n` | 空输出 = 当前无进程持有网络套接字；否则按 PID 定位到 `ps` | 空输出，与当前无服务运行的状态一致 |
| 网卡和 IP 是否正常 | `ip addr` | 接口需为 `UP,LOWER_UP`；确认实际 IP 与预期网段一致 | `eth0` UP，`172.19.212.227/20` |
| 默认路由是否存在 | `ip route` | 缺少 `default via ...` → 出网会失败，即使 DNS/端口都正常 | 存在默认路由 `via 172.19.208.1` |

## 4. DNS 是否正常

| 问题 | 命令 | 如何判断 | 本机实测 |
| --- | --- | --- | --- |
| 域名能否解析 | `dig +short <domain>` 或 `nslookup <domain>` | 无输出/`NXDOMAIN`/超时 → DNS 故障；本机未安装这两个工具（`bind9-dnsutils` 缺失） | 命令不存在（`command not found`），已记录为已知缺口，非"DNS 失败" |
| 解析的替代验证方式（无 dig/nslookup 时） | `getent hosts <domain>` | 走 nsswitch 解析路径，返回 IP 即正常 | `google.com` → `2607:f8b0:4009:803::200e` 正常 |
| 使用的是哪个 DNS 服务器 | `cat /etc/resolv.conf`、`resolvectl status` | 确认 nameserver 不是失联的地址 | `nameserver 10.255.255.254`（WSL 自动生成的 stub resolver），`resolvectl` 确认同一地址在用 |
| 应用层连通性（DNS+TCP+TLS 一次性验证） | `curl -v <url>` | 关注 `resolved` → `Connected` → TLS handshake → HTTP 状态码，任一环节卡住即定位到对应层 | 成功解析、连接、TLS 握手并返回 `HTTP/2 200` |
| 基础网络可达性（先排除 DNS 干扰） | `ping -c 3 <IP>` | 直接 ping IP：通则说明网络层没问题，问题在 DNS；不通则更底层 | ping `8.8.8.8` 3/3 成功，RTT 35-65ms |
| 路径中哪一跳出问题 | `traceroute -m 6 <host>` | 本机未安装（`traceroute` 包缺失） | 命令不存在，已记录为已知缺口 |

## 五步诊断顺序（10 分钟目标）

1. **进程/系统**：`systemctl is-system-running` + `systemctl --failed` → 系统级问题一眼排除。
2. **资源**：`free -h` + `df -h` → 排除内存/磁盘耗尽导致的连锁故障。
3. **进程与端口**：`ps aux` 确认目标进程存活 → `ss -lntp` 确认端口监听 → `lsof -i` 找到占用者。
4. **网络层**：`ip addr` / `ip route` 确认接口和路由正常。
5. **DNS 与应用层**：`getent hosts` 或 `dig`（若已安装）→ `curl -v` 一次性验证 DNS+TCP+TLS+HTTP。

按此顺序排查，可以把"网络不通"这类模糊报告快速收敛到具体层次（系统/资源/进程/网络/DNS/应用），而不是逐条盲试命令。

## 已知缺口与预防

- 本机 WSL 镜像默认未安装 `bind9-dnsutils`（`dig`/`nslookup`）和 `traceroute`；已用 `getent hosts`/`resolvectl`/`curl -v` 作为替代验证手段。若需要完整工具链，运行 `sudo apt install -y bind9-dnsutils traceroute`。
- `ps aux --sort=-%mem` 在部分终端下会打印 "screen size is bogus" 警告（WSL 未设置 `TERM`/窗口尺寸导致），不影响命令结果，可忽略。
- 本机没有安装 SSH 服务（`systemctl status ssh` 报 "could not be found"），这是预期状态（开发工作站而非目标主机），不是故障。
