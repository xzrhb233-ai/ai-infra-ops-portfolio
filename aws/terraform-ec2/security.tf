# No ingress rules at all -- access is via SSM Session Manager, never SSH.
# This is the thing `terraform plan` gets checked against in Day 10's
# completion criteria ("plan 无意外公网端口").

resource "aws_security_group" "instance" {
  name_prefix = "${var.project_name}-no-ingress-"
  description = "No inbound rules; SSM Session Manager only. Outbound allowed for SSM/yum."
  vpc_id      = aws_vpc.main.id

  egress {
    description = "Allow all outbound (needed to reach SSM endpoints, package repos)."
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-no-ingress"
  }

  lifecycle {
    create_before_destroy = true
  }
}
