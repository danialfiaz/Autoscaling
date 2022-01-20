resource "aws_autoscaling_group" "app_autoscaling_group" {
  name               = "${terraform.workspace}-${var.name}"
  vpc_zone_identifier  = [var.subnet_id[0],var.subnet_id[1],var.subnet_id[2]]
  #availability_zones =  var.zones
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size
  target_group_arns  = [var.target_group_arn]
  launch_template {
    id      = var.launch_template
    version = var.template_version
  }
}