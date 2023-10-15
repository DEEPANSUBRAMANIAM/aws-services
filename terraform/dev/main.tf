
module "aws_vpc" {
  source                = "../module/vpc"
  aws_region            = var.aws_region
  vpc_cider             = var.vpc_cider
  public_subnets_cider  = var.public_subnets_cider
  private_subnets_cider = var.private_subnets_cider
  AZS-Public            = var.AZS-Public
  AZS-Private           = var.AZS-Private
  tgn-vpc               = var.tgn-vpc
  tgn-vpc-igw           = var.tgn-vpc-igw
  tgn-public-RT         = var.tgn-public-RT
  tgn-private-RT        = var.tgn-private-RT
  env                   = var.env
  cider                 = var.cider
  instance-public-ip = module.aws_ec2.instance-public-ip
  instance-test1 = module.aws_ec2.instance-test1
}
module "vpc_sg" {
  source = "../module/security_group"
  vpc_id = module.aws_vpc.vpc_id
  cider  = var.cider
  sgname = var.sgname
  tgn-sg = var.tgn-sg
  env    = var.env
}
module "aws_ec2" {
  source          = "../module/ec2"
  machine_id      = var.machine_id
  machine_type    = var.machine_type
  machine_key     = var.machine_key
  security_groups = module.vpc_sg.sg_id
  instance-count  = var.instance-count
  env             = var.env
  pub-subnets = module.aws_vpc.pub-subnets
  private-subnets = module.aws_vpc.private-subnets
}

/*
module "aws-ebs" {
  source = "../module/ebs"
  */
/*  kms_key = var.kms_key*//*

  size         = var.size
  ebs-volume   = var.ebs-volume
  instance-AZS = module.aws_ec2.instance-AZS
  volume_type  = var.volume_type
  device_name  = var.device_name
  instance_id  = module.aws_ec2.instance_id
  volume-id    = module.aws-ebs.volume-id
}
*/

/*module "aws_ebs_attach" {
  source      = "../module/ebs_attach"
  device_name = var.device_name
  instance_id = module.aws_ec2.instance_id
  volume-id   = module.aws-ebs.volume-id
}*/
/*module "aws_elb" {
  source          = "../module/elb"
  elb-name        = "terra-elb"
  elb-instances   = module.aws_ec2.instance_id
  pub_subnets     = module.aws_vpc.pub-subnets
  env             = var.env
  security_groups = module.vpc_sg.sg_id
}*/
/*
module "aws-alb" {
  source = "../module/alb"
  vpc-id = module.aws_vpc.vpc_id
  target-type = var.target-type
  security-groups = module.vpc_sg.sg_id
  terra-alb = "terra-alb"
  instance-test = module.aws_ec2.instance-test
  instance-videos = module.aws_ec2.instance-videos
  instance-images = module.aws_ec2.instance-images
  pub-subnets = module.aws_vpc.pub-subnets
}

module "aws-asg" {
  source = "../module/autoscaling"
  asg-subnets1 = module.aws_vpc.asg-subnets1
  asg-subnets2 = module.aws_vpc.asg-subnets2
  image-id = var.image-id
  instance-type = var.instance-type
  alb-arn = module.aws-alb.alb-arn
  sgname = module.vpc_sg.sg_id
  key-name = var.key-name
}
*/
