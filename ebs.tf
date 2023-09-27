/*resource "aws_ebs_default_kms_key" "ebs-kms" {
  key_arn = "arn:aws:kms:us-east-1:570365194371:key/10760e1a-a6e6-4469-be2d-3c7ff12c5580"
}
resource "aws_ebs_volume" "ebs_volume" {
  availability_zone        = var.my_availability_zones
  size           		   = var.size
  encrypted                = "true"
 kms_key_id = aws_ebs_default_kms_key.ebs-kms.id
  tags = {
    Name = "ebs_volume1"
  }
}

resource "aws_volume_attachment" "ebs-attach" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.web.id
}
*/
