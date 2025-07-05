variable "cluster_identifier" {
  type        = string
  description = "Unique identifier for the Aurora cluster"
}

variable "master_username" {
  type        = string
  description = "Master DB username"
}

variable "master_password" {
  type        = string
  description = "Master DB password"
  sensitive   = true
}

variable "database_name" {
  type        = string
  description = "Initial database name"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the DB subnet group"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to associate"
}

variable "instance_count" {
  type        = number
  default     = 2
  description = "Number of Aurora instances to create"
}

