data "aws_availability_zones" "azs" {}
module "VPC_module" {
  source            = "./modules/vpc"
  cidr_vpc_block    = var.vpc.cidr_vpc_block
  public            = var.vpc.public
  availability_zone = data.aws_availability_zones.azs.names
  private           = var.vpc.private
  
}
module "launchtemplate" {
  source               = "./modules/launchtemplate"
  subnet_id            = module.VPC_module.private_subnets_ids
  vpc_id               = module.VPC_module.vpc_id
  name                 = var.launchtemplate.name
  image_id             = var.launchtemplate.image_id
  instance_behavior    = var.launchtemplate.instance_behavior
  instance_type        = var.launchtemplate.instance_type
  key_name             = var.launchtemplate.key_name
  ip_address           = var.launchtemplate.ip_address
  instplace            = var.launchtemplate.instplace
  tenancytype          = var.launchtemplate.tenancytype
  autoscalingSGname    = var.launchtemplate.autoscalingSGname
}

module "autoscaling" {
  source               = "./modules/autoscaling"
  subnet_id            = module.VPC_module.private_subnets_ids
  #zones                = data.aws_availability_zones.azs.names
  launch_template      = module.launchtemplate.launch_template
  target_group_arn     = module.alb.target_group_arn
  name                 = var.autoscaling.name
  desired_capacity     = var.autoscaling.desired_capacity
  max_size             = var.autoscaling.max_size
  min_size             = var.autoscaling.min_size
  template_version     = var.autoscaling.template_version
}

module "alb" {
  source = "./modules/ALB"
  vpc_id               = module.VPC_module.vpc_id
  public_subnet        = module.VPC_module.public_subnets_ids
  name                 = var.alb.name
  redirect             = var.alb.redirect
  type                 = var.alb.type
  target_name          = var.alb.target_name
  port                 = var.alb.port
  protol               = var.alb.protol
  target_type          = var.alb.target_type
  healthy_threshold    = var.alb.healthy_threshold
  unhealthy_threshold  = var.alb.unhealthy_threshold
  timeout              = var.alb.timeout
  interval             = var.alb.interval
  check_protocol       = var.alb.check_protocol
  path                 = var.alb.path
}