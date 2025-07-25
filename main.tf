provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "ec21_sg" {
  name        = "ec21_sg"
  description = "Allow SSH and HTTP access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "EC2SecurityGroup"
    Environment = var.environment
    Project     = var.project
  }
}

resource "aws_security_group" "rds1_sg" {
  name        = "rds1_sg"
  description = "Allow Postgres access from EC2"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [aws_security_group.ec21_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "RDSSecurityGroup"
    Environment = var.environment
    Project     = var.project
  }
}

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.ec21_sg.id]

  tags = {
    Name        = "MyAppServer"
    Environment = var.environment
    Project     = var.project
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = var.db_subnet_group_name
  description = "RDS subnet group for Postgres"
  subnet_ids = var.db_subnet_ids

  tags = {
    Name        = var.db_subnet_group_name
    Environment = var.environment
    Project     = var.project
  }
}

resource "aws_db_instance" "mydb" {
  allocated_storage    = var.db_allocated_storage
  engine               = "postgres"
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  identifier           = var.db_identifier
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = false
  publicly_accessible  = false
  vpc_security_group_ids = [aws_security_group.rds1_sg.id]
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name

  tags = {
    Name        = "MyAppDatabase"
    Environment = var.environment
    Project     = var.project
  }
}
