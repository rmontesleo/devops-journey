
locals {
  ec2-init-nginx = templatefile("${path.module}/templates/init_instance_nginx.tpl", {})

  ec2-init-apache = templatefile("${path.module}/templates/init_instance_apache.tpl", {})

  full_domain_name = "${var.subdomain_name}.${var.domain_name}"

  www_domain_name = "www.${full_domain_name}"

}