/*resource "aws_route53_zone" "my-route" {
  name = "techzonecloud.com"

  tags = {
    Name = "terraform"
  }
}

resource "aws_route53_record" "my-route-record" {
  name    = "www"
  type    = "CNAME"
  zone_id = aws_route53_zone.my-route.zone_id
  ttl     = 300
  records = ["terraform-alb-lb-636183548.us-east-1.elb.amazonaws.com"]

}
*/

/*
resource "aws_elb" "alias" {
  name = "application-alb"
  availability_zones = ["us-east-1a"]

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }
}

resource "aws_route53_record" "my-route-record" {
  name    = "techzonecloud.com"
  type    = "A"
  zone_id = aws_route53_zone.my-route.zone_id


alias {
  evaluate_target_health = false
  name                   = aws_elb.alias.dns_name
  zone_id                = aws_elb.alias.zone_id

}
}


*/
