

#############################################################
## EC2 Configuration
#############################################################

# Nginx Instance
resource "aws_instance" "nginx-ec2-instance-node-01" {
  subnet_id = aws_subnet.dev-subnet-01.id
  instance_type = var.ec2_instance_type
  ami = var.ec2_instance_ami
  key_name = aws_key_pair.dev-ec2-intances-key-pair.id
  
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.dev-ec2-security-group.id ]
  user_data_base64 = base64encode(local.ec2-init-nginx)
  root_block_device {
    volume_size = 8
  }
  
  tags = {
    Name =  var.ec2_instance_node01_tag_name
    Project = var.dev_tag_project_name
  }

}

# Apache Instance
resource "aws_instance" "apache-ec2-instance-node-02" {
  subnet_id = aws_subnet.dev-subnet-02.id
  instance_type = var.ec2_instance_type
  ami = var.ec2_instance_ami
  key_name = aws_key_pair.dev-ec2-intances-key-pair.id
  
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.dev-ec2-security-group.id]
  user_data_base64 = base64encode(local.ec2-init-apache)
  root_block_device {
    volume_size = 8
  }
  tags = {
    Name = var.ec2_instance_node02_tag_name
    Project = var.dev_tag_project_name
  }
}