// Frontend
resource "aws_lb" "frontend_lb" {
  name               = "Frontend-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.private_sg.id]   
  subnets = [                           
    aws_subnet.private_subnet1_az1.id,
    aws_subnet.private_subnet1_az2.id
  ]

  enable_deletion_protection = false

  access_logs {
    bucket  = "final-project-bucket1"
    prefix  = "logs-lb"
  }
}

resource "aws_lb_target_group" "frontend_lb_tg" {  
  name        = "Frontend-lb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
}

resource "aws_lb_target_group_attachment" "frontend_tga1" {
  target_group_arn = aws_lb_target_group.frontend_lb_tg.arn
  target_id        = aws_instance.frontend_server_az1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "frontend_tga2" {
  target_group_arn = aws_lb_target_group.frontend_lb_tg.arn
  target_id        = aws_instance.frontend_server_az2.id
  port             = 80
}

resource "aws_lb_listener" "frontend_lb_listener" {
  load_balancer_arn = aws_lb.frontend_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.frontend_lb_tg.arn
  }
}

// Backend
resource "aws_lb" "backend_lb" {    
  name               = "Backend-lb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.private_sg.id]   
  subnets = [                           
    aws_subnet.private_subnet2_az1.id,
    aws_subnet.private_subnet2_az2.id
  ]

  enable_deletion_protection = false

  access_logs {
    bucket  = "final-project-bucket1"
    prefix  = "logs-lb"
  }
}

resource "aws_lb_target_group" "backend_lb_tg" {  
  name     = "Backend-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_lb_target_group_attachment" "backend_tga1" {
  target_group_arn = aws_lb_target_group.backend_lb_tg.arn
  target_id        = aws_instance.backend_server_az1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "backend_tga2" {
  target_group_arn = aws_lb_target_group.backend_lb_tg.arn
  target_id        = aws_instance.backend_server_az2.id
  port             = 80
}

resource "aws_lb_listener" "backend_lb_listener" {
  load_balancer_arn = aws_lb.backend_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend_lb_tg.arn
  }
}