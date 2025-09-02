terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

# Resource Block
resource "aws_instance" "app_server" {
  ami           = "ami-06ca3ca175f37dd66"
  instance_type =  var.ec2_instance_type



  tags = {
    Name = var.instance_name
  }
}