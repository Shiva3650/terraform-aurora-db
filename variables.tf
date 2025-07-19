variable "aws_region" {
  default = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
}

variable "instance_type" {
  default = "t2.micro"
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
  default = "my-db-instance"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  description = "Database password"
  sensitive   = true
}

variable "db_instance_class" {
  default = "db.t3.micro"
}

variable "db_allocated_storage" {
  default = 20
}

variable "db_engine_version" {
  description = "Postgres engine minor version"
  default     = "15.4"
}

variable "db_subnet_group_name" {
  description = "Subnet group for RDS instance"
}

variable "db_subnet_ids" {
  description = "List of subnet IDs for the RDS subnet group"
  type        = list(string)
}
