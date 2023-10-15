output "terra-alb" {
  value = aws_alb.terra-alb.dns_name
}
output "alb-arn" {
  value = aws_alb_target_group.TG3.arn
}

