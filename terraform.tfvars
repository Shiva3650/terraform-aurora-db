ami_id              = "ami-0f5ee92e2d63afc18"   # Example: Amazon Linux 2023 AMI in ap-south-1
vpc_id              = "vpc-0e5a816b52b1c0db4"
my_ip               = "0.0.0.0/0"
environment         = "dev"
project             = "myproject"
db_identifier       = "my-db-instance"
db_username         = "adminmaster"
db_password         = "ChangeThisPassword!2024"    # Use a strong password and do not commit to VCS
db_instance_class   = "db.t4g.micro"
db_allocated_storage = 20
# Use the latest minor version available in your region if different
db_engine_version   = "15.10"
db_subnet_group_name = "my-db-subnet-group"
# List at least two subnet IDs in your default VPC, each in a different AZ
db_subnet_ids        = ["subnet-01573362d037ae6b8", "subnet-03d2804a7fae28391"]
 