output "instance_id" {
  description = ""
  value       = aws_instance.jenkins_node.id
}

output "instance_public_ip" {
  description = ""
  value       = aws_instance.jenkins_node.public_ip
}