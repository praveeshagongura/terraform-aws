resource "aws_lb" "app_lb" {
  name               = "simple-app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.lb_sg_id]
  subnets            = var.public_subnet_ids
}

resource "aws_lb_target_group" "app_targets" {
  name     = "app-targets"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
  }
}

resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_targets.arn
  }
}

resource "aws_lb_target_group_attachment" "app_target_attachment" {
  target_group_arn = aws_lb_target_group.app_targets.arn
  target_id        = var.ec2_instance_id
  port             = 80
}
