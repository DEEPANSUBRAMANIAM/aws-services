/*resource "aws_ebs_default_kms_key" "ebs-kms" {
  key_arn = "arn:aws:kms:us-east-1:570365194371:key/10760e1a-a6e6-4469-be2d-3c7ff12c5580"
}*/

resource "aws_ebs_volume" "ebs_volume" {
  count = var.ebs-volume
  availability_zone        = element(var.instance-AZS,count.index)
  size           		   = var.size
  encrypted                = "true"
  type = var.volume_type
/* kms_key_id = aws_ebs_default_kms_key.ebs-kms.id*/
  tags = {
    Name = "ebs_volume1"
  }
}

resource "aws_volume_attachment" "ebs-attach" {
  device_name = var.device_name
  count = length(aws_ebs_volume.ebs_volume.*.id)
  volume_id   = element(var.volume-id,count.index )#aws_ebs_volume.ebs_volume.id
 #instance_id = var.instance_id
  instance_id = element(var.instance_id,count.index)
}
































/*resource "aws_ebs_default_kms_key" "ebs-kms" {
  key_arn = var.kms_key

}
resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = var.ebs_availability_zones
  size              = var.size
  encrypted         = "true"
  kms_key_id = var.kms_key
                                                                              *//*kms_key_id        = aws_ebs_default_kms_key.ebs-kms.id*//*
  tags = {
    Name = var.tgn-ebs
    Env  = var.env
  }
}

resource "aws_volume_attachment" "ebs-attach" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.ebs_volume.id
  count = length(var.ebs_availability_zones)
  instance_id = element(aws_ebs_volume.ebs_volume.*.id,count.index)
}
*//*
"arn:aws:kms:us-east-1:570365194371:key/10760e1a-a6e6-4469-be2d-3c7ff12c5580"*//*
*/