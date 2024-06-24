variable "vpc_cidr" {
    type = string
    description = "Value of the CIDR range for the VPC"
    default = "10.0.0.0/16"
}

variable "vpc_name" {
    type = string
    description = "Value fo the name for the VPC"
    default = "MyTestVPC"
}

variable "subnet_cidr" {
    type = string
    description = "Value of the subnet cidr for the VPC"
    default = "10.0.0.1.0/24"
}

variable "subnet_name" {
    type = string
    description = "Value of the subnet name for the VPC"
    default = "MyTestSubnet"
}

variable "igw_name" {
    type = string
    description = "Value of the Internet Gateway for the VPC"
    default = "MyTestIGW"
}

variable "ec2_ami" {
    type = string
    description = "Value of the AMI Id for the EC2 Instance"
    default = "ami-007868005aea67c54"
}

variable "ec2_name" {
    type = string
    description = "Value of the Name for the EC2 Instance"
    default = "MyTestEC2"
}
