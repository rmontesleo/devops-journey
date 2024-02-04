variable "project_tag" {
  type        = string
  description = "(optional) describe your variable"
  default     = "jenkins-dev-project-tag"
}

variable "jenkins_region" {
  type        = string
  description = "Region for the Jenkins Infrastructure"
  default     = "us-east-1a"
}

variable "vpc_cidr" {
  type        = string
  description = "Value of the CIDR range for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "Value fo the name for the VPC"
  default     = "jenkins-dev-vpc"
}

variable "subnet_cidr" {
  type        = string
  description = "Value of the subnet cidr for the VPC"
  default     = "10.0.1.0/24"
}

variable "subnet_name" {
  type        = string
  description = "Value of the subnet name for the VPC"
  default     = "jenkins-dev-subnet"
}


variable "route_table_name" {
  type        = string
  description = "Value of the Route Table Name"
  default     = "jenkins-dev-route-table"
}

variable "igw_name" {
  type        = string
  description = "Value of the Internet Gateway for the VPC"
  default     = "jenkins-dev-internet-gateway"
}

variable "security_group_name" {
  type        = string
  description = "Value for the security group name"
  default     = "jenkins-dev-security-group"
}

variable "security_group_description" {
  type        = string
  description = "Value for the security group name"
  default     = "Security group for Jenkins Server"
}

variable "key_pair_name" {
  type        = string
  description = "(optional) describe your variable"
  default     = "jenkins-dev-key-pair"
}

variable "key_pair_file" {
  type        = string
  description = "(optional) describe your variable"
  default     = "~/.ssh/aws/mtc_key.pub"
}

variable "ec2_type" {
  type        = string
  description = "(optional) describe your variable"
  default     = "t2.micro"
}

variable "ec2_ami" {
  type        = string
  description = "Value of the AMI Id for the EC2 Instance"
  default     = "ami-06ca3ca175f37dd66"
}


variable "ec2_user_data_file" {
  type        = string
  description = "(optional) describe your variable"
  default     = "userdata_amazon_linux2.tpl"
}

variable "ec2_volume_size" {
  type        = number
  description = "(optional) describe your variable"
  default     = 8
}

variable "ec2_name" {
  type        = string
  description = "Value of the Name for the EC2 Instance"
  default     = "jenkins-dev-master-4"
}
