#!/bin/bash
dnf install -y python3

cat > /home/ec2-user/server.py <<'PYTHON'
from http.server import BaseHTTPRequestHandler, HTTPServer

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/plain")
        self.end_headers()
        self.wfile.write(b"RideMatch Backend is running!")

HTTPServer(("0.0.0.0", 5001), Handler).serve_forever()
PYTHON

nohup python3 /home/ec2-user/server.py > /var/log/ridematch.log 2>&1 &