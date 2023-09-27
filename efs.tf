/*
resource "aws_efs_file_system" "my-efs" {
  creation_token = "my-efs-terraform"
  kms_key_id = aws_ebs_default_kms_key.ebs-kms.key_arn
  encrypted = "true"
  tags = {
    Name = "efs-terraform"
  }
}


resource "aws_efs_mount_target" "efs-1a" {

  file_system_id = aws_efs_file_system.my-efs.id
  subnet_id      = aws_subnet.my_subnet-01.id
  security_groups = [aws_security_group.my-sg-name.id]


}
resource "aws_efs_mount_target" "efs-1b" {
  file_system_id = aws_efs_file_system.my-efs.id
  subnet_id      = aws_subnet.my_subnet-02.id
  security_groups = [aws_security_group.my-sg-name.id]

resource "aws_efs_access_point" "efs-access" {
  file_system_id = aws_efs_file_system.my-efs.id

}*/





