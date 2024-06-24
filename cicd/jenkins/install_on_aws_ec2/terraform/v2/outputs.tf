

# print the url of the jenkins server
output "jenkins_controller_url" {
  value = join("", ["http://", aws_instance.jenkins-controller.public_dns, ":", "8080"])
}