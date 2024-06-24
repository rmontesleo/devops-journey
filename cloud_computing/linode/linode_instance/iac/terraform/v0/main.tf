terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.19.0"
    }
  }
}

provider "linode" {
  token = var.linodeToken
}


resource "linode_vpc" "devsecops_vpc" {
  label       = "devsecops-vpc"
  region      = var.region
  description = "VPC for the DevSecOps Project"
}

resource "linode_vpc_subnet" "tooling_subnet" {
  vpc_id = linode_vpc.devsecops_vpc.id
  label  = "tooling-subnet"
  ipv4   = "10.0.0.0/24"
}

resource "linode_vpc_subnet" "backend_subnet" {
  vpc_id = linode_vpc.devsecops_vpc.id
  label  = "backend-subnet"
  ipv4   = "10.0.1.0/24"
}

resource "linode_vpc_subnet" "frontend_subnet" {
  vpc_id = linode_vpc.devsecops_vpc.id
  label  = "frontend-subnet"
  ipv4   = "10.0.2.0/24"
}


# Create an ssh key on linode
resource "linode_sshkey" "instance_shh_key" {
  label   = "instance_ssh_key"
  ssh_key = chomp(file("~/.ssh/linode/linode-key.pub"))
}

resource "linode_instance" "jenkins_instance" {
  label           = "jenkins_instance"
  image           = var.jenkins_image
  region          = var.region
  type            = var.instance_type
  authorized_keys = [linode_sshkey.instance_shh_key.ssh_key]
  root_pass       = var.linodeInstancePwd
  tags            = ["devops", "jenkins"]
  private_ip      = true
  stackscript_id  = var.jenkins_stackscript_id

  interface {
    purpose = "vpc"    
    subnet_id    = linode_vpc_subnet.tooling_subnet.id
    primary      = true
    ip_ranges    = []
    ipam_address = null
    ipv4 {
      nat_1_1 = "any"
    }
  }

  interface {
    purpose = "public"
  }
}


resource "linode_instance" "backend-server" {
  label           = "backend-server"
  image           = var.instance_image
  region          = var.region
  type            = var.instance_type
  authorized_keys = [linode_sshkey.instance_shh_key.ssh_key]
  root_pass       = var.linodeInstancePwd
  tags            = ["devops", "backend"]
  private_ip      = true
  interface {
    purpose = "vpc"    
    subnet_id    = linode_vpc_subnet.backend_subnet.id
    primary      = true
    ip_ranges    = []
    ipam_address = null
    ipv4 {
      nat_1_1 = "any"
    }

  }

  interface {
    purpose = "public"
  }
}

resource "linode_instance" "frontend-server" {
  label           = "frontend-server"
  image           = var.instance_image
  region          = var.region
  type            = var.instance_type
  authorized_keys = [linode_sshkey.instance_shh_key.ssh_key]
  root_pass       = var.linodeInstancePwd
  tags            = ["devops", "frontend"]
  private_ip      = true
  interface {
    purpose = "vpc"    
    subnet_id    = linode_vpc_subnet.frontend_subnet.id
    primary      = true
    ip_ranges    = []
    ipam_address = null
    ipv4 {
      nat_1_1 = "any"
    }

  }

  interface {
    purpose = "public"
  }
}

