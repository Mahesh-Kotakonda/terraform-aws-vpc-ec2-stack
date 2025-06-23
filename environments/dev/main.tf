module "vpc" {
  source               = "../../modules/vpc"
  name                 = var.name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
}

module "networking" {
  source = "../../modules/networking"
  vpc_id          = module.vpc.vpc_id
  name            = "dev_env"

  public_subnets  = { for idx, subnet in module.vpc.public_subnet_ids : tostring(idx) => subnet }
  private_subnets = { for idx, subnet in module.vpc.private_subnet_ids : tostring(idx) => subnet }
}
module "security_groups" {
  source = "../../modules/security-groups"

  vpc_id            = module.vpc.vpc_id
  name_prefix       = "myproject-dev-sg"
  allowed_ssh_cidrs = ["0.0.0.0/0"]
}

locals {
  instances = {
    "web1" = {
      name                        = "webserver-1"
      subnet_id                   = module.vpc.public_subnet_ids[0]
      security_group_ids          = [module.security_groups.public_sg_id]
      associate_public_ip_address = true
    }
    "web2" = {
      name                        = "webserver-2"
      subnet_id                   = module.vpc.public_subnet_ids[1]
      security_group_ids          = [module.security_groups.public_sg_id]
      associate_public_ip_address = true
    }
    "app1" = {
      name                        = "appserver-1"
      subnet_id                   = module.vpc.private_subnet_ids[0]
      security_group_ids          = [module.security_groups.private_sg_id]
      associate_public_ip_address = false
    }
    "app2" = {
      name                        = "appserver-2"
      subnet_id                   = module.vpc.private_subnet_ids[1]
      security_group_ids          = [module.security_groups.private_sg_id]
      associate_public_ip_address = false
    }
  }
}

module "ec2" {
  source = "../../modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  environment   = var.environment
  user_data     = file("${path.module}/userdata.sh")

  instances = local.instances
}

