resource "aws_db_instance" "rds" {

  identifier        = "demodb"
  engine            = "postgres"
  engine_version    = "10.17"
  instance_class    = "db.t3.micro"
  allocated_storage = 5

  db_name  = "demodb"
  username = "myadmin"
  password = "mavenmaven"
  port     = "5432"

  db_subnet_group_name = aws_db_subnet_group.default.id 
  vpc_security_group_ids = ["${aws_security_group.rds.id}"]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # tags = {
  #   Owner       = "myadmin"
  #   Environment = "dev"
  # }

  # DB subnet group
  #subnet = ["$module.vpc.private_subnets.id"]
  ##subnet = ["$(module.vpc.private_subnets[0])", "$(module.vpc.private_subnets[1])"]
  #  # DB parameter group
  #  family = "postgres10"
}

#data "aws_subnet" "all" {
#  vpc_id = "${module.vpc.vpc_id}"
#}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = ["${module.vpc.private_subnets[0]}", "${module.vpc.private_subnets[1]}"]
  tags = {
    Name = "My DB subnet group"
  }
}
