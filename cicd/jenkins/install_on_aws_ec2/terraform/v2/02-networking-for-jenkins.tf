#############################################################
## Network configuration
#############################################################

resource "aws_vpc" "jenkins_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name    = "cicd-dev-vpc"
    Project = "cicd-jenkins-project"
  }
}



resource "aws_subnet" "jenkins_subnet" {
  vpc_id     = aws_vpc.jenkins_vpc.id
  cidr_block = "10.0.1.0/24"

  #TODO: Verify how to fix this issue
  #map_public_ip_on_launch = true
  availability_zone = "us-east-1a"

  tags = {
    Name    = "cicd-dev-subnet"
    Project = "cicd-jenkins-project"
  }
}


resource "aws_route_table" "jenkins_rt" {
  vpc_id = aws_vpc.jenkins_vpc.id
  tags = {
    Name    = "cicd-dev-route-table"
    Project = "cicd-jenkins-project"
  }
}


resource "aws_route_table_association" "jenkins_public_assoc" {
  subnet_id      = aws_subnet.jenkins_subnet.id
  route_table_id = aws_route_table.jenkins_rt.id
}



resource "aws_internet_gateway" "jenkins_igw" {
  vpc_id = aws_vpc.jenkins_vpc.id
  tags = {
    Name    = "jenkins_igw"
    Project = "cicd-jenkins-project"
  }
}

resource "aws_route" "jenkins_public_route" {
  route_table_id         = aws_route_table.jenkins_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.jenkins_igw.id
}
