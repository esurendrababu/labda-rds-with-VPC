output "private_subnet_a_id" {
  value = aws_subnet.private[0].id
}

output "private_subnet_b_id" {
  value = aws_subnet.private[1].id
}

output "lambda_rds_sg_id" {
  value = aws_security_group.rds.id  # Ensure this references the correct resource in your VPC module
}
