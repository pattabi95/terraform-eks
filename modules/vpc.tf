provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

module "vpc" {
    source  = "terraform-aws-modules/vpc/aws"
    version = "6.0.1"

    name = var.name
    cidr = var.cidr
    public_subnets = var.public_subnet_cidrs
    private_subnets = var.private_subnet_cidrs
    azs = slice(data.aws_availability_zones.available.names, 0, 2) 

    enable_nat_gateway = true
    single_nat_gateway = true
    enable_dns_hostnames = true
    enable_dns_support = true

  }
