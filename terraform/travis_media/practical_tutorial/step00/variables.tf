variable "instance_name" {
  type = string
  description = " aws ec2 describe-instancesalue of the nama tag for the EC2 Instance"  
  default = "MyNewInstance"
}

variable "ec2_instance_type" {
    type = string
    description = "AWS EC2 instance type"
    default = "t2.micro"
}