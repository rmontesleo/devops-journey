terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}


provider "aws" {
  region                   = "us-east-1"
  profile                  = "default"
  shared_config_files      = ["~/.aws/credentials"]
  shared_credentials_files = ["~/.aws/credentials"]
}