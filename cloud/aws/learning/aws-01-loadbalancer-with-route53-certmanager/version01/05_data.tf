data "aws_instances" "existing_by_name" {
    filter {
      name = "tag:Name"
      values = [ var.ec2_instance_node01_tag_name, var.ec2_instance_node02_tag_name]
    }
}

//This is a reference of a created hosted zone
data "aws_route53_zone" "demo_domain_zone" {
  name         = var.domain_name
  private_zone = false
}