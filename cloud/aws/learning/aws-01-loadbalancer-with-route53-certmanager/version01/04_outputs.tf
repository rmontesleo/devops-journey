output "nginx_node01_instance_ip" {
  value = aws_instance.nginx-ec2-instance-node-01.public_ip
}

output "apache2_node02_instance_ip" {
  value = aws_instance.apache-ec2-instance-node-02.public_ip
}

output "full_domain_name" {
  value = local.full_domain_name
}

output "key_pair_connection_name" {
  value = aws_key_pair.dev-ec2-intances-key-pair.key_name
}

output "testing_commands" {
  description = "Commands to test the infrastructure"
  value = {
    
    
  }
}