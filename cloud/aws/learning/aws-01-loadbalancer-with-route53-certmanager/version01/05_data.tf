data "aws_instances" "existing_by_name" {
    filter {
      name = "tag:Name"
      values = [ var.ec2_instance_node01_tag_name, var.ec2_instance_node02_tag_name]
    }
}