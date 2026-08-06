#!/bin/bash
set -e

dnf update -y

dnf install -y docker git curl

systemctl enable docker
systemctl start docker

usermod -aG docker ec2-user

mkdir -p /usr/local/lib/docker/cli-plugins

curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 \
-o /usr/local/lib/docker/cli-plugins/docker-compose

chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

docker compose version

mkdir -p /opt/ridematch

cat >/opt/ridematch/docker-compose.yml <<EOF
version: "3.9"

services:

  backend:
    image: ashwindocker1808/ridematch-backend:latest
    container_name: ridematch-backend
    restart: unless-stopped
    ports:
      - "5001:5001"

  frontend:
    image: ashwindocker1808/ridematch-frontend:latest
    container_name: ridematch-frontend
    restart: unless-stopped
    depends_on:
      - backend
    ports:
      - "3000:3000"

EOF

cd /opt/ridematch

docker compose pull
docker compose up -d