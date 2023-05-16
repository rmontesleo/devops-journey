
resource "local_file" "kube_config" {
  content  = digitalocean_kubernetes_cluster.demok8s_microservices.kube_config.0.raw_config
  filename = "${var.cluster_region}-${var.cluster_version}-${var.k8s_name}-kubeconfig.yaml"
}