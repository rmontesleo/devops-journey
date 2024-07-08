#!/bin/bash

echo '########################################'
echo 'Install Development componentes for WSL2'
echo 
echo 'WARNING: This script works on  Ubuntu 22.04'
echo '########################################'
echo
echo
echo 'press Enter to continue'
read


echo '########################################'
echo 'Initial updating and upgrating our system'
echo '########################################'
echo

sudo apt-get update -y  && sudo apt-get upgrade -y 


echo '########################################'
echo 'Installing initial libraries'
echo '########################################'
echo

sudo apt-get install -y vim curl zsh jq  \
tmux apt-transport-https zip unzip \
git wget gcc tree



echo '########################################'
echo  'Install pip3'
echo '########################################'
echo

sudo apt-get -y install python3-pip


echo '########################################'
echo 'Installing Microsoft OpenJDK 17'
echo '########################################'
echo

# Valid values are only '18.04', '20.04', and '22.04'
# For other versions of Ubuntu, please use the tar.gz package
ubuntu_release=`lsb_release -rs`
wget https://packages.microsoft.com/config/ubuntu/${ubuntu_release}/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y msopenjdk-17




echo '########################################'
echo 'Installing Maven'
echo '########################################'
echo

maven_3version="3.9.7"
wget https://dlcdn.apache.org/maven/maven-3/${maven_3version}/binaries/apache-maven-${maven_3version}-bin.tar.gz
tar -xzvf apache-maven-${maven_3version}-bin.tar.gz
sudo mkdir -p /usr/local/apache-maven
sudo mv apache-maven-${maven_3version} /usr/local/apache-maven


echo '########################################'
echo 'Installing NVM and NodeJS LTS'
echo '########################################'
echo

NVM_VERSION="v0.39.7"
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh" | bash
source ~/.bashrc
nvm install --lts


echo '########################################'
echo 'Installing kubectl'
echo '########################################'
echo

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl


echo '########################################'
echo 'Installing minikube'
echo '########################################'
echo

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube


echo '########################################'
echo 'Installing k9s'
echo '########################################'
echo

k9s_version="0.32.4"     
wget https://github.com/derailed/k9s/releases/download/v${k9s_version}/k9s_Linux_amd64.tar.gz
tar -xzvf k9s_Linux_amd64.tar.gz
sudo mv  k9s /usr/local/bin


echo '########################################'
echo 'Installing kubecolor'
echo '########################################'
echo

kubecolor_version="0.0.25"
wget https://github.com/hidetatz/kubecolor/releases/download/v${kubecolor_version}/kubecolor_${kubecolor_version}_Linux_x86_64.tar.gz
tar -xzvf kubecolor_${kubecolor_version}_Linux_x86_64.tar.gz
sudo mv kubecolor /usr/local/bin/kubecolor


echo '########################################'
echo 'Installing Azure CLI'
echo '########################################'
echo

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash


echo '########################################'
echo 'Installing AWS CLI'
echo '########################################'
echo

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install


echo '########################################'
echo 'Installing GCP CLI'
echo '########################################'
echo

sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates gnupg curl -y
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

sudo apt-get update && sudo apt-get install google-cloud-cli -y
sudo apt-get install google-cloud-cli-app-engine-java -y



echo '########################################'
echo 'Installing doctl CLI'
echo '########################################'
echo

doctl_version="1.107.0"
wget https://github.com/digitalocean/doctl/releases/download/v${doctl_version}/doctl-${doctl_version}-linux-amd64.tar.gz
tar xf doctl-${doctl_version}-linux-amd64.tar.gz
sudo mv doctl /usr/local/bin


echo '########################################'
echo 'Installing boto and linode'
echo '########################################'
echo

sudo pip3 install boto
sudo pip3 install linode-cli --upgrade



echo '########################################'
echo 'Installing Terraform '
echo '########################################'
echo

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg


gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint


echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update


sudo apt-get install terraform


echo '########################################'
echo 'Installing Sonar CLI' 
echo '########################################'

SONAR_ZIP_CLI="sonar-scanner"
SONAR_VERSION="6.0.0.4432-linux"
SONAR_ZIP_URL="https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_VERSION}.zip"
SONAR_FOLDER="/usr/local/sonarqube/"

curl -o "${SONAR_ZIP_CLI}.zip" "$SONAR_ZIP_URL" 
unzip "${SONAR_ZIP_CLI}.zip"
sudo mkdir -p ${SONAR_FOLDER}
sudo mv "${SONAR_ZIP_CLI}-${SONAR_VERSION}" ${SONAR_FOLDER}


echo '########################################'
echo 'Installing Snyk' 
echo '########################################'
curl --compressed  https://static.snyk.io/cli/latest/snyk-linux  -o snyk
chmod +x ./snyk
sudo mv ./snyk /usr/local/bin/


echo '########################################'
echo 'Installing Dive (Analyze Docker Images)'
echo '########################################'
echo

dive_version="0.12.0"
wget https://github.com/wagoodman/dive/releases/download/v${dive_version}/dive_${dive_version}_linux_amd64.deb
sudo dpkg -i ./dive_${dive_version}_linux_amd64.deb




echo '########################################'
echo 'Installing Docker' 
echo '########################################'
echo


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


echo '########################################'
echo 'Press enter and the type exit to end the installation.'
read
echo '########################################'
echo

newgrp docker 


echo '########################################'
echo 'Bye bye...'
echo '########################################'
