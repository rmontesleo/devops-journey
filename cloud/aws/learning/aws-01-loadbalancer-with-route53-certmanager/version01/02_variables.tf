variable dev_tag_project_name {
    description = ""
    type = string
    sensitive = false    
    default = "demo-load-balancer"
}

variable "provider_region" {
  description = ""
  type = string
  sensitive = false  
}

variable "vpc_cidr_block_value" {
  description = ""
  type = string
  sensitive = false  
}

variable "subnet_cidr_block_value_01" {
  description = ""
  type = string
  sensitive = false  
}

variable "subnet_cidr_block_value_02" {
  description = ""
  type = string
  sensitive = false  
}

variable "subnet_availability_zone_01" {
  description = ""
  type = string
  sensitive = false  
}

variable "subnet_availability_zone_02" {
  description = ""
  type = string
  sensitive = false  
}

variable "ec2_instance_type" {
  description = ""
  type = string
  sensitive = false  
  default = "t3.micro"
}

variable "ec2_instance_ami" {
  description = "By default an Ubuntu an LTS version"
  type = string
  sensitive = false  
}

variable "ec2_node_security_group_ssh_from_port" {
  description = ""
  type = number
  sensitive = true  
}

variable "ec2_node_security_group_ssh_to_port" {
  description = ""
  type = number
  sensitive = true  
}

variable "ec2_nodes_security_group_cidr_block_list" {
  description = "List of CIDR blocks allowed for SSH access"
  type = list(string)
  sensitive = true    
}

variable "ec2_public_key_pair_value" {
  description = ""
  type = string
  sensitive = false
}


variable "ec2_instance_node01_tag_name" {
  description = ""
  type = string
  sensitive = false  
  default = "nginx-ec2-instance-node-01"
}

variable "ec2_instance_node02_tag_name" {
  description = ""
  type = string
  sensitive = false  
  default = "apache-ec2-instance-node-02"
}

variable "domain_name" {
  description = "PoC Pipelline domain name"
  type = string
  sensitive = false  
}

variable "subdomain_name" {
  description = ""
  type = string
  sensitive = false  
}

