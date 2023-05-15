cluster_region  = "sfo3"
cluster_version = "1.26.3-do.0"
k8s_name        = "demo-k8s-microservices"

nodepool_size       = "s-1vcpu-2gb"
nodepool_node_count = 3


#cluster_name    = "${local.region}-${local.version}-${local.k8s_name}-cluster"
#nodepool_name       = "${local.size}-${local.k8s_name}-nodepool"
#kubeconfig_filename = "${local.region}-${local.varsion}-${local.k8s_name}-kubeconfig.yaml"