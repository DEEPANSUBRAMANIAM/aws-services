
output "volume-id" {
  value = aws_ebs_volume.ebs_volume.*.id
}
output "instance_id" {
  value = aws_volume_attachment.ebs-attach.*.instance_id
}
output "volume_id" {
  value = aws_volume_attachment.ebs-attach.*.volume_id
}

/*
output "volume_type" {
  value = aws_ebs_volume.ebs_volume.volume_type
}
output "volume_size" {
  value = aws_ebs_volume.ebs_volume.size
}
output "volume_AZS" {
  value = aws_ebs_volume.ebs_volume.availability_zone
}
output "encrypted" {
  value = aws_ebs_volume.ebs_volume.encrypted
}*/
