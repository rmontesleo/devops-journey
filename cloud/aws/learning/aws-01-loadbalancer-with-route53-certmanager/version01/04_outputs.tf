output "key_pair_connection_name" {
  value = aws_key_pair.dev-ec2-intances-key-pair.key_name
}

output "nginx_node01_instance_ip" {
  value = aws_instance.nginx-ec2-instance-node-01.public_ip
}

output "apache2_node02_instance_ip" {
  value = aws_instance.apache-ec2-instance-node-02.public_ip
}

output "full_domain_name" {
  value = local.full_domain_name
}

output "www_domain_name" {
  value = local.www_domain_name
}



output "testing_commands" {
  description = "Commands to test the infrastructure"
  value = {
    dig_test_main_domain = "dig 8.8.8.8 ${local.full_domain_name}"
    dig_test_www_domain = "dig 8.8.8.8 ${local.www_domain_name}"
  }
}
