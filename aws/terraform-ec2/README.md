# Terraform: minimal EC2 smoke test (W2 D10)

**目的**：验证 `init/plan/apply/destroy` 全流程干净可复现，并验证"用 SSM 而不是开放 SSH"这条访问方式，
不是为了长期跑着这台实例。跑完当天必须 `terraform destroy`，不留常驻资源。

## 这套配置做了什么

- 一个隔离的 `/24` VPC + 一个公有子网（`map_public_ip_on_launch = true`，实例能出网走 SSM 端点）。
- 安全组**没有任何入站规则**——不开 22 端口，不开任何端口，出站放通。
- IAM 角色只挂 `AmazonSSMManagedInstanceCore`，除了 SSM 连接什么权限都没有。
- 一台 `t3.micro`（免费层，默认可改），走 IMDSv2（`http_tokens = "required"`）。
- 没有 GPU——Day 9 提交的配额请求批下来之前，Day 11 才会换成 G5/G6 实例。

## 用法

```bash
cd aws/terraform-ec2
terraform fmt -check          # 格式检查
terraform init
terraform validate
terraform plan -out=tfplan    # 跑完人工确认没有意外开放的公网端口
terraform apply tfplan

# 验证：无需开任何端口，直接会话进去
aws ssm start-session --target <instance_id> --profile personal-admin --region us-east-2

# 验证完立刻销毁，不过夜
terraform destroy
```

## 状态与变量

- `terraform.tfstate*`、`.terraform/`、`*.tfvars`（`*.tfvars.example` 除外）都在仓库根 `.gitignore` 里排除，
  不会被提交。
- 所有变量都有默认值（见 [variables.tf](variables.tf)），本地跑不需要额外传参；要改 region/机型直接
  `terraform plan -var="instance_type=t3.small"` 或建一份 `terraform.tfvars`（不会被提交）。
