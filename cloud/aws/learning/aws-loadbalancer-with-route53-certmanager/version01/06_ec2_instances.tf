#############################################################
## EC2 Security Configuration
#############################################################

resource "aws_security_group" "dev-ec2-security-group" {
  name = "dev-ec2-security-group"
  vpc_id = aws_vpc.demo-vpc.id

  # TODO: Change this for a more secure way to connect to the instances
  # TODO: Implement a  Bastion
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress  {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress  {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "dev-ec2-intances-key-pair" {
  key_name = "load-balancer-keypair"
  public_key = file("~/.ssh/aws/poc/pipepline/api-key.pub")
}

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
    Name = "nginx-ec2-instance-node-01"
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
    Name = "apache-ec2-instance-node-02"
    Project = var.dev_tag_project_name
  }
}