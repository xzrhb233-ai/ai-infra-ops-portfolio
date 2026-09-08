variable "aws_region" {
  description = "Target AWS region (see ../instance-selection.md for why this one)."
  type        = string
  default     = "us-east-2"
}

variable "aws_profile" {
  description = "Local AWS CLI profile name (never hardcode credentials here)."
  type        = string
  default     = "personal-admin"
}

variable "project_name" {
  description = "Short name used to tag and identify every resource this stack creates."
  type        = string
  default     = "ai-infra-portfolio"
}

variable "instance_type" {
  description = "EC2 instance type. Default is the free-tier CPU smoke test; override to a G5/G6/G6e size (see ../instance-selection.md) once use_gpu_ami=true and the Day 9 quota is approved."
  type        = string
  default     = "t3.micro"
}

variable "use_gpu_ami" {
  description = "false = plain Amazon Linux 2023 (Day 10 CPU smoke test). true = AWS Deep Learning Base OSS Nvidia Driver AMI (Day 11 GPU baseline) -- must be paired with a g5/g6/g6e instance_type."
  type        = bool
  default     = false
}
