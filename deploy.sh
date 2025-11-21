#!/usr/bin/env bash
set -e

APP_DIR="/home/javi/nodejswebapp"
CONTAINER_NAME="nodejswebapp"
IMAGE_NAME="nodejswebapp:latest"

cd "$APP_DIR"

echo "[*] Pulling latest code..."
git pull

echo "[*] Building Docker image..."
docker build -t "$IMAGE_NAME" .

echo "[*] Stopping old container (if exists)..."
docker stop "$CONTAINER_NAME" 2>/dev/null || true
docker rm "$CONTAINER_NAME" 2>/dev/null || true

echo "[*] Starting new container..."
docker run -d \
  --name "$CONTAINER_NAME" \
  -p 3001:3001 \
  "$IMAGE_NAME"

echo "[*] Deployment complete."

