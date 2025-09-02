
resource "local_file" "kubernetes_config" {
  content  = digitalocean_kubernetes_cluster.demok8s_gettingstarted.kube_config.0.raw_config
  filename = "${var.cluster_region}-${var.cluster_version}-${var.k8s_name}-kubeconfig.yaml"
}