### 6 Basic Linux Commands (CLI-Part 2)
```bash
# print working directory
pwd

# list
ls

# make a directory (create a directory)
mkdir $THE_DIRECORY_NAME

# create a file
touch $FILE_NAME

# remove file
rm $FILE_NAME

# Go up directory
cd ..

# Remove a non-empty directory with all the files with it recursively
rm -r $THE_DIRECORY_NAME

# Two ways to remove and empty directory
rm -d $THE_DIRECORY_NAME
rmdir $THE_DIRECORY_NAME

# Clear the terminal 
clear

# EVERYTHING in Linux is a File

mv web-application java-app

ls java-app/

cp -r java-app my-project

#
cp Readme.md Readme-test.md
mv Readme-dev.md

# See recursively the content of all folders inside Documents
ls -R Documents

# Type ctrl + r : To find in history any command executend in the terminal

# Type ctrl + c : To stop the execution of any command

# disply last 10 commands executed in history
history 10

# Ctrol + shift + v : Paste copied text into terminal

# ls -a : Show hidden files

# Display file content 
cat .bash_history

# Show system information about kernel
uname -a

#
cat /etc/os-release


# list details info about arquitecture system information
lscpu

# List Memory information
lsmem

# show commands as super user
ls /sbin

# add a new user, you required root grants
# with sudo allows regular users to run programs with the security privileges of the superuser or root
sudo adduser developer
# you will be ask for sudo password
# you will be ask for type a password for the new user (this is required)
# you will be ask for confirm the previous passsowrd (this is required)
# And then for additional and optional information about Full Name, Room Number, Work phone, HOme Phone, Other, and then confirm [Y/n] the information.

# to verify whceh the home folder
ls /home

# create devops group
sudo addgroup devopss

# switch from user (su) then the otehr user name
su - developer

# show where you are
pwd

# show command history
history

# show content of history of executed commands in terminal.
cat .bash_history

```