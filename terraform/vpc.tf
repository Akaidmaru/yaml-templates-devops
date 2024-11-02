#? Create a VPC
resource "aws_vpc" "vpc-sala5" {
  cidr_block                       = "10.0.0.0/16"
  assign_generated_ipv6_cidr_block = true
  tags = {
      Name = "VPC Sala 5"
  }
}

#* Create Internet Gateway (Public Subnet 1 and Subnet 2)
resource "aws_internet_gateway" "public-igw" {
  vpc_id = aws_vpc.vpc-sala5.id

  tags = {
    Name = "Public IGW"
  }
}
