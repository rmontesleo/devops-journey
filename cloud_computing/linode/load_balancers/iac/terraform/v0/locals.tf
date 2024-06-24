locals {
  apache_script = templatefile("${path.module}/scripts/apache_script.tpl", {})
}

locals {
  nginx_script = templatefile("${path.module}/scripts/nginx_script.tpl", {})
}