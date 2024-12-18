variable "subnet_ids" {
  description = "The IDs of the subnets to associate with the RDS instance"
  type        = list(string)
}
variable "security_group_id" {
  description = "The ID of the security group to associate with the RDS instance"
  type        = string
}
