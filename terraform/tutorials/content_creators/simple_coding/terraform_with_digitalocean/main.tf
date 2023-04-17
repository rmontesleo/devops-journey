
# This is the previous way to initialize the  provider
#provider "digitalocean" {  
#}

terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}




resource "digitalocean_ssh_key" "web" {
  name       = "Web app SSH key"
  public_key = file("${path.module}/files/id_rsa.pub")

}

# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "web" {
  image      = "ubuntu-22-04-x64"
  name       = "web-1"
  region     = "sfo3"
  size       = "s-1vcpu-512mb-10gb"
  monitoring = true
  # this is deprecated use insted vpc_uuid
  #private_networking = true

  ssh_keys = [digitalocean_ssh_key.web.id]

  user_data = file("${path.module}/files/user-data.sh")

}

########################################################################################
######  Create a domain to apply the next two resources.  ######

# Create a new domain
#resource "digitalocean_domain" "domain" {
#  name       = "example.com"
#  #ip_address = digitalocean_droplet.foo.ipv4_address
#}

# Add an A record to the domain for www.example.com.
#resource "digitalocean_record" "main" {
#  domain = digitalocean_domain.domain.id
#  type   = "A"
#  name   = "www"
#  value  =  digitalocean_droplet.web.ipv4_address
#}
########################################################################################