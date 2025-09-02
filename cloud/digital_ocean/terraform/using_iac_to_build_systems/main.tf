terraform {
  required_providers {
    digitalocean = {
        source = "digitalocean/digitalocean"
        version = "~> 2.0"
    }
  }
}

variable "digitalocean_token" {}

provider "digitalocean" {
  token = var.digitalocean_token
}

data "digitalocean_account" "account_info" {}

output "droplet_limit" {
  value = data.digitalocean_account.account_info.droplet_limit
}


data "digitalocean_ssh_key" "home" {
  name ="Home Desktop WSL Ubuntu 22.04 LTS"
}

data "digitalocean_ssh_key" "work" {
  name = "Work Laptop"
}


variable "droplet_count" {
  type = number
  default = 2
}

variable "region" {
  type = string
  default = "sfo3"  
}

variable "droplet_size" {
  type = string
  default =  "s-1vcpu-1gb"
}

# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "web" {
  count  =  var.droplet_count
  image  =  "ubuntu-18-04-x64"
  name   =  "web-${var.region}-${count.index + 1}"    #"web-1"
  region =  var.region                                #"sfo3"
  size   =  var.droplet_size                          #"s-1vcpu-1gb"
  ssh_keys = [ 
    data.digitalocean_ssh_key.home.id, 
    data.digitalocean_ssh_key.work.id
  ]
}

output "server_ip" {
  value = digitalocean_droplet.web.*.ipv4_address
}