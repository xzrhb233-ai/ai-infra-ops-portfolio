# Cheapest possible smoke test: is init/plan/apply/destroy clean, and can we
# reach an instance with zero open ports via SSM? No GPU here -- that's Day 11,
# gated on the quota request from Day 9.

data "aws_ssm_parameter" "al2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_instance" "cpu_smoke_test" {
  ami                    = data.aws_ssm_parameter.al2023_ami.value
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.instance.id]
  iam_instance_profile   = aws_iam_instance_profile.ssm_instance.name

  metadata_options {
    http_tokens = "required" # IMDSv2 only
  }

  tags = {
    Name = "${var.project_name}-cpu-smoke-test"
  }
}
