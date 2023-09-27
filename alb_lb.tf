
/*
resource "aws_alb_target_group" "my-tg1" {
  target_type = "instance"
  vpc_id = aws_vpc.my_vpc.id
  protocol = "HTTP"
  port = 80
  protocol_version = "HTTP1"
  name = "index"


  health_check {
    path = "/"
    healthy_threshold = 5
    unhealthy_threshold = 2
    timeout = 5
    interval = 30

  }
  tags = {
    Name = "index"
  }
}
resource "aws_alb_target_group" "my-tg2" {
  target_type = "instance"
  vpc_id = aws_vpc.my_vpc.id
  protocol = "HTTP"
  port = 80
  protocol_version = "HTTP1"
  name = "video"


  health_check {
    path = "/"
    healthy_threshold = 5
    unhealthy_threshold = 2
    timeout = 5
    interval = 30
  }
  tags = {
    Name = "video"
  }
}


resource "aws_alb_target_group" "my-tg3" {
  vpc_id = aws_vpc.my_vpc.id
  target_type = "instance"
  protocol = "HTTP"
  port = 80
  protocol_version = "HTTP1"
  name = "image"

  health_check {
    path = "/"
    healthy_threshold = 5
    unhealthy_threshold = 2
    timeout = 5
    interval = 30
  }
  tags = {
    Name = "image"
  }

}
resource "aws_alb_target_group_attachment" "my-tg1-a1" {

  target_group_arn = aws_alb_target_group.my-tg1.arn
  target_id        = aws_instance.web[0].id
  port = 80

}
resource "aws_alb_target_group_attachment" "my-tg1-a11" {
  target_group_arn = aws_alb_target_group.my-tg1.arn
  target_id        = aws_instance.web1[0].id
  port = 80

}
resource "aws_alb_target_group_attachment" "my-tg2-a1" {

  target_group_arn = aws_alb_target_group.my-tg2.arn
  target_id        = aws_instance.web[1].id
  port = 80

}
resource "aws_alb_target_group_attachment" "my-tg2-a11" {

  target_group_arn = aws_alb_target_group.my-tg2.arn
  target_id        = aws_instance.web1[1].id
  port = 80

}

resource "aws_alb_target_group_attachment" "my-tg3-a2" {
  target_group_arn = aws_alb_target_group.my-tg3.arn
  target_id        = aws_instance.web[2].id
  port = 80

}

resource "aws_alb_target_group_attachment" "my-tg3-a22" {
  target_group_arn = aws_alb_target_group.my-tg3.arn
  target_id        = aws_instance.web1[2].id
  port = 80

}

resource "aws_alb" "terra-alb-lb" {
  name = "terraform-alb-lb"
  ip_address_type = "ipv4"
  internal = "false"
  load_balancer_type = "application"
  security_groups = [aws_security_group.my-sg-name.id]
  subnets = [aws_subnet.my_subnet-01.id, aws_subnet.my_subnet-02.id]

}

resource "aws_alb_listener" "my-terra-alb-listener1" {
  load_balancer_arn = aws_alb.terra-alb-lb.arn
  protocol          = "HTTP"
  port              = 80

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.my-tg1.arn

  }
}
resource "aws_alb_listener_rule" "alb-rule" {
  listener_arn = aws_alb_listener.my-terra-alb-listener1.arn
  priority = 500
  action {
    type = "forward"
    target_group_arn = aws_alb_target_group.my-tg2.arn

      }
  condition {
    path_pattern {
      values = ["/videos/index.html"]
    }
  }
}

resource "aws_alb_listener_rule" "alb-rule2" {
  listener_arn = aws_alb_listener.my-terra-alb-listener1.arn
  priority = 1000

  action {
    type = "forward"
    target_group_arn = aws_alb_target_group.my-tg3.arn

  }
  condition {
    path_pattern {
      values = ["/image/index.html"]
    }
  }
}
*/
