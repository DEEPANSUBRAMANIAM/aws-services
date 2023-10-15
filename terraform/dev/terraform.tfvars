
#EC2
machine_id     = "ami-0bb4c991fa89d4b9b"
machine_type   = "t2.micro"
machine_key    = "docker"
instance-count = 1
####################################################
#VPC
aws_region            = "us-east-1"
vpc_cider             = "12.1.0.0/20"
public_subnets_cider  = ["12.1.0.0/23", "12.1.2.0/23", "12.1.4.0/23"]
private_subnets_cider = ["12.1.10.0/23", "12.1.12.0/23", "12.1.14.0/23"]
AZS-Public            = ["us-east-1a", "us-east-1b", "us-east-1c"]
AZS-Private           = ["us-east-1a", "us-east-1b", "us-east-1c"]
tgn-vpc               = "dev-test-vpc"
env                   = "Development"
tgn-vpc-igw           = "Dev-igw"
tgn-public-RT         = "Dev-public-RT"
tgn-private-RT        = "Dev-private-RT"
#####################################################
#SECURITY-GROUP
sgname = "test-dev"
cider  = "0.0.0.0/0"
tgn-sg = "Dev-sg"
#####################################################
#EBS-STORAGE
/*kms_key                = "arn:aws:kms:us-east-1:570365194371:key/10760e1a-a6e6-4469-be2d-3c7ff12c5580"*/
ebs-volume  = 2
device_name = "/dev/sdg"
size        = 2
volume_type = "gp3"
#####################################################
#ELB
elb-name = "terra-elb"
#####################################################
#ALB
target-type = "instance"

#####################################################
#ASG
image-id = "ami-04c9edb422cfd19ae"
instance-type = "t2.small"
key-name = "docker"
#####################################################