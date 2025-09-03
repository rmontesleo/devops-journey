
locals {
  ec2-init-nginx = templatefile("${path.module}/templates/init_instance_nginx.tpl", {})

  ec2-init-apache = templatefile("${path.module}/templates/init_instance_apache.tpl", {})
}