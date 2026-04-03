#!/bin/bash

set -e

echo "Starting Docker installation..."

# Check if Docker is already installed
if command -v docker &> /dev/null; then
    echo "Docker already installed: $(docker --version)"
    exit 0
fi

# echo "Updating system..."
# sudo apt-get update -y

echo "Installing dependencies..."
sudo apt-get install -y ca-certificates curl gnupg

# Add Docker GPG key (only if not exists)
if [ ! -f /etc/apt/keyrings/docker.gpg ]; then
    echo "Adding Docker GPG key..."
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
      sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
fi


# Add repo (only if not exists)
if [ ! -f /etc/apt/sources.list.d/docker.list ]; then
    echo "Adding Docker repo..."
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
    https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
fi

echo "Updating package list..."
sudo apt-get update -y

echo "Installing Docker..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Enabling Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

# Add user to docker group safely
if ! groups "$USER" | grep -q docker; then
    echo "Adding user to docker group..."
    usermod -aG docker $USER
fi
sudo newgrp docker

echo "Docker installed successfully!"

