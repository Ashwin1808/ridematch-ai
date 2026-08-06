data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

resource "aws_launch_template" "backend" {

  name_prefix = "ridematch-backend-"

  image_id = data.aws_ami.amazon_linux.id

  instance_type = var.instance_type

  vpc_security_group_ids = [
    var.backend_sg_id
  ]

  iam_instance_profile {
    name = var.instance_profile_name
  }

  # user_data = base64encode(file("${path.module}/user-data.sh"))
  user_data = base64encode(templatefile("${path.module}/user-data.sh.tpl", {
    jwt_secret     = var.jwt_secret
    db_password    = var.db_password
    gemini_api_key = var.gemini_api_key
    news_api_key   = var.news_api_key
    gnews_api_key  = var.gnews_api_key
  }))

  update_default_version = true

  tag_specifications {

    resource_type = "instance"

    tags = merge(var.common_tags, {
      Name = "RideMatch Backend"
    })

  }

}