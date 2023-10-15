output "health-check" {
  value = aws_autoscaling_policy.asg-policy.target_tracking_configuration.predefined_metric_specification.predefined_metric_type
}
output "cpu-value" {
  value = aws_autoscaling_policy.asg-policy.target_tracking_configuration.target_value
}
