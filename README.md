# terraform-aurora-db

Terraform module to deploy an Amazon Aurora PostgreSQL cluster using `t2.micro` instances.

## Usage

```hcl
  module "aurora_pg" {
  source             = "git::https://github.com/Shiva3650/terraform-aurora-db.git"
  cluster_identifier = "aurora-pg-cluster"
  master_username    = "admin"
  master_password    = "W1reless"
  database_name      = "myAuroradb"
  subnet_ids         = ["subnet-abc123", "subnet-def456"]
  security_group_ids = ["sg-12345678"]
  instance_count     = 1
}

