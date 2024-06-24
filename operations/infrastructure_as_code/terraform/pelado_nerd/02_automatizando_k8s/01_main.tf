

resource "digitalocean_kubernetes_cluster" "pelado" {
  name ="pelado"
  region = "sfo3"
  version = "1.26.3-do.0"

  node_pool {
    name = "pelado-nodes"
    size = "s-1vcpu-2gb"
    node_count = 3
  }


}