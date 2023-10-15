resource "aws_alb_target_group" "TG1" {
  vpc_id = var.vpc-id
  target_type = var.target-type

  protocol = "HTTP"
  port = 80
  protocol_version = "HTTP1"
  health_check {
    protocol = "HTTP"
    port = 80
    path = "/index.html"
    healthy_threshold = 5
    unhealthy_threshold = 2
    timeout = 5
    interval = 30
  }
  tags = {
    Name = "TG1"
  }
}
resource "aws_alb_target_group" "TG2" {
  vpc_id = var.vpc-id
  target_type = var.target-type

  protocol = "HTTP"
  port = 80
  protocol_version = "HTTP1"
  health_check {
    protocol = "HTTP"
    port = 80
    path = "/videos/index.html"
    healthy_threshold = 5
    unhealthy_threshold = 2
    timeout = 5
    interval = 30
  }
  tags = {
    Name = "TG2"
  }
}

resource "aws_alb_target_group" "TG3" {
  vpc_id = var.vpc-id
  target_type = var.target-type

  protocol = "HTTP"
  port = 80
  protocol_version = "HTTP1"
  health_check {
    protocol = "HTTP"
    port = 80
    path = "/images/index.html"
    healthy_threshold = 5
    unhealthy_threshold = 2
    timeout = 5
    interval = 30
  }
  tags = {
    Name = "TG3"
  }
}
resource "aws_alb_target_group_attachment" "TGA1" {
  count = length(var.instance-test)
  target_group_arn = aws_alb_target_group.TG1.arn
  target_id        = element(var.instance-test,count.index )

}

resource "aws_alb_target_group_attachment" "TGA2" {
  count = length(var.instance-videos)
  target_group_arn = aws_alb_target_group.TG2.arn
  target_id        = element(var.instance-videos,count.index)

}

resource "aws_alb_target_group_attachment" "TGA3" {
  count = length(var.instance-images)
  target_group_arn = aws_alb_target_group.TG3.arn
  target_id        = element(var.instance-images,count.index )

}


resource "aws_alb" "terra-alb" {
  name = var.terra-alb
 /* vpc-id = var.vpc-id*/
  subnets = var.pub-subnets
  security_groups = [var.security-groups]
}
resource "aws_alb_listener" "listener-alb" {
  load_balancer_arn = aws_alb.terra-alb.arn
  protocol = "HTTP"
  port = 80
  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.TG1.arn
  }
}
resource "aws_alb_listener_rule" "rule-TG1" {
 /* load_balancer_arn = var.lb-arn*/
  listener_arn      = aws_alb_listener.listener-alb.arn
  priority = 200
  action {
    type = "forward"
    target_group_arn = aws_alb_target_group.TG2.arn
  }
  condition {
    path_pattern {
      values = ["/videos/index.html"]
    }
  }
}
resource "aws_alb_listener_rule" "rule-TG2" {

  listener_arn = aws_alb_listener.listener-alb.arn
  priority = 300
  action {
    type = "forward"
    target_group_arn = aws_alb_target_group.TG3.arn
  }
  condition {
    path_pattern {
      values = ["/images/index.html"]
    }
  }
}