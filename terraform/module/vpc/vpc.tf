#VPC
resource "aws_vpc" "dev-vpc-01" {
  cidr_block = var.vpc_cider
  tags = {
    Name = var.tgn-vpc
    Env  = var.env
  }
}
#INTERNET-GATEWAY
resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.dev-vpc-01.id
  tags = {
    Name = var.tgn-vpc-igw
    Env  = var.env
  }
}
#SUBNET-PUBLIC
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.dev-vpc-01.id
  count                   = length(var.public_subnets_cider)
  cidr_block              = element(var.public_subnets_cider, count.index)
  availability_zone       = element(var.AZS-Public, count.index)
  map_public_ip_on_launch = "true"
  tags = {
    Name = "WEB-subnet-${count.index + 1}"
  }
}
#SUBNET-PRIVATE
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.dev-vpc-01.id
  count             = length(var.private_subnets_cider)
  cidr_block        = element(var.private_subnets_cider, count.index)
  availability_zone = element(var.AZS-Private, count.index)
  tags = {
    Name = "DB-subnet-${count.index + 1}"
  }
}

#ROUTE-TABLE
resource "aws_route_table" "public-RT" {
  vpc_id = aws_vpc.dev-vpc-01.id
  route {
    gateway_id = aws_internet_gateway.dev-igw.id
    cidr_block = var.cider
  }
  tags = {
    Name = var.tgn-public-RT
    Env  = var.env
  }
}
################################################################
#NATGATWAY
resource "aws_eip" "pub-eip" {
  count = 2
  domain = "vpc"
  tags = {
    Name = "Elastic-ip-${count.index+1}"
  }
}

resource "aws_nat_gateway" "pub-nat" {
  subnet_id = aws_subnet.public[0].id
  allocation_id = aws_eip.pub-eip[1].id
  tags = {
    Name = "Nat-gateway-${count.index+1}"
  }
}
#ROUTE-TABLE
resource "aws_route_table" "private-RT" {
  vpc_id = aws_vpc.dev-vpc-01.id
  route {
    gateway_id = aws_nat_gateway.pub-nat.id
    cidr_block = var.cider
  }
  tags = {
    Name = var.tgn-private-RT
    Env  = var.env

  }
}
#ROUTE_TABLE_ASSOCIATION
resource "aws_route_table_association" "public-RTA" {
  route_table_id = aws_route_table.public-RT.id
  count          = length(var.public_subnets_cider)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
}
resource "aws_route_table_association" "private-RTA" {
  route_table_id = aws_route_table.private-RT.id
  count          = length(var.private_subnets_cider)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
}