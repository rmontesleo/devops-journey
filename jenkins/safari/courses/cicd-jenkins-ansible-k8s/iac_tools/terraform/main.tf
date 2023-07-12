# Item 01
resource "aws_vpc" "jenkins_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name    = var.vpc_name
    Project = var.project_tag
  }
}

# Item 02
resource "aws_subnet" "jenkins_subnet" {
  vpc_id                  = aws_vpc.jenkins_vpc.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.jenkins_region

  tags = {
    Name    = var.subnet_name
    Project = var.project_tag
  }
}

# Item 03
resource "aws_route_table" "jenkins_rt" {
  vpc_id = aws_vpc.jenkins_vpc.id
  tags = {
    Name    = var.route_table_name
    Project = var.project_tag
  }
}

# Item 04
resource "aws_route_table_association" "jenkins_public_assoc" {
  subnet_id      = aws_subnet.jenkins_subnet.id
  route_table_id = aws_route_table.jenkins_rt.id
}

# Item 05
resource "aws_internet_gateway" "jenkins_igw" {
  vpc_id = aws_vpc.jenkins_vpc.id
  tags = {
    Name    = var.igw_name
    Project = var.project_tag
  }
}

# Item 06
resource "aws_route" "jenkins_public_route" {
  route_table_id         = aws_route_table.jenkins_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.jenkins_igw.id
}

# Item 07
resource "aws_security_group" "jenkins_security_group" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = aws_vpc.jenkins_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Item 08: Key pair
resource "aws_key_pair" "key_pair" {
  key_name   = var.key_pair_name
  public_key = file(var.key_pair_file)

  tags = {
    Name    = var.key_pair_name
    Project = var.project_tag
  }
}

# Item 09: EC2 Instance
resource "aws_instance" "jenkins_node" {
  instance_type               = var.ec2_type
  ami                         = var.ec2_ami
  key_name                    = aws_key_pair.key_pair.id
  subnet_id                   = aws_subnet.jenkins_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.jenkins_security_group.id]
  user_data                   = file(var.ec2_user_data_file)

  root_block_device {
    volume_size = var.ec2_volume_size
  }

  tags = {
    Name    = var.ec2_name
    Project = var.project_tag
  }

}