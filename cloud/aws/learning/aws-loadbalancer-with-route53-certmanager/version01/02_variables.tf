variable dev_tag_project_name {
    type = string
    sensitive = false
    description = ""
    default = "rag-demo-load-balancer"
}

variable "provider_region" {
  type = string
  sensitive = false
  description = ""
  default = "us-east-2"
}

variable "vpc_cidr_block_value" {
  type = string
  sensitive = false
  description = ""
  default = "10.1.0.0/16"
}

variable "subnet_cidr_block_value" {
  type = string
  sensitive = false
  description = ""
  default = "10.1.2.0/24"
}

variable "subnet_availability_zone_01" {
  type = string
  sensitive = false
  description = "value"
  default = "us-east-2a"
}

variable "subnet_availability_zone_02" {
  type = string
  sensitive = false
  description = "value"
  default = "us-east-2c"
}

variable "ec2_instance_type" {
  type = string
  sensitive = false
  description = ""
  default = "t3.micro"
}

variable "ec2_instance_ami" {
  type = string
  sensitive = false
  description = "By default an Ubuntu 22.04 LTS"
  default = "ami-0cfde0ea8edd312d4"
}