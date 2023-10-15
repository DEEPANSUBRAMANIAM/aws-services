output "vpc_id" {
  value = aws_vpc.dev-vpc-01.id
}
output "pub-subnets" {
  value = aws_subnet.public.*.id
}
/*output "pri-subnets" {
  value = aws_subnet.public.*.id
}*/
output "asg-subnets1" {
  value = aws_subnet.public[0].id
}
output "asg-subnets2" {
  value = aws_subnet.public[1].id
}
output "private-subnets" {
  value = aws_subnet.private.*.id
}

