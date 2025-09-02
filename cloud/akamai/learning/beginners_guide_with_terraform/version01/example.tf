
terraform {
  required_providers {
    linode = {
      source = "linode/linode"
    }
  }
}


variable "linode_token" {}

variable "root_pass" {}


# v4     : stable
# v4beta : beta 
provider "linode" {
  token       = var.linode_token
  api_version = "v4"
}


# linode
resource "linode_instance" "example_instance" {
  label     = "example_instance_label"
  image     = "linode/ubuntu18.04"
  region    = "us-central"
  type      = "g6-standard-1"
  root_pass =  var.root_pass  

  provisioner "file" {
    source = "setup_script.sh"
    destination = "/tmp/setup_script.sh"
    connection {
      type = "ssh"
      host = self.ip_address
      user = "root"
      password = var.root_pass
    }
  }

  provisioner "remote-exec" {
    inline = [ 
      "chmod +x /tmp/setup_script.sh",
      "/tmp/setup_script.sh",
      "sleep 1"
    ]

    connection {
      type = "ssh"
      host = self.ip_address
      user = "root"
      password = var.root_pass
    }
  }

}

# domain
#resource "linode_domain" "example_domain" {
#  domain = "mysuperdomian.com"
#  soa_email = "email_associated_with_domain@some.mail.com"
#  type = "master"
#}


# domain record
#resource "linode_domain_record" "example_domain_record" {
#  domain_id = linode_domain.example_domain.id
#  name = "mysuperdomian.com"  
#  record_type = "A"
#  target = linode_instance.example_instance.ip_address
#  ttl_sec = 300
#}

# firewall
resource "linode_firewall" "example_firewall" {
  label = "example_firewall_label"
  inbound {
    label = "allow-http"
    action = "ACCEPT"
    protocol = "TCP"
    ports = "80"
    ipv4 = [ "0.0.0.0/0" ]
    ipv6 = [ "ff00::/8" ]
  }

  inbound_policy = "DROP"

  outbound_policy = "ACCEPT"

  linodes = [  linode_instance.example_instance.id ]

}