#!/bin/bash

# Update your system
echo "###### Update the system ######"
sudo apt-get -y update

newUser=developer
echo "###### New user to create: $newUser ######"

# Create the user
adduser $newUser

# add the user to sudo'er group
echo "###### Adding $newUser to sudoers ######"
usermod -aG sudo $newUser

# sync the root user ssh key  with the $newUser
echo "###### sync the root user ssh key  with the $newUser ######"
rsync --archive --chown=$newUser:$newUser ~/.ssh /home/$newUser

echo "###### End of the script ######"
