variable dev_tag_project_name {
    type = string
    sensitive = false
    description = ""
    default = "demo-load-balancer"
}

variable "provider_region" {
  type = string
  sensitive = false
  description = ""
}

variable "vpc_cidr_block_value" {
  type = string
  sensitive = false
  description = ""
}

variable "subnet_cidr_block_value_01" {
  type = string
  sensitive = false
  description = ""
}

variable "subnet_cidr_block_value_02" {
  type = string
  sensitive = false
  description = ""
}

variable "subnet_availability_zone_01" {
  type = string
  sensitive = false
  description = ""
}

variable "subnet_availability_zone_02" {
  type = string
  sensitive = false
  description = ""
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
  description = "By default an Ubuntu an LTS version"
}

variable "ec2_node_security_group_ssh_from_port" {
  type = number
  sensitive = true
  description = ""
}

variable "ec2_node_security_group_ssh_to_port" {
  type = number
  sensitive = true
  description = ""
}

variable "ec2_node_security_group_cidr_block_value_01" {
  type = string
  sensitive = true
  description = ""  
}

variable "ec2_instance_node01_tag_name" {
  type = string
  sensitive = false
  description = ""
  default = "nginx-ec2-instance-node-01"
}

variable "ec2_instance_node02_tag_name" {
  type = string
  sensitive = false
  description = ""
  default = "apache-ec2-instance-node-02"
}

variable "domain_name" {
  description = "PoC Pipelline domain name"
}