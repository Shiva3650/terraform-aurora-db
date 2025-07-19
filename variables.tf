variable "aws_region" {
  description = "AWS region to deploy resources in"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
}

variable "instance_type" {
  description = "EC2 instance type"
}

variable "vpc_id" {
  description = "VPC ID for resources"
}

variable "my_ip" {
  description = "Your IP for SSH access (e.g., 1.2.3.4/32)"
}

variable "environment" {
  description = "Environment tag (e.g., dev, prod)"
}

variable "project" {
  description = "Project tag"
}

variable "db_identifier" {
  description = "RDS DB identifier"
}

variable "db_username" {
  description = "Database username"
}

variable "db_password" {
  description = "Database password"
  sensitive   = true
}

variable "db_instance_class" {
  description = "RDS instance class"
}

variable "db_allocated_storage" {
  description = "RDS allocated storage (in GB)"
}

variable "db_engine_version" {
  description = "Postgres engine minor version"
}

variable "db_subnet_group_name" {
  description = "Subnet group for RDS instance"
}

variable "db_subnet_ids" {
  description = "List of subnet IDs for the RDS subnet group"
  type        = list(string)
}

variable "key_name" {
  description = "The name of the key pair to use for EC2 SSH access"
  type        = string
}

