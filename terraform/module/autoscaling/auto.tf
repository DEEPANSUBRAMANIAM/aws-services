
resource "aws_launch_template" "temp-01" {
  name_prefix = "auto-ami"
  image_id = var.image-id #ami-0bb4c991fa89d4b9b
  instance_type = var.instance-type
  vpc_security_group_ids = [var.sgname]
  key_name = var.key-name
}
resource "aws_autoscaling_group" "auto-terra" {
  name = "auto-terra"
  vpc_zone_identifier       = [var.asg-subnets1,var.asg-subnets2]
  max_size                  = 4
  min_size                  = 2
  desired_capacity          = 2
  health_check_grace_period = 200

  launch_template {
    id      = aws_launch_template.temp-01.id
    version = "$Latest"
  }
}
resource "aws_autoscaling_policy" "asg-policy" {
  autoscaling_group_name = aws_autoscaling_group.auto-terra.name
  name                   = "asg-policy"
  policy_type            = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 5
  }
}
resource "aws_autoscaling_attachment" "auto-att" {
  autoscaling_group_name = aws_autoscaling_group.auto-terra.id
  lb_target_group_arn    = var.alb-arn
}

