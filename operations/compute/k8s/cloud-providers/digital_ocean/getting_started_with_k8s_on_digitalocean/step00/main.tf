

resource "digitalocean_kubernetes_cluster" "demok8s_gettingstarted" {
  name    = "${var.cluster_region}-${var.k8s_name}-cluster"
  region  = var.cluster_region
  version = var.cluster_version
  node_pool {
    name       = "${var.nodepool_size}-${var.k8s_name}-nodepool"
    size       = var.nodepool_size
    node_count = var.nodepool_node_count
  }

}