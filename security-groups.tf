// Public SG
resource "aws_security_group" "public_sg" {
  name        = "Public-SG"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "Inbound traffic from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

// Private SG
resource "aws_security_group" "private_sg" {
  name        = "Private-SG"
  description = "Allow inbound traffic from bastion host"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "Inbound traffic from bastion host"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = [aws_security_group.public_sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}