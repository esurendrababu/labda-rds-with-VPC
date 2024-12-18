variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}
variable "availability_zones" {
  description = "List of availability zones for the private subnets"
  type        = list(string)
}
variable "vpc_id" {
  description = "ID of the VPC to associate with subnets and security groups"
  type        = string
}
