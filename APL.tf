resource "aws_lb_target_group" "tasktg" {
  name = "tasktg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.VPC_Task2.id

    health_check {
    healthy_threshold   = 2
    interval            = 30
    protocol            = "HTTP"
    unhealthy_threshold = 2

  }
   tags = {
    Project     = "VPC_Task"
    Environment = "Test "
    Team        = "DevOps"
    Created_by  = "Maryana_Kondrasevych"
   }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.taskalb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tasktg.arn
  }
}


resource "aws_lb" "taskalb" {
  name               = "taskalb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ssh_sg.id]
  subnets            = [aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet3.id]

  enable_deletion_protection = false

  tags = {
    Project     = "VPC_Task"
    Environment = "Test"
    Team        = "DevOps"
    Created_by  = "Maryana_Kondrasevych"
    Name        = "alb"
  }
}
