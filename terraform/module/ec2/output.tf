
output "instance-test" {
  value = aws_instance.test.*.id
}
output "instance-test1" {
  value = aws_instance.test[0].id
}

output "instance-videos" {
  value = aws_instance.videos.*.id
}
output "instance-images" {
  value = aws_instance.image.*.id
}
output "private-instance" {
  value = aws_instance.private.*.id
}
output "instance-public-ip" {
  value = aws_instance.test[0].public_ip
  #Elastic ip Association
}