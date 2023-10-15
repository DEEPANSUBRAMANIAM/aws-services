resource "aws_security_group" "dev-sg" {
  vpc_id      = var.vpc_id
  name        = var.sgname
  description = "Allow SSH HTTP HTTPS NFS"
  ingress {
    description = "SSH"
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = [var.cider]
  }
  ingress {
    description = "HTTP"
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = [var.cider]
  }
  ingress {
    description = "HTTPS"
    protocol    = "tcp"
    from_port   = 433
    to_port     = 433
    cidr_blocks = [var.cider]
  }
  ingress {
    description = "NFS"
    protocol    = "tcp"
    from_port   = 2049
    to_port     = 2049
    cidr_blocks = [var.cider]
  }
  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = [var.cider]
  }
  tags = {
    Name = var.tgn-sg
    Env  = var.env
  }
}