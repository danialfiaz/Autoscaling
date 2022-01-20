output "alb_arn" {
  value = aws_lb.alb.arn
}
output "alb_sg" {
  value = aws_security_group.alb_sg.id
}

output "alb_dns" {
  value = aws_lb.alb.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.alb-tg.arn
}