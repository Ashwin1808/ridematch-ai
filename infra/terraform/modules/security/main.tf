resource "aws_security_group" "backend_sg" {
  name        = "ridematch-backend-sg"
  description = "Security group for RideMatch backend"
  vpc_id = var.vpc_id

  # tags = {
  #   Name        = "ridematch-backend-sg"
  #   Environment = "development"
  #   ManagedBy   = "Terraform"
  # }
  tags = merge(var.common_tags, {
  Name = "ridematch-backend-sg"
})
}


resource "aws_vpc_security_group_egress_rule" "backend_allow_all_outbound" {
  security_group_id = aws_security_group.backend_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  description = "Allow all outbound traffic"
}

resource "aws_security_group" "alb_sg" {
  name        = "ridematch-alb-sg"
  description = "Security group for RideMatch ALB"
  vpc_id = var.vpc_id

  # tags = {
  #   Name        = "ridematch-alb-sg"
  #   Environment = "development"
  #   ManagedBy   = "Terraform"
  # }
  tags = merge(var.common_tags, {
  # Name = "ridematch-backend-sg"
    Name        = "ridematch-alb-sg"
})
}

resource "aws_vpc_security_group_ingress_rule" "alb_https" {
  security_group_id = aws_security_group.alb_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"

  description = "Allow HTTPS from the internet"
}



resource "aws_vpc_security_group_ingress_rule" "backend_from_alb" {
  security_group_id = aws_security_group.backend_sg.id

  referenced_security_group_id = aws_security_group.alb_sg.id
  from_port                    = 5001
  to_port                      = 5001
  ip_protocol                  = "tcp"

  description = "Allow backend traffic only from ALB"
}