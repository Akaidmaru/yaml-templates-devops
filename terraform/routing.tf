#! Create Private route table (Private Subnet 1 and Private Subnet 2)
resource "aws_route_table" "private-rtb" {
  vpc_id = aws_vpc.vpc-sala5.id

  tags = {
    Name = "Private RTB"
  }
}

#* Public Route table (Public Subnet 1 and Subnet 2)
resource "aws_route_table" "public-rtb" {
  vpc_id = aws_vpc.vpc-sala5.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public-igw.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.public-igw.id
  }

  tags = {
    Name = "Public RTB"
  }
}

#! Associate route table with private subnet 1
resource "aws_route_table_association" "private-rtb-assoc-1" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private-rtb.id
}

#! Associate route table with private subnet 2
resource "aws_route_table_association" "private-rtb-assoc-2" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.private-rtb.id
}

#* Associate route table with public subnet
resource "aws_route_table_association" "public-rtb-assoc-1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-rtb.id
}

#* Associate route table with public subnet
resource "aws_route_table_association" "public-rtb-assoc-2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public-rtb.id
}
