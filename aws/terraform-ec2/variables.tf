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
  description = "EC2 instance type for the CPU smoke test (free-tier eligible)."
  type        = string
  default     = "t3.micro"
}
