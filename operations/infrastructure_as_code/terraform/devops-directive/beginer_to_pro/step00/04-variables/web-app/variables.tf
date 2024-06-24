# General Variables

variable "region" {
    type = string
    description = "Default region for provider"
    default = "us-east-1"
}

# Route 53 variables

variable "domain" {
    type = string
    description = "Domain for website"
}


# EC2 variables

variable "ami" {
    type = string
    description = "Amazon machine images to use for ec2 isntance"
    default = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
}

variable "instance_type" {
    type = string
    description = "ec2 instance type"
    default = "t2.micro"
}

# S3 Variables

variable "bucket_name" {
    type = string
    description = "name of s3 bucket for app data"    
}




# RDS Variables
variable "db_name" {
    type = string
    description = "Name of  Database"
}

variable "db_user" {
    type = string
    description = "Username for DB"
}

variable "db_password" {
    type = string
    description = "Password for DB"
    sensitive = true
}
