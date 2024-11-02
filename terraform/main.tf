#? Create a VPC
resource "aws_vpc" "vpc-sala5" {
  cidr_block                       = "10.0.0.0/16"
  assign_generated_ipv6_cidr_block = true
  tags = {
      Name = "VPC Sala 5"
  }
}

# ***** Private Subnet 1 *****

#! Create Private Subnet 1
resource "aws_subnet" "private-subnet-1" {
  vpc_id            = aws_vpc.vpc-sala5.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Private-Subnet-1"
  }
}


#! Create Private route table (Private Subnet 1 and Private Subnet 2)
resource "aws_route_table" "private-rtb" {
  vpc_id = aws_vpc.vpc-sala5.id

  tags = {
    Name = "Private RTB"
  }
}

#! Associate route table with private subnet
resource "aws_route_table_association" "private-rtb-assoc" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private-rtb.id
}


# **** Subnet 1 - Red pública ****

#* Create Public Subnet 1
resource "aws_subnet" "public-subnet-1" {
  vpc_id            = aws_vpc.vpc-sala5.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"
  
  tags = {
    Name = "Public-Subnet-1"
  }
}

#* Create Internet Gateway (Public Subnet 1 and Subnet 2)
resource "aws_internet_gateway" "public-igw" {
  vpc_id = aws_vpc.vpc-sala5.id

  tags = {
    Name = "Public IGW"
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
    ipv6_cidr_block        = "::/0"
    gateway_id = aws_internet_gateway.public-igw.id
  }

  tags = {
    Name = "Public RTB"
  }
}

#* Associate route table with public subnet
resource "aws_route_table_association" "public-rtb-assoc" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-rtb.id
}

#*  Security Group
resource "aws_security_group" "sala5-sg" {
  name        = "SSH"
  description = "Allow ssh inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc-sala5.id

  tags = {
    Name = "allow_ssh_http_https"
  }
}

#* Security Group rules for ssh ipv4 and ipv6
resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.sala5-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv6" {
  security_group_id = aws_security_group.sala5-sg.id
  cidr_ipv6         = "::/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

#* Security Group rules for http ipv4 and ipv6
resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.sala5-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv6" {
  security_group_id = aws_security_group.sala5-sg.id
  cidr_ipv6         = "::/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

#* Security Group rules for https ipv4 and ipv6
resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv4" {
  security_group_id = aws_security_group.sala5-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv6" {
  security_group_id = aws_security_group.sala5-sg.id
  cidr_ipv6         = "::/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


#* Security Group eggress rules for ssh ipv4 and ipv6
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.sala5-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
  security_group_id = aws_security_group.sala5-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1"
}

# ***** EC2 Instances *****
#? Public EC2 Instance 1
resource "aws_instance" "terraform-ec2-1" {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public-subnet-1.id
  availability_zone = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.sala5-sg.id]
  associate_public_ip_address = true
  key_name = var.key_pair_name

  depends_on = [
    aws_subnet.public-subnet-1,
    aws_security_group.sala5-sg,
    aws_route_table_association.public-rtb-assoc
  ]
  tags = {
    Name = "Public EC2 Instance 1"
  }
}
