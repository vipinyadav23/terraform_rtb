resource "aws_security_group" "rds_sg" {
  vpc_id = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "mysql" {
  security_group_id = aws_security_group.rds_sg.id

  cidr_ipv4   = "10.0.0.0/16"
  from_port   = 3306
  to_port     = 3306
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "out" {
  security_group_id = aws_security_group.rds_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_db_subnet_group" "main" {
  subnet_ids = var.private_subnet_ids
}

resource "aws_db_instance" "rds" {
  allocated_storage      = 10
  engine                 = "mysql"
  instance_class         = "db.t3.micro"
  username               = "admin"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  skip_final_snapshot = true
}