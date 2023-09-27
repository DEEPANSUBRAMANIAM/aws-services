
resource "aws_instance" "web" {

  ami                    = var.my_amiid
  instance_type          = var.my_ins_type
  key_name               = var.my_key_name
  security_groups        = [aws_security_group.my-sg-name.id]
  subnet_id              = aws_subnet.my_subnet-02.id
  count = 1

   tags = {
    Name = "linux-web"
  }
}
resource "aws_instance" "web1" {

  ami                    = var.my_amiid
  instance_type          = var.my_ins_type
  key_name               = var.my_key_name
  security_groups        = [aws_security_group.my-sg-name.id]
  subnet_id              = aws_subnet.my_subnet-01.id
  count                  = 1

  tags = {
    Name = "linux-web"
  }
}
