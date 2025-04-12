variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}
variable "lb_sg_id" {
  description = "Security Group ID for ALB"
  type        = string
}
variable "ec2_instance_id" {
  description = "EC2 Instance ID to target"
  type        = string
}
