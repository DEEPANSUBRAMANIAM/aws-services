terraform {
  backend "s3" {
    bucket         = "s3terraforms3"
    key            = "demo/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform_demo"
  }
}
