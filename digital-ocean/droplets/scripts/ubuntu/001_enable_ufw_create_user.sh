#!/bin/bash

# Update your system
echo "###### Update the system ######"
apt-get -y update

# verify the allow programs in the firewall
echo "###### Verify the allow programs in the firewall ######"
ufw app list

# allow the OpenSSH
echo "###### Allow OpenSSH ######"
ufw allow OpenSSH

# check the status
ufw status

# enable the rules un ufw
echo "###### Enable ufw ######"
ufw enable

# reload the rules in your ufw
ufw reload

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
