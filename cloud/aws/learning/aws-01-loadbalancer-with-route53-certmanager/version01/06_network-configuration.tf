#############################################################
## Network configuration
#############################################################


#############################################################
## VPC
#############################################################
resource "aws_vpc" "demo-vpc" {
  cidr_block = var.vpc_cidr_block_value
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "${var.dev_tag_project_name}-vpc"
    Project = var.dev_tag_project_name
  }
}

#############################################################
## Internet Gateway
#############################################################
resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.demo-vpc.id
  tags = {
    Name = "${var.dev_tag_project_name}-igw"
    Project =  var.dev_tag_project_name
  }
}

#############################################################
## Subnet
#############################################################

# TODO: Implement private subnets to attached the ec2 instances

resource "aws_subnet" "dev-subnet-01" {
  vpc_id = aws_vpc.demo-vpc.id
  cidr_block = var.subnet_cidr_block_value_01
  map_public_ip_on_launch = true
  availability_zone = var.subnet_availability_zone_01
  tags = {
    Name = "${var.dev_tag_project_name}-subnet-01"
    Project =  var.dev_tag_project_name
  }
}


resource "aws_subnet" "dev-subnet-02" {
  vpc_id = aws_vpc.demo-vpc.id
  cidr_block = var.subnet_cidr_block_value_02
  map_public_ip_on_launch = true
  availability_zone = var.subnet_availability_zone_02
  tags = {
    Name = "${var.dev_tag_project_name}-subnet-02"
    Project =  var.dev_tag_project_name
  }
}


#############################################################
## Route table configuration for Development environment
#############################################################
resource "aws_route_table" "dev-rt" {
  vpc_id = aws_vpc.demo-vpc.id
  tags = {
    Name = "${var.dev_tag_project_name}-route-table"
    Project =  var.dev_tag_project_name
  }
}

resource "aws_route" "dev-public-route" {
  route_table_id = aws_route_table.dev-rt.id  
  gateway_id = aws_internet_gateway.dev-igw.id
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "dev-public-assoc-01" {
  subnet_id = aws_subnet.dev-subnet-01.id
  route_table_id = aws_route_table.dev-rt.id
}

resource "aws_route_table_association" "dev-public-assoc-02" {
  subnet_id = aws_subnet.dev-subnet-02.id
  route_table_id = aws_route_table.dev-rt.id
}

