variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}
variable "public_subnet_cidr_a" {
  description = "CIDR block for public subnet A"
  type        = string
}
variable "public_subnet_cidr_b" {
  description = "CIDR block for public subnet B"
  type        = string
}
variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
}
