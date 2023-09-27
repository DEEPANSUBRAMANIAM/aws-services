/*

resource "aws_kms_key" "my-kms" {
  description = "my-kms-1"
  deletion_window_in_days = 7
  enable_key_rotation = "true"


tags = {
  Name = "terra-kms"
  Aliases = "terraform"
}
}
*/
