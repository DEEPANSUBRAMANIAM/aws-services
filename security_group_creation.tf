#Security-group

resource "aws_security_group" "my-sg-name" {
  description = "ssh,http,https,nfs,"
  vpc_id = aws_vpc.my_vpc.id
  name = "my_sg_terraform"

  ingress {
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {

    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {

    protocol = "tcp"
    from_port = 433
    to_port = 433
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {

    protocol = "tcp"
    from_port = 2049
    to_port = 2049
    cidr_blocks = ["0.0.0.0/0"]
  }
/*  ingress {
    protocol = "ICMP"
    from_port = "All"
    to_port = All
    cidr_blocks = ["0.0.0.0/0"]
  }*/
  ingress {
    protocol = "tcp"
    from_port = 3306
    to_port = 3306
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "my_sg_terraform"
  }
}
