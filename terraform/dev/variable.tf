###########################################
#EC2
###########################################
variable "machine_id" {
  type = string

}
variable "machine_type" {
  type = string
}
variable "machine_key" {
  type = string
}
variable "instance-count" {
  type = number
}

###################################################
#VPC
###################################################
variable "aws_region" {
  type = string
}
variable "vpc_cider" {
  type = string
}
variable "public_subnets_cider" {
  type = list(any)
}
variable "private_subnets_cider" {
  type = list(any)
}
variable "AZS-Public" {
  type = list(any)
}
variable "AZS-Private" {
  type = list(any)
}
variable "tgn-vpc" {
  type = string
}
variable "env" {
  type = string
}
variable "tgn-vpc-igw" {
  type = string
}
variable "tgn-public-RT" {
  type = string
}
variable "tgn-private-RT" {
  type = string
}


##############################################################
#SG
##############################################################
variable "cider" {
  type = string
}
variable "sgname" {
  sensitive = true
  type      = string
}
variable "tgn-sg" {
  type = string
}
############################################################
#EBS
############################################################

variable "device_name" {
  type = string
}
variable "ebs-volume" {
  type = number
}
variable "size" {
  type = number
}
variable "volume_type" {
  type = string
}
/*variable "kms_key" {
  type = string
}*/



############################################################
#ELB
############################################################
variable "elb-name" {
  type = string
}
###########################################################
#ALB
###########################################################

variable "target-type" {
  type = string
}

##########################################################
#ASG
##########################################################
variable "image-id" {
  type = string
}
variable "instance-type" {}
variable "key-name" {}