terraform {

  backend "s3" {

    bucket = "ridematch-tfstate-644370125746"

    key = "dev/terraform.tfstate"

    region = "ap-south-1"

    # profile = "ridematch"

    dynamodb_table = "ridematch-terraform-locks"

    encrypt = true

  }

}