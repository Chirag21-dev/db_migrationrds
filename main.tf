module "ec2" {
  source = "./Modules/Ec2"
}

module "secrets" {
  source   = "./Modules/secret"
  password = var.password
}

module "rds" {
  source            = "./Modules/rds"
  allocated_storage = 20
  db_name           = "mydatabase"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  username          = "admin"
  password          = module.secrets.db_password
  ec2_sg            = module.ec2.sg_id
}