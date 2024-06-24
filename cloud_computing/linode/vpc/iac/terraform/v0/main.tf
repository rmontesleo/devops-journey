terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "2.19.0"
    }
  }
}

provider "linode" {
  # Configuration options
  
  # You require a enviroment variable call TF_VAR_linodeToken
  token = var.linodeToken
}


variable "linodeToken" {
  type = string
  description = "Linode token"
  sensitive = true
}



resource "linode_vpc" "test" {
    label = "test-vpc"
    region = "us-iad"
    description = "My first VPC."
}

resource "linode_vpc_subnet" "test-backend" {
    vpc_id = linode_vpc.test.id
    label = "test-subnet-backend"
    ipv4 = "10.0.0.0/24"
}

resource "linode_vpc_subnet" "test-frontend" {
    vpc_id = linode_vpc.test.id
    label = "test-subnet-frontend"
    ipv4 = "10.0.1.0/24"
}

