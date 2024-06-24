terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami = "ami-0261755bbcb8c4a84"  # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"  
}