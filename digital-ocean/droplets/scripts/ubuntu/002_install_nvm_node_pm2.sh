#!/bin/bash

### Install NVM (Node Version Manager and Node)

# Update system
echo "Update System"
sudo apt-get -y update

# install nvm, the current one on february 2023
echo "Install NVM"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# update system variables
echo "Update system variables"
source ~/.bashrc

# see options of nvm
echo "Test NVM"
nvm

# to install the LTS version
echo "Install node lts"
nvm install node --lts


# verify node version
echo "verify node version"
node --version

# verify npm version
echo "verify npm version"
npm --version


# install pm2 to manage node projects
echo "install pm2 to manage node projects"
npm install pm2 -g

# verify the verion of pm2
pm2 --version


echo "#########  End of the script #########"