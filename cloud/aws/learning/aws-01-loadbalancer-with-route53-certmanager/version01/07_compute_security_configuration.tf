#############################################################
## EC2 Security Configuration
#############################################################

resource "aws_security_group" "dev-ec2-security-group" {
  name = "${var.dev_tag_project_name}-ec2-nodes-sg"
  vpc_id = aws_vpc.demo-vpc.id

  # TODO: Change this for a more secure way to connect to the instances
  # TODO: Implement a  Bastion
  # TODO: Change cidr_blocks value by the authorized ip to conect with this
  ingress {
    from_port = var.ec2_node_security_group_ssh_from_port
    to_port = var.ec2_node_security_group_ssh_to_port
    protocol = "tcp"
    cidr_blocks = var.ec2_nodes_security_group_cidr_block_list
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
  public_key = file(var.ec2_public_key_pair_value)
}


#############################################################
## Load Balancer Security Configuration
#############################################################
resource "aws_security_group" "dev-loadbalancer-security-group" {
  name = "${var.dev_tag_project_name}-lb-sg"
  vpc_id = aws_vpc.demo-vpc.id

  ingress  {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
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