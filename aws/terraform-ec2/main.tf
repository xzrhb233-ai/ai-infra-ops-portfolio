# One reusable single-instance template. Day 10 used the default (CPU,
# t3.micro, plain Amazon Linux 2023) to prove init/plan/apply/destroy is
# clean. Day 11 reuses the same VPC/security group/IAM role and just
# overrides two variables to get a GPU instance instead:
#   terraform apply -var="use_gpu_ami=true" -var="instance_type=g5.xlarge"
# Gated on the Day 9 quota increase (L-DB2E81BA) actually being approved --
# `describe-instance-type-offerings` succeeding is not the same as the
# vCPU quota allowing the instance to actually launch.

data "aws_ssm_parameter" "al2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

# AWS Deep Learning Base OSS Nvidia Driver AMI (Amazon Linux 2023, x86_64):
# ships with the NVIDIA driver, Docker, and NVIDIA Container Toolkit already
# installed, so Day 11 validates "does the driver work on this instance",
# not "can I re-run Day 3's install script on a cloud box" -- that install
# path is already proven locally.
data "aws_ssm_parameter" "gpu_ami" {
  name = "/aws/service/deeplearning/ami/x86_64/base-oss-nvidia-driver-gpu-amazon-linux-2023/latest/ami-id"
}

locals {
  ami_id = var.use_gpu_ami ? data.aws_ssm_parameter.gpu_ami.value : data.aws_ssm_parameter.al2023_ami.value
  name   = var.use_gpu_ami ? "${var.project_name}-gpu-baseline" : "${var.project_name}-cpu-smoke-test"
}

resource "aws_instance" "this" {
  ami                    = local.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.instance.id]
  iam_instance_profile   = aws_iam_instance_profile.ssm_instance.name

  # The GPU AMI's root volume default is small; give it room for the driver
  # image + a CUDA container pull without babysitting disk space mid-test.
  root_block_device {
    volume_size = var.use_gpu_ami ? 100 : 8
    volume_type = "gp3"
  }

  metadata_options {
    http_tokens = "required" # IMDSv2 only
  }

  tags = {
    Name = local.name
  }
}
