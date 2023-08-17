// AZ1
resource "aws_instance" "bastion_host" {
    ami                 = "ami-091a58610910a87a9"
    instance_type       = "t2.micro"
    availability_zone   = "ap-southeast-1a"
    subnet_id           = aws_subnet.public_subnet_az1.id
    security_groups     = [aws_security_group.public_sg.id]

    tags = {
        Name = "Bastion-Host"
    }
}

resource "aws_instance" "frontend_server_az1" {
    ami                 = "ami-091a58610910a87a9"
    instance_type       = "t3.micro"
    availability_zone   = "ap-southeast-1a"
    subnet_id           = aws_subnet.private_subnet1_az1.id
    security_groups     = [aws_security_group.private_sg.id] 

    tags = {
        Name = "Frontend-Server-AZ1"
    }
}

resource "aws_instance" "backend_server_az1" {
    ami                 = "ami-091a58610910a87a9"
    instance_type       = "t3.micro"
    availability_zone   = "ap-southeast-1a"
    subnet_id           = aws_subnet.private_subnet2_az1.id
    security_groups     = [aws_security_group.private_sg.id] 

    tags = {
        Name = "Backend-Server-AZ1"
    }
}

// AZ2
resource "aws_instance" "frontend_server_az2" {
    ami                 = "ami-091a58610910a87a9"
    instance_type       = "t3.micro"
    availability_zone   = "ap-southeast-1b"
    subnet_id           = aws_subnet.private_subnet1_az2.id
    security_groups     = [aws_security_group.private_sg.id] 

    tags = {
        Name = "Frontend-Server-AZ2"
    }
}

resource "aws_instance" "backend_server_az2" {
    ami                 = "ami-091a58610910a87a9"
    instance_type       = "t3.micro"
    availability_zone   = "ap-southeast-1b"
    subnet_id           = aws_subnet.private_subnet2_az2.id
    security_groups     = [aws_security_group.private_sg.id] 

    tags = {
        Name = "Backend-Server-AZ2"
    }
}