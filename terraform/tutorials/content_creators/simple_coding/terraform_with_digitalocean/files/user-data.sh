#!/bin/bash

apt-get update -y
apt-get install git -y
apt-get install nodejs -y
apt-get install npm -y

npm install pm2 -g