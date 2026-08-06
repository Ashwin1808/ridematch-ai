output "alb_dns_name" {
  value = aws_lb.ridematch_alb.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.backend_tg.arn
}
