#! Create Private Subnet 1
resource "aws_subnet" "private-subnet-1" {
  vpc_id            = aws_vpc.vpc-sala5.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Private-Subnet-1"
  }
}

#! Create Private Subnet 2
resource "aws_subnet" "private-subnet-2" {
  vpc_id            = aws_vpc.vpc-sala5.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Private-Subnet-1"
  }
}

#* Create Public Subnet 1
resource "aws_subnet" "public-subnet-1" {
  vpc_id            = aws_vpc.vpc-sala5.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  
  tags = {
    Name = "Public-Subnet-1"
  }
}

#* Create Public Subnet 2
resource "aws_subnet" "public-subnet-2" {
  vpc_id            = aws_vpc.vpc-sala5.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  
  tags = {
    Name = "Public-Subnet-2"
  }
}