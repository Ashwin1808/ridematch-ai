resource "aws_lb_target_group" "backend_tg" {
  name     = "ridematch-backend-tg"
  port     = 5001
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/health"
    protocol            = "HTTP"
    port                = "5001"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    matcher             = "200"
  }


  tags = merge(var.common_tags, {
    Name = "ridematch-backend-tg"

  })
}

# resource "aws_lb_target_group_attachment" "backend_test" {
#   target_group_arn = aws_lb_target_group.backend_tg.arn

#   target_id = module.compute.backend_instance_ids[0]
#   port      = 5001
# }

# resource "aws_lb_target_group_attachment" "backend" {
#   # for_each = toset(var.backend_instance_ids)
#   count = length(var.backend_instance_ids)

#   target_group_arn = aws_lb_target_group.backend_tg.arn
#   # target_id        = each.value
#   target_id = var.backend_instance_ids[count.index]
#   port      = 5001
# }

resource "aws_lb" "ridematch_alb" {
  name               = "ridematch-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    var.alb_sg_id
  ]

  subnets = [
    var.public_subnet_1_id,
    var.public_subnet_2_id
  ]

  tags = merge(var.common_tags, {
    Name = "ridematch-alb"
  })
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.ridematch_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend_tg.arn
  }
}


