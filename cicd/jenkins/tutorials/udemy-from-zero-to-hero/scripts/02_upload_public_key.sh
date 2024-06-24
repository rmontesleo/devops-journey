#!/bin/bash

if [ -z "$1" ]; then
    echo "Please provide a value for the ip or hostname of the virtual machine"
    exit 1
fi

remote_host=$1
key_path="~/.ssh/virtualbox/rocky9/rocky9-key"

####################################### Validate if directories exits #####################################################
if [ ! -d ~/.ssh ]; then
    mkdir ~/.ssh
fi

if [ ! -d ~/.ssh/virtualbox ]; then
    mkdir ~/.ssh/virtualbox
fi

if [ ! -d ~/.ssh/virtualbox/rocky9 ]; then
    mkdir ~/.ssh/virtualbox/rocky9
fi


##################################################### Create ssh key #####################################################
# -q   : silence ssh-keygen
# -t   : generate the key with a given algorithm
# -N   : flag to enter a void pass:
# -f   : the path where save the ssh key
# <<<y : Answer yes automatically 
ssh-keygen -q  -N '' -f ~/.ssh/virtualbox/rocky9/rocky9-key 

#echo "SSH Keygen result is $?"
###########################################################################################################################


#if [ $? -eq 0 ]; then
    # upload  the key to remote server
     ssh-copy-id -i  ~/.ssh/virtualbox/rocky9/rocky9-key.pub  developer@$remote_host
#else 
#    echo "Try to generate again your ssh key. Can not upload"
#fi
