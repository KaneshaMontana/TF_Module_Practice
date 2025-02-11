terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.70.0"
    }
  }
  backend "s3" {
    bucket = "ke-s3-bucket-in-aws"
    key    = "state/virtual_city.tfstate"
    region = "eu-west-2"
  }

}

provider "aws" {
  region = "eu-west-2"
}


module "vpc" {
  source   = "./vpc"
  vpc_name = "my-vpc-777"

  vpc_cidr             = "192.0.0.0/24"
  public_subnet_cidrs  = ["192.0.0.0/26", "192.0.0.64/26"]
  private_subnet_cidrs = ["192.0.0.128/26", "192.0.0.192/26"]
  common_tags          = local.my_resource_tags
}

