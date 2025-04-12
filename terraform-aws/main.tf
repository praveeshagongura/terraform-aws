provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source                  = "./modules/vpc"
  vpc_cidr                = "10.0.0.0/16"
  public_subnet_cidr_a    = "10.0.1.0/24"
  public_subnet_cidr_b    = "10.0.3.0/24"
  private_subnet_cidr     = "10.0.2.0/24"
}

module "igw" {
  source               = "./modules/igw"
  vpc_id               = module.vpc.vpc_id
  public_subnet_a_id   = module.vpc.public_subnet_a_id
  public_subnet_b_id   = module.vpc.public_subnet_b_id
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source            = "./modules/ec2"
  vpc_id            = module.vpc.vpc_id
  private_subnet_id = module.vpc.private_subnet_id
  sg_id             = module.sg.private_ec2_sg_id
  ami               = "ami-00a929b66ed6e0de6" 
  instance_type     = "t2.micro"
}

module "alb" {
  source            = "./modules/alb"
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = [module.vpc.public_subnet_a_id, module.vpc.public_subnet_b_id]
  lb_sg_id          = module.sg.lb_sg_id
  ec2_instance_id   = module.ec2.web_server_id
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "tatic-webfiles-pg-7"
}

module "dynamodb" {
  source       = "./modules/dynamodb"
  table_name   = "LoginDetails"
  read_capacity  = 5
  write_capacity = 5
}
