# locals {
#   common_tags = {
#     Project     = "RideMatch"
#     Environment = "Dev"
#     Owner       = "Ashwin"
#     ManagedBy   = "Terraform"
#   }
# }

# locals {

#   environment = terraform.workspace

#   common_tags = {
#     Environment = local.environment
#     ManagedBy   = "Terraform"
#     Project     = "RideMatch"
#   }

#   instance_types = {
#     dev  = "t3.micro"
#     qa   = "t3.small"
#     prod = "t3.large"
#   }

#   instance_type = local.instance_types[local.environment]

# }


locals {

  environment = terraform.workspace

  environments = {

    dev = {

      instance_type = "t3.micro"

      instance_count = 1

      root_volume_size = 20

      enable_alb = false

      detailed_monitoring = false

      log_retention = 7

    }

    qa = {

      instance_type = "t3.small"

      instance_count = 2

      root_volume_size = 30

      enable_alb = true

      detailed_monitoring = false

      log_retention = 14

    }

    prod = {

      instance_type = "t3.large"

      instance_count = 4

      root_volume_size = 100

      enable_alb = true

      detailed_monitoring = true

      log_retention = 365

    }

  }

  config = local.environments[local.environment]

  common_tags = {

    Project = "RideMatch"

    Environment = local.environment

    ManagedBy = "Terraform"

  }

}