variable "vpc"{
  type = object({
    cidr_vpc_block    = string
    public            = list(string)
    private           = list(string)
        })
}

variable "launchtemplate" {
  type = object({
    name              = string
    image_id          = string
    instance_behavior = string
    instance_type     = string
    key_name          = string
    ip_address        = bool
    instplace         = string
    tenancytype       = string
    autoscalingSGname = string
  })
}

variable "autoscaling" {
  type=object({
    name             = string
    desired_capacity = number
    max_size         = number
    min_size         = number
    template_version = string
  })
}

variable "alb" {
  type = object({
    name                = string
    redirect            = bool
    type                = string
    target_name         = string
    port                = number
    protol              = string
    target_type         = string
    healthy_threshold   = number
    unhealthy_threshold = number
    timeout             = number
    interval            = number
    check_protocol      = string
    path                = string
  })
  
}