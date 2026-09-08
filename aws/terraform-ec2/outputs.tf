output "instance_id" {
  description = "EC2 instance ID -- use this with the SSM connect command below."
  value       = aws_instance.cpu_smoke_test.id
}

output "ssm_connect_command" {
  description = "How to reach the instance -- no SSH, no open ports."
  value       = "aws ssm start-session --target ${aws_instance.cpu_smoke_test.id} --profile <profile> --region ${var.aws_region}"
}

output "security_group_id" {
  value = aws_security_group.instance.id
}
