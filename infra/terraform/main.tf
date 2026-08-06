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

# module "compute" {

#   source = "./modules/compute"

#   public_subnet_1_id = module.networking.public_subnet_1_id

#   backend_sg_id = module.security.backend_sg_id

#   instance_type = local.config.instance_type

#   instance_count = local.config.instance_count

#   common_tags = local.common_tags

#   instance_profile_name = module.iam.instance_profile_name
# }

module "launch_template" {

  source = "./modules/launch_template"

  instance_type = local.config.instance_type

  backend_sg_id = module.security.backend_sg_id

  instance_profile_name = module.iam.instance_profile_name

  common_tags = local.common_tags

  jwt_secret     = var.jwt_secret
  db_password    = var.db_password
  gemini_api_key = var.gemini_api_key
  news_api_key   = var.news_api_key
  gnews_api_key  = var.gnews_api_key
}

module "autoscaling" {

  source = "./modules/autoscaling"

  launch_template_id = module.launch_template.launch_template_id

  private_subnet_1_id = module.networking.private_subnet_1_id
  private_subnet_2_id = module.networking.private_subnet_2_id

  target_group_arn = module.alb.target_group_arn

  instance_count = local.config.instance_count

  max_size = local.config.instance_count + 1

  common_tags = local.common_tags
}

module "alb" {
  source = "./modules/alb"

  vpc_id             = module.networking.vpc_id
  public_subnet_1_id = module.networking.public_subnet_1_id
  public_subnet_2_id = module.networking.public_subnet_2_id

  alb_sg_id = module.security.alb_sg_id

  common_tags = local.common_tags
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}


module "iam" {

  source = "./modules/iam"

  common_tags = local.common_tags

}

module "cloudwatch" {

  source = "./modules/cloudwatch"

  autoscaling_group_name = module.autoscaling.asg_name

}