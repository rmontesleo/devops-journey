
# Step1: Create the VPC
resource "aws_vpc" "travis_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-new-travis-vpc"
  }

}

# Step 2: Create two subnets

## Step 2.1 Create the Public Subnet
resource "aws_subnet" "travis_pulic_subnet" {
  vpc_id            = aws_vpc.travis_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "PublicSubnet"
  }
}

## Step 2.2
resource "aws_subnet" "travis_private_subnet" {
  vpc_id            = aws_vpc.travis_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "PrivateSubnet"
  }
}


# Steps 3 Create two route tables

## Step 3.1 Create route table PublicRouteTable
resource "aws_route_table" "travis_public_route_table" {
  vpc_id = aws_vpc.travis_vpc.id

  tags = {
    Name = "PublicRouteTable"
  }
}

## Step 3.2 Create route table PrivateRouteTable
resource "aws_route_table" "travis_private_route_table" {
  vpc_id = aws_vpc.travis_vpc.id

  tags = {
    Name = "PrivateRouteTable"
  }
}


# Step 4: Create route table associations (Subnet to route table)

## Step 4.1 Create the subnet association between PublicSubnet and PublicRouteTable
resource "aws_route_table_association" "travis_public_table_association" {
  subnet_id = aws_subnet.travis_pulic_subnet.id
  route_table_id =  aws_route_table.travis_public_route_table.id
}

## Step 4.2 Create the subnet association between PrivateSubnet and PrivateRouteTable
resource "aws_route_table_association" "travis_private_table_association" {
  subnet_id = aws_subnet.travis_private_subnet.id
  route_table_id =  aws_route_table.travis_private_route_table.id
}


#Step 5 Create the Internet gateway
resource "aws_internet_gateway" "travis_internet_gateway" {
  vpc_id = aws_vpc.travis_vpc.id
  tags = {
    Name = "my-internet-gateway"
  }
}


# Step 6 Create Route to connect the public route table and the internet gateway
resource "aws_route" "travis_public_route" {
  route_table_id         = aws_route_table.travis_public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.travis_internet_gateway.id
}


# Step 7 Create an Elastic IP
resource "aws_eip" "travis_elastic_ip" {
  vpc = true
  
  tags = {
    Name = "my-elastic-ip"
  }
}

# Step 8 Create a Nat Gateway
resource "aws_nat_gateway" "travis_nat_gateway" {
  allocation_id = aws_eip.travis_elastic_ip.id
  subnet_id = aws_subnet.travis_pulic_subnet.id

  tags = {
    Name = "my-nat-gateway"
  }
}

# Step 9 Create Private Route
resource "aws_route" "travis_private_route" {
  route_table_id = aws_route_table.travis_private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.travis_nat_gateway.id
}