data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "backend_test" {
  count                       = var.instance_count
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t3.micro"
  # instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_1_id
  vpc_security_group_ids      = [var.backend_sg_id]
  associate_public_ip_address = true

  lifecycle {
  create_before_destroy = true
}

  # user_data = <<-EOF
  #   #!/bin/bash
  #   dnf install -y python3

  #   cat > /home/ec2-user/server.py <<'PYTHON'
  #   from http.server import BaseHTTPRequestHandler, HTTPServer

  #   class Handler(BaseHTTPRequestHandler):
  #       def do_GET(self):
  #           self.send_response(200)
  #           self.send_header("Content-type", "text/plain")
  #           self.end_headers()
  #           self.wfile.write(b"RideMatch Backend is running!")

  #   HTTPServer(("0.0.0.0", 5001), Handler).serve_forever()
  #   PYTHON

  #   nohup python3 /home/ec2-user/server.py > /var/log/ridematch.log 2>&1 &
  # EOF
  user_data = file("${path.module}/user-data.sh")
tags = merge(var.common_tags, {
  Name = "ridematch-backend-test"
})
}