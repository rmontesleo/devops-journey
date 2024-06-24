terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.20.0"
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


# Create an ssh key on linode
resource "linode_sshkey" "instance_shh_key" {
  label   = "instance_ssh_key"
  ssh_key = chomp(file("~/.ssh/linode/linode-key.pub"))
}


# Worker node with nginx installed
resource "linode_instance" "nginx-worker-node" {
  count = 3
  label           = "nginx-worker-node-${count.index + 1}"
  image           = var.instance_image
  region          = var.region
  type            = var.instance_type
  authorized_keys = [linode_sshkey.instance_shh_key.ssh_key]
  root_pass       = var.linodeInstancePwd
  tags            = ["devops", "backend"]
  private_ip      = true
  interface {
    purpose      = "vpc"
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

  metadata {
    user_data = base64encode(local.nginx_script)
  }



}

# Worker node with apache installed
/*
resource "linode_instance" "worker-02-node" {
  label           = "worker-02-node"
  image           = var.instance_image
  region          = var.region
  type            = var.instance_type
  authorized_keys = [linode_sshkey.instance_shh_key.ssh_key]
  root_pass       = var.linodeInstancePwd
  tags            = ["devops", "frontend"]
  private_ip      = true
  interface {
    purpose      = "vpc"
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

  metadata {
    user_data = base64encode(local.apache_script)
  }
}
*/


# Load balancer
resource "linode_nodebalancer" "tooling_nodebalance" {
  label                = "tooling-nodebalance"
  region               = var.region
  client_conn_throttle = 20
  tags                 = ["devops", "nodebalancer"]
}


# Load balancer configuration
resource "linode_nodebalancer_config" "tooling_nb_config" {
  nodebalancer_id = linode_nodebalancer.tooling_nodebalance.id
  port            = 80
  protocol        = "http"
  algorithm       = "roundrobin"
  check           = "http"
  check_path      = "/"
  check_attempts  = 3
  check_timeout   = 30
  check_interval  = 60
  stickiness      = "table"
}

# Load balancer nodes for nginx
resource "linode_nodebalancer_node" "nginx_nb_node" {
  count = 3
  label           = "nginx-nb-node"
  nodebalancer_id = linode_nodebalancer.tooling_nodebalance.id
  config_id       = linode_nodebalancer_config.tooling_nb_config.id
  address         = "${element(linode_instance.nginx-worker-node.*.private_ip_address, count.index)}:80"
  weight          = 50
  mode = "accept"
}

/*
resource "linode_nodebalancer_node" "apache_nb_node" {
  label           = "apache-nb-node"
  nodebalancer_id = linode_nodebalancer.tooling_nodebalance.id
  config_id       = linode_nodebalancer_config.tooling_nb_config.id
  address         = "${linode_instance.worker-02-node.private_ip_address}:80"
  weight          = 50
  #mode = "accept"
}
*/
