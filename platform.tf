terraform {
  required_version = ">= 1.0.11"

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.aws_region
}


module "vpc" {
  source             = "./modules/vpc"
  nlb_acl_cidr_block = var.nlb_acl_cidr_block
  vpc_cidr           = local.vpc_cidr
  datacenter         = var.datacenter
  security_groups    = local.security_groups
}

module "ec2" {
  source        = "./modules/ec2"
  ec2_type      = var.ec2_type
  ami           = var.ami
  datacenter    = var.datacenter
  instance_name = "${var.datacenter}-${var.instance_name}"
  public_sg     = module.vpc.public_sg
  public_subnet = module.vpc.public_subnet_1
}

module "nlb" {
  source     = "./modules/nlb"
  datacenter = var.datacenter
  vpc_id     = module.vpc.vpc_id
  target_id  = module.ec2.ec2_id
  subnets    = [module.vpc.public_subnet_1, module.vpc.public_subnet_2]
}

