
resource "digitalocean_droplet" "web" {
    image = "ubuntu-22-04-x64"
    name = "web-1"
    region = "sfo3"
    size = "s-1vcpu-1gb"
    ssh_keys = [ "${digitalocean_ssh_key.pelado.fingerprint}" ]
    user_data = "${file("userdata.yaml")}"
  
}