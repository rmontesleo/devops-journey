
# This is the previous way to initialize the  provider
#provider "digitalocean" {  
#}

terraform {
  required_providers {
    digitalocean = {
        source = "digitalocean/digitalocean"
        version = "~> 2.0"
    }
  }
}


resource "digitalocean_ssh_key" "web" {
  name = "Web app SSH key"
  public_key = file( "${path.module}/files/id_rsa.pub" )
  
}

# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "web" {
  image  = "ubuntu-22-04-x64"
  name   = "web-1"
  region = "sfo3"
  size   = "s-1vcpu-512mb-10gb"
  monitoring = true
  # this is deprecated use insted vpc_uuid
  #private_networking = true

  ssh_keys = [ digitalocean_ssh_key.web.id ]

  user_data = file("${path.module}/files/user-data.sh" )


}