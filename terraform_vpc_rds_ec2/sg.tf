resource "aws_security_group" "rds" {
  name = "rds-sg"

  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = "5432"
    to_port     = "5432"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}