
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

# Create a new Web Droplet in the sfo3 region
resource "digitalocean_droplet" "web" {
  count      =  2
  image      = "ubuntu-22-04-x64"
  name       = "web-${count.index}"
  region     = "sfo3"
  size       = "s-1vcpu-512mb-10gb"
  monitoring = true
  
  
  # this is deprecated use insted vpc_uuid
  #private_networking = true

  ssh_keys = [digitalocean_ssh_key.web.id]

  user_data = file("${path.module}/files/user-data.sh")

  tags   = [ digitalocean_tag.web.name ]

}


resource "digitalocean_firewall" "web" {
  name = "web-droplet-firewall"

  droplet_ids = digitalocean_droplet.web.*.id

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "8080"
    source_load_balancer_uids = [ digitalocean_loadbalancer.web.id ]
  }


  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}



resource "digitalocean_loadbalancer" "web" {
  name   = "web-lb"
  region = "sfo3"

  # we need the domain and the certificate
  #redirect_http_to_https = true

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 8080
    target_protocol = "http"
  }

  #forwarding_rule {    
  #  entry_port     = 443
  #  entry_protocol = "https"
  #  target_port     = 8080
  #  target_protocol = "http"    
  # #certificate_id is deprecated 
  #  #certificate_name = ""
  #}

  healthcheck {
    port     = 8080
    protocol = "http"
    path = "/"
  }

  # we required the list of droplet id
  droplet_ids = digitalocean_droplet.web.*.id  

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
#  value  =  digitalocean_droplet.web.0.ipv4_address
#}

#resource "digitalocean_certificate" "web" {
#  name    = "web-certificate"
#  type    = "lets_encrypt"
#  domains = ["example.com"]
#}


########################################################################################


resource "digitalocean_database_cluster" "db" {
  name       = "web-db"
  engine     = "mysql"
  version    = "8"
  size       = "db-s-1vcpu-1gb"
  region     = "sfo3"
  node_count = 1
}

resource "digitalocean_database_firewall" "db-fw" {
  cluster_id = digitalocean_database_cluster.db.id

  rule {
    type  = "tag"
    value = digitalocean_tag.web.name
  }
}

resource "digitalocean_tag" "web" {
  name = "web-app"
}