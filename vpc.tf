resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Final-Project-VPC"
  }
}

// AZ1
resource "aws_subnet" "public_subnet_az1" {
  vpc_id                    = aws_vpc.main.id
  cidr_block                = "10.0.0.0/24" 
  availability_zone         = "ap-southeast-1a"
  map_public_ip_on_launch   = true

  tags = {
    Name = "Public-Subnet-AZ1"
  }
}

resource "aws_subnet" "private_subnet1_az1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "Private-Subnet1-AZ1"
  }
}

resource "aws_subnet" "private_subnet2_az1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "Private-Subnet2-AZ1"
  }
}

// AZ2
resource "aws_subnet" "public_subnet_az2" {
  vpc_id                    = aws_vpc.main.id
  cidr_block                = "10.0.16.0/24" 
  availability_zone         = "ap-southeast-1b"
  map_public_ip_on_launch   = true

  tags = {
    Name = "Public-Subnet-AZ2"
  }
}

resource "aws_subnet" "private_subnet1_az2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.32.0/24"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "Private-Subnet1-AZ2"
  }
}

resource "aws_subnet" "private_subnet2_az2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.48.0/24"
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "Private-Subnet2-AZ2"
  }
}

// Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Final-Project-IGW"
  }
}

// NAT Gateway
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.public_subnet_az2.id

  tags = {
    Name = "NAT-gw"
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_eip" "lb" {
  domain   = "vpc"
}