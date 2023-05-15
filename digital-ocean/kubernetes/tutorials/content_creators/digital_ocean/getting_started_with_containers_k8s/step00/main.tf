

resource "digitalocean_kubernetes_cluster" "demok8s_containers" {
  name =  var.cluster_name  
  region = var.cluster_region 
  version = var.cluster_version  
  node_pool {
    name = var.nodepool_name
    size = var.nodepool_size
    node_count = var.nodepool_node_count
  }
}


