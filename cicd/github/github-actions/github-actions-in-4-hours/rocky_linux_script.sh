#!/bin/bash

# TODO: FIX THIS SCRIPT, AND VALIDATE IN WHICH DISTROS RHEL BASED, ITS FUNCTIONAL

token=$1
github_user=$2
repository=$3



### SOME ACTIONS MUST BE EXECUTED BEFORE INSTALL THE RUNNER ON ROCKY,ALMA Linux.  Verify on RHEL and Fedora
sudo dnf -y install tar
sudo dnf install perl perl-Digest-SHA -y
sudo dnf install coreutils -y

echo  "####################################### Create the folder"
mkdir actions-runner && cd actions-runner 
ls
pwd


echo  "####################################### Download the latest runner package"
curl -o actions-runner-linux-x64-2.327.1.tar.gz \
-L https://github.com/actions/runner/releases/download/v2.327.1/actions-runner-linux-x64-2.327.1.tar.gz


echo  "####################################### Validate the Hash"
echo "d68ac1f500b747d1271d9e52661c408d56cffd226974f68b7dc813e30b9e0575  actions-runner-linux-x64-2.327.1.tar.gz" | shasum -a 256 -c

echo "####################################### Extract the installer"
tar xzf ./actions-runner-linux-x64-2.327.1.tar.gz

echo "####################################### Install dependencies "
sudo ./bin/installdependencies.sh

echo "#######################################  configure"
./config.sh  --unattended --url https://github.com/$github_user/$repository --token $token --labels linode-rocky01-selfhosted



echo "####################################### run it!"
./run.sh

status=$(echo $?)

echo "####################################### Final Status  $status"

