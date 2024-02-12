#!/bin/bash

# update the package database
sudo dnf check-update
sudo yum update -y && sudo yum upgrade -y

# install some utilities
sudo yum install -y yum-utils
sudo yum install -y vim jq

# Install ssh server
sudo yum -y install openssh-server

# setup official Docker repository
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo



# Install docker engine and docker compose
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


# Start docker
sudo systemctl start docker

# verify docker is running
sudo systemctl status docker

# make sure it starts at every server reboot
sudo systemctl enable docker

# Create the docker group
sudo groupadd docker

# Add the current user to Docker group
sudo usermod -aG docker $USER

# apply changes
newgrp docker
