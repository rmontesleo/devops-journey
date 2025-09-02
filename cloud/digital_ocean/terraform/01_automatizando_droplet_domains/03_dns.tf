# Create a new domain
#resource "digitalocean_domain" "pablokbs" {
#    name = "pablokbs.com"  
#}

# add a domain record
#resource "digitalocean_record" "www" {
#    domain = "${digitalocean_domain.pablokbs.name}"
#    type = "A"
#    name = "pelado"
#    ttl = "10"
#    value = "${digitalocean_droplet.web.ipv4_address}"
#}