resource "aws_launch_template" "launch" {
  name_prefix   = "servers"
  image_id      = "ami-091a58610910a87a9"
  instance_type = "t3.micro"
}

resource "aws_autoscaling_group" "asg1_frontend" {
  name               = "ASG1-Frontend"
  availability_zones = ["ap-southeast-1a", "ap-southeast-1b"]
  desired_capacity   = 2
  max_size           = 4
  min_size           = 1

  launch_template {
    id      = aws_launch_template.launch.id
    version = "$Latest"
  }
}

resource "aws_autoscaling_group" "asg2_backend" {
  name               = "ASG2-Backend" 
  availability_zones = ["ap-southeast-1a", "ap-southeast-1b"]
  desired_capacity   = 2
  max_size           = 4
  min_size           = 1

  launch_template {
    id      = aws_launch_template.launch.id
    version = "$Latest"
  }
}