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
    aws_route_table_association.public-rtb-assoc-1
  ]
  tags = {
    Name = "Public EC2 Instance 1"
  }
}

#? Public EC2 Instance 2
resource "aws_instance" "terraform-ec2-2" {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public-subnet-2.id
  availability_zone = "us-east-1b"
  vpc_security_group_ids = [aws_security_group.sala5-sg.id]
  associate_public_ip_address = true
  key_name = var.key_pair_name

  depends_on = [
    aws_subnet.public-subnet-2,
    aws_security_group.sala5-sg,
    aws_route_table_association.public-rtb-assoc-2
  ]
  tags = {
    Name = "Public EC2 Instance 2"
  }
}
