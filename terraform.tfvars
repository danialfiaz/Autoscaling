vpc = {
    cidr_vpc_block = "10.0.0.0/16"
    public         = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    private        = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

launchtemplate = {
    name              = "ec2_launchtemplate"
    image_id          = "ami-08e4e35cccc6189f4"
    instance_behavior = "terminate"
    instance_type     = "t2.micro"
    key_name          = "danial"
    ip_address        = true
    instplace         = "us-east-1a"
    tenancytype       = "default"
    autoscalingSGname = "autoscaling_SG"
}

autoscaling = {
    name             = "app_autoscaling_group"
    desired_capacity = 2
    max_size         = 3
    min_size         = 2
    template_version = "$Latest"
}

alb = {
    name                = "autoscaling-lb"
    redirect            = false
    type                = "application"
    target_name         = "autoscaling-TG"
    port                = 3000
    protol              = "HTTP"
    target_type         = "instance"
    healthy_threshold   = 4
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 20
    check_protocol      = "HTTP"
    path                = "/"
}