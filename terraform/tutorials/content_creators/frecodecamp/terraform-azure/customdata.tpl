#!/bin/bash


# Install using the repository

# 1. Update the apt package index and install packages to allow apt to use a repository over HTTPS:

sudo apt-get update

sudo apt-get -y install \
ca-certificates \
curl \
gnupg \
lsb-release


# 2. Add Docker’s official GPG key:
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# 3.Use the following command to set up the repository:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


# Install Docker Engine
# 1. Update the apt package index:
sudo apt-get update

# 2. Install Docker Engine, containerd, and Docker Compose
sudo apt-get install -y docker-ce \
docker-ce-cli \
containerd.io \
docker-buildx-plugin \
docker-compose-plugin


# 3. Verify that the Docker Engine installation is successful by running the hello-world image:
sudo docker run hello-world

# Postinstallation

# 1. Create the docker group.
sudo groupadd docker

# 2. Add your user to the docker group.
sudo usermod -aG docker $USER