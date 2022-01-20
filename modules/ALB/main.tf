resource "aws_lb" "alb" {
  name               = "${terraform.workspace}-${var.name}"
  internal           = var.redirect
  load_balancer_type = var.type
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.public_subnet
}
resource "aws_lb_target_group" "alb-tg" {
  name        = "${terraform.workspace}-${var.target_name}"
  port        = var.port
  protocol    = var.protol
  target_type = var.target_type
  vpc_id      = var.vpc_id

  health_check {
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.timeout
    interval            = var.interval
    protocol            = var.check_protocol
    path                = var.path
    matcher             = "200"
  }
}
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 3000
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-tg.arn
  }
}

resource "aws_security_group" "alb_sg" {
 name         = "${terraform.workspace}-alb_sg"
  description = "For internet traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "incoming for instance"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "For App"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "${terraform.workspace}-alb_sg"
  }
}