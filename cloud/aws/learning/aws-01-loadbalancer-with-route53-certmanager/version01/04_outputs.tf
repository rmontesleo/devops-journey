output "nginx_node01_instance_ip" {
  value = aws_instance.nginx-ec2-instance-node-01.public_ip
}

output "apache2_node02_instance_ip" {
  value = aws_instance.apache-ec2-instance-node-02.public_ip
}

