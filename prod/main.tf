provider "aws" {
  region = "ap-south-1"
}
module "ww_vpc" {
  source      = "../modules/vpc"
  vpc_cidr    = "193.167.0.0/16"
  tenancy     = "default"
  vpc_id      = "${module.ww_vpc.vpc_id}"
  subnet_cidr = "193.167.1.0/24"
}

module "my_ec2" {
  source        = "../modules/ec2"
  ec2_count     = 1
  ami_id        = "ami-02913db388613c3e1"
  instance_type = "t2.micro"
  subnet_id     = "${module.ww_vpc.subnet_id}"
}
