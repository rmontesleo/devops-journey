# shoud specify optional vs requires

variable "instance_name" {
  description = "Name of ec2 instance"
  type        = string
}

variable "ami" {
  type        = string
  description = "Amazon machine image to use for ec2 instances"
  default     = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
}

variable "instance_type" {
  type        = string
  description = "ec2 instance type"
  default     = "t2.micro"
}

variable "db_user" {
  type        = string
  description = "username for database"
  default     = "foo"
}

variable "db_password" {
  type        = string
  description = "Password for database"
  sensitive   = true
}
