module "networking" {

  source = "./modules/networking"

  vpc_cidr              = var.vpc_cidr
  public_subnet_1_cidr  = var.public_subnet_1_cidr
  public_subnet_2_cidr  = var.public_subnet_2_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr

  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2

  common_tags = local.common_tags
}

module "security" {
  source = "./modules/security"

  vpc_id      = module.networking.vpc_id
  common_tags = local.common_tags
}

module "compute" {

  source = "./modules/compute"

  public_subnet_1_id = module.networking.public_subnet_1_id

  backend_sg_id = module.security.backend_sg_id

  instance_type = local.config.instance_type

  instance_count = local.config.instance_count

  common_tags = local.common_tags
}

module "alb" {
  source = "./modules/alb"

  vpc_id             = module.networking.vpc_id
  public_subnet_1_id = module.networking.public_subnet_1_id
  public_subnet_2_id = module.networking.public_subnet_2_id

  alb_sg_id = module.security.alb_sg_id

  backend_instance_ids = module.compute.backend_instance_ids

  common_tags = local.common_tags
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "backend_public_ip" {
  value = module.compute.backend_public_ip
}