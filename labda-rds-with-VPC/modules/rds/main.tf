resource "aws_db_instance" "mysql" {
  identifier           = "lambda-mysql-db"
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0.39"
  instance_class       = "db.t3.micro"  # Ensure this line is included
  db_name              = "testdb"
  username             = "admin22"
  password             = "password123"
  vpc_security_group_ids = [var.security_group_id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
  skip_final_snapshot  = true
}
resource "aws_db_subnet_group" "main" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids  # Ensure you pass subnet IDs via variables
  tags = {
    Name = "RDS Subnet Group"
  }
}
