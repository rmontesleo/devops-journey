

terraform {
  required_providers {
    linode = {
      source = "linode/linode"
    }
  }
}

variable "linode_token" {
  description = "Your Linode API Personal Access oken. (required)"
  sensitive = true
}


provider "linode" {
  token       = var.linode_token
  api_version = "v4"
}


locals {
  root_dir        = abspath(path.root)
  k8s_config_dir  = "${local.root_dir}/.kube"
  k8s_config_file = "${local.k8s_config_dir}/kubeconfig.yaml"
}

variable "k8s_cluster_label" {
  description = "Your k8s cluster"
  default = "terraform-k8s"
}


resource "linode_lke_cluster" "terraform_k8s" {
  label       = var.k8s_cluster_label
  region      = "us-east"
  k8s_version = "1.25"
  pool {
    type  = "g6-standard-1"
    count = 3
  }
  tags = ["terraform-k8s"]
}


resource "local_file" "k8s_config" {
  content         = nonsensitive(base64decode(linode_lke_cluster.terraform_k8s.kubeconfig))
  filename        = local.k8s_config_file
  file_permission = "0600"
}