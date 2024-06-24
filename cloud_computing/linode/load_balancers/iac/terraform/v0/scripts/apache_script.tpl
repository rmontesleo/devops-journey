#!/bin/bash

# Update the package list
sudo apt update

# Install Apache server
sudo apt install -y apache2

# Start Apache service
sudo systemctl start apache2

# Enable Apache service to start on boot
sudo systemctl enable apache2

# Display Apache server status
sudo systemctl status apache2
