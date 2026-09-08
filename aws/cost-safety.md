# AWS 账户安全与成本护栏（W2 D8）

**原则**：本文档记录"做了什么、怎么验证的"，不记录账户 ID、ARN、访问密钥等敏感值——仓库是公开的，
这些信息一律脱敏或只保留在本地 `~/.aws/`（已在 `.gitignore` 里排除）。

## 身份与访问

| 项目 | 状态 | 验证方式 |
| --- | --- | --- |
| 根账户 MFA | 已启用 | `aws iam get-account-summary --query SummaryMap.AccountMFAEnabled` 返回 `1` |
| 日常 IAM 用户 | 已创建，权限 `AdministratorAccess` | 见下方"踩坑"——第一次附加权限没生效，靠 CLI 报错发现的 |
| Root 账户日常使用 | 不使用，只用于 MFA/账单类操作 | 后续所有实验都用 IAM 用户 profile 操作 |
| AWS CLI profile | 已配置本地 profile（密钥仅存于 `~/.aws/credentials`，未提交） | `aws sts get-caller-identity --profile <profile>` 返回正确的 `UserId`/`Account`/`Arn`（本文档不记录具体值） |

## 踩坑记录：IAM 用户建好后权限没生效

创建 IAM 用户、附加 `AdministratorAccess` 之后，第一次用这个用户的密钥跑
`aws iam get-account-summary` 和 `aws ec2 describe-regions` 都返回 `AccessDenied`/`UnauthorizedOperation`，
连最基础的只读操作都不行。回控制台检查发现用户的"权限"标签页是空的——创建用户那一步选权限策略时
没有真正保存上。重新走一遍"添加权限 → 直接附加策略 → AdministratorAccess"之后，同样的 CLI 命令立刻
就通了。

**教训**：`aws sts get-caller-identity` 能成功只证明密钥本身有效，**不代表这个身份有任何实际权限**——
必须再用一个真实的业务 API（哪怕是最基础的只读操作）测一遍,才能确认权限策略真的生效了。

## 预算护栏

- 月度预算硬上限：**US$150**（COST 类型预算，`MONTHLY` 周期）。
- 告警阈值：**25% / 50% / 80% / 100%**，四条 `ACTUAL` 类型通知全部创建并验证为 `NotificationState: OK`。
- 通知方式：邮件订阅（AWS Budgets 的 `EMAIL` 订阅类型不需要像原生 SNS 那样点确认链接，创建后即生效）。
- 当前实际花费：`ActualSpend: $0.00`（本项目到目前为止全部在本地 WSL2 上进行，未创建任何计费的云资源）。

验证命令（不含敏感值，可以直接执行核对）：
```bash
aws budgets describe-budgets --profile <profile> --account-id <account-id>
aws budgets describe-notifications-for-budget --profile <profile> --account-id <account-id> \
  --budget-name ai-infra-portfolio-monthly
```

## 待补充证据

- [ ] AWS 控制台 Budgets 页面截图（存到 `evidence/aws-budget-screenshot.png`，截图前确认画面里不包含账户 ID/账单明细以外的敏感信息）。
- [ ] 收到任意一次告警邮件后（哪怕是测试性质），记录一次"从触发到收到通知"的验证。

## 与 SCOPE-AND-COST.md 的关系

本项目的成本红线（US$150 硬上限、25/50/80/100% 告警计划）在 [SCOPE-AND-COST.md](../SCOPE-AND-COST.md)
里作为"计划中的约束"写过；本文档是它的**落地状态**——即从"计划要做"变成"账户里已经真实配置并验证通过"。
