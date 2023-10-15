#PUBLIC-INSTANCE
resource "aws_instance" "test" {
  ami             = var.machine_id
  instance_type   = var.machine_type
  key_name        = var.machine_key
  count           = var.instance-count
  subnet_id       = element(var.pub-subnets,count.index)
  vpc_security_group_ids = [var.security_groups]
  user_data       = file("install_httpd.sh")
  associate_public_ip_address = true


  tags = {
    Name = "DEV-test-${count.index+1}"
    Env  = var.env
  }
}

resource "aws_instance" "videos" {
  ami                    = var.machine_id
  instance_type          = var.machine_type
  key_name               = var.machine_key
  count                  = var.instance-count
  subnet_id              = element(var.pub-subnets, count.index)
  vpc_security_group_ids = [var.security_groups]
  user_data              = file("videos.sh")

  tags = {
    Name = "DEV-videos-${count.index+1}"
    Env  = var.env
  }
}



resource "aws_instance" "image" {
  ami                    = var.machine_id
  instance_type          = var.machine_type
  key_name               = var.machine_key
  count                  = var.instance-count
  subnet_id              = element(var.pub-subnets, count.index)
  vpc_security_group_ids = [var.security_groups]
  user_data              = file("images.sh")

  tags = {
    Name = "DEV-images-${count.index+1}"
    Env  = var.env
  }
}
#PRIVATE-INSTANCE
resource "aws_instance" "private" {
  ami                    = var.machine_id
  instance_type          = var.machine_type
  key_name               = var.machine_key
  count                  = var.instance-count
  subnet_id              = element(var.private-subnets, count.index)
  vpc_security_group_ids = [var.security_groups]


  tags = {
    Name = "DB-Private-${count.index+1}"
    Env  = var.env
  }
}