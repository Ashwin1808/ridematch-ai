#!/bin/bash
set -e

# Log everything
exec > >(tee /var/log/user-data.log)
exec 2>&1

echo "======================================"
echo "RideMatch EC2 Bootstrap Started"
echo "======================================"

# Update packages
dnf update -y

# Install required packages
dnf install -y docker git --allowerasing

# Enable Docker
systemctl enable docker
systemctl start docker

# Wait for Docker
sleep 10

# Verify Docker
docker --version

# Install Docker Compose
mkdir -p /usr/local/lib/docker/cli-plugins

curl -SL \
https://github.com/docker/compose/releases/download/v2.39.1/docker-compose-linux-x86_64 \
-o /usr/local/lib/docker/cli-plugins/docker-compose

chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

docker compose version

# Add ec2-user to Docker group
usermod -aG docker ec2-user

# Application directory
mkdir -p /opt/ridematch

cat > /opt/ridematch/docker-compose.yml <<EOF
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

echo "Pulling latest images..."
docker compose pull

echo "Starting containers..."
docker compose up -d

echo "Running containers:"
docker ps

echo "======================================"
echo "RideMatch Deployment Completed"
echo "======================================"