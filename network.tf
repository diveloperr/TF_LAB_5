resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.name}-terraform-vpc"
  }
}

resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "ap-northeast-2a"
  cidr_block        = "10.0.10.0/24"
  tags = {
    Name = "${var.name}-terraform-pub-sub-a"
  }
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_c" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "ap-northeast-2c"
  cidr_block        = "10.0.20.0/24"
  tags = {
    Name = "${var.name}-terraform-pub-sub-c"
  }
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.name}-terraform-igw"
  }
}


resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "${var.name}-terraform-public-rt"
  }
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_c" {
  subnet_id      = aws_subnet.public_c.id
  route_table_id = aws_route_table.public_rt.id
}
