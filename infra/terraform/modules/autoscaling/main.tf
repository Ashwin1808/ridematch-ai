resource "aws_autoscaling_group" "backend" {

  name = "ridematch-asg"

  desired_capacity = var.instance_count

  min_size = var.instance_count

  max_size = var.max_size

  vpc_zone_identifier = [
    var.private_subnet_1_id,
    var.private_subnet_2_id
  ]

  launch_template {

    id = var.launch_template_id

    version = "$Latest"

  }

  target_group_arns = [
    var.target_group_arn
  ]

  health_check_type = "ELB"

  health_check_grace_period = 300

  force_delete = true

  tag {

    key = "Name"

    value = "RideMatch Backend"

    propagate_at_launch = true

  }

}