# terraform-aurora-db

Terraform module to deploy an Amazon Aurora PostgreSQL cluster using `t3.small` instance.

## Usage

```hcl
  module "aurora_pg" {
  source             = "git::https://github.com/Shiva3650/terraform-aurora-db.git"
  cluster_identifier = "aurora-pg-cluster"
  master_username    = "-"
  master_password    = "-"
  database_name      = "myAuroradb"
  subnet_ids         = ["subnet-tjp456", "subnet-ckf456"]
  security_group_ids = ["sg-356783"]
  instance_count     = 1
}

