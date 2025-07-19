output "ec2_instance_id" {
  value = aws_instance.app_server.id
  description = "ID of the EC2 instance."
}

output "rds_endpoint" {
  value = aws_db_instance.mydb.endpoint
  description = "RDS Postgres endpoint."
}

output "ec2_security_group_id" {
  value = aws_security_group.ec21_sg.id
  description = "Security group ID for EC2."
}

output "rds_security_group_id" {
  value = aws_security_group.rds1_sg.id
  description = "Security group ID for RDS."
}
