#VPC-creation

resource "aws_vpc" "my_vpc" {
  cidr_block       = "172.168.0.0/20"
  instance_tenancy = "default"


  tags = {
    Name = "my_vpc"
  }
}
#web-subnet-creation

resource "aws_subnet" "my_subnet-01" {
  vpc_id                  = aws_vpc.my_vpc.id
  availability_zone       = "us-east-1a"
  cidr_block              = "172.168.0.0/23"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "my_subnet-01"
  }

}
resource "aws_subnet" "my_subnet-02" {
  vpc_id                  = aws_vpc.my_vpc.id
  availability_zone       = "us-east-1b"
  cidr_block              = "172.168.2.0/23"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "my_subnet-02"
  }
}
resource "aws_subnet" "my_subnet-03" {
  vpc_id = aws_vpc.my_vpc.id
  availability_zone = "us-east-1c"
  cidr_block = "172.168.4.0/23"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "my-subnet-03"
  }
}
#db-subnet-creation
resource "aws_subnet" "my_db-subnet-01" {
  vpc_id            = aws_vpc.my_vpc.id
  availability_zone = "us-east-1a"
  cidr_block        = "172.168.6.0/24"


  tags = {
    Name = "my_db-subnet-01"
  }
}
resource "aws_subnet" "my_db-subnet-02" {
  vpc_id            = aws_vpc.my_vpc.id
  availability_zone = "us-east-1a"
  cidr_block        = "172.168.7.0/24"


  tags = {
    Name = "my_db-subnet-02"
  }
}
resource "aws_subnet" "my_db-subnet-03" {
  vpc_id            = aws_vpc.my_vpc.id
  availability_zone = "us-east-1c"
  cidr_block        = "172.168.8.0/24"


  tags = {
    Name = "my_db-subnet-03"
  }
}

#Internet-Gat-Way

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my_igw"
  }
}

#Route-table-web

resource "aws_route_table" "my-route-web" {
  vpc_id = aws_vpc.my_vpc.id

    tags = {
      Name = "my_route_web"
    }
  }
resource "aws_route" "my-igw-rt" {
  route_table_id = aws_route_table.my-route-web.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.my_igw.id
}
  resource "aws_route_table_association" "my_1a" {
    subnet_id      = aws_subnet.my_subnet-01.id
    route_table_id = aws_route_table.my-route-web.id

  }
  resource "aws_route_table_association" "my_1b" {
    subnet_id      = aws_subnet.my_subnet-02.id
    route_table_id = aws_route_table.my-route-web.id

  }

resource "aws_route_table_association" "my_1c" {
  route_table_id = aws_route_table.my-route-web.id
  subnet_id = aws_subnet.my_subnet-03.id
}
#Route-table-DB
resource "aws_route_table" "my-route-db" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my-route-db"
  }
}
resource "aws_route_table_association" "my-route-1a" {
  route_table_id = aws_route_table.my-route-db.id
  subnet_id = aws_subnet.my_db-subnet-01.id
}
resource "aws_route_table_association" "my-route-1b" {
  route_table_id = aws_route_table.my-route-db.id
  subnet_id = aws_subnet.my_db-subnet-02.id
}
resource "aws_route_table_association" "my-route-1c" {
  route_table_id = aws_route_table.my-route-db.id
  subnet_id = aws_subnet.my_db-subnet-03.id
}

