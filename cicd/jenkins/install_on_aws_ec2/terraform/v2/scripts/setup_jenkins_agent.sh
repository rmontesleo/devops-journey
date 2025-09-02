#!/bin/bash


echo '########################################'
echo 'Initial updating and upgrating our system'
echo '########################################'
echo
sudo yum update –y
sudo yum upgrade -y
sudo yum install wget -y
sudo yum install nc -y
sudo yum install jq -y

sleep 10

echo '########################################'
echo 'Installing Java 17'
echo '########################################'
echo


sudo dnf install java-17-amazon-corretto -y
