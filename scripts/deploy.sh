#!/bin/bash
set -e

echo "=================================="
echo "RideMatch Production Deployment"
echo "=================================="

cd /opt/ridematch

docker compose pull

docker compose down

docker compose up -d

docker image prune -af

echo "Deployment Completed Successfully!"