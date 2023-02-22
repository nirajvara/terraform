output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "mypublic_subnets" {
  value = module.vpc.public_subnets
}

output "rds_security_group_id" {
  value = aws_security_group.rds.id
}