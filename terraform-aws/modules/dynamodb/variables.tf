variable "table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "read_capacity" {
  description = "Read capacity"
  type        = number
  default     = 5
}

variable "write_capacity" {
  description = "Write capacity"
  type        = number
  default     = 5
}
