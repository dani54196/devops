#!/bin/bash

# This script installs Docker and Docker Compose on an Ubuntu system.

# Update the package index
sudo apt-get update -y

# Install prerequisite packages
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add the Docker APT repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the package index again with the Docker repository
sudo apt-get update -y

# Install Docker CE
sudo apt-get install -y docker-ce

# Start Docker and enable it to start on boot
sudo systemctl start docker
sudo systemctl enable docker

# Verify that Docker CE is installed correctly by running the hello-world image
sudo docker run hello-world

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions to the Docker Compose binary
sudo chmod +x /usr/local/bin/docker-compose

# Verify that Docker Compose is installed correctly
docker-compose --version

# Add the current user to the Docker group to run Docker without sudo
sudo usermod -aG docker $USER

# Print completion message
echo "Docker and Docker Compose installation is complete."
echo "You need to log out and log back in to apply the Docker group changes."