resource "aws_db_subnet_group" "aurora_subnet_group" {
  name       = "${var.cluster_identifier}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "Aurora PostgreSQL Subnet Group"
  }
}

resource "aws_rds_cluster" "aurora" {
  cluster_identifier      = var.cluster_identifier
  engine                  = "aurora-postgresql"
  engine_version          = "13.6"
  master_username         = var.master_username
  master_password         = var.master_password
  database_name           = var.database_name
  db_subnet_group_name    = aws_db_subnet_group.aurora_subnet_group.name
  vpc_security_group_ids  = var.security_group_ids
  skip_final_snapshot     = true
  backup_retention_period = 5
  storage_encrypted       = true
}

resource "aws_rds_cluster_instance" "aurora_instances" {
  count              = var.instance_count
  identifier         = "${var.cluster_identifier}-${count.index}"
  cluster_identifier = aws_rds_cluster.aurora.id
  instance_class     = "db.t3.small"
  engine             = aws_rds_cluster.aurora.engine
  engine_version     = aws_rds_cluster.aurora.engine_version
  publicly_accessible = false
}

