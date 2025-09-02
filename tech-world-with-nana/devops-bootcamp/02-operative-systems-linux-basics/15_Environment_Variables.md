### 15 - Environment Variables
```bash
# list all environment variables
printenv

# with less you can paging the response
printenv | less

# print specific variables, in this case print the value of the env variable USER
printenv USER

# print coincidences with USER
printenv | grep USER

# creating our own env variables
export DB_USERNAME=dbuser
export DB_PASSWORD=secretpwdvalue
export DB_NAME=mydb

printenv | grep DB


# Remove environment variables
unset DB_NAME

# Making persistent our env variables , using shell specific configuration file
# Per-user shell specific configuration files
# E.g. if you are using Bash, you can declare the variables in the ~/.bashrc fiel
# Variables set in this file are loaded whenever a bash login shell is entered

# to add in ~/.bashrc
vim ~/.bashrc

### ------------------------------------------------ 
...

export DB_USERNAME=dbuser
export DB_PASSWORD=secretpwdvalue
export DB_NAME=mydb

### ------------------------------------------------ 


# reload file to enable this variables in this session
source ~/.bashrc


# ~./bashrc is user specific 
# /etc/environment  is for all system all users

# to edit this file
sudo vim /etc/environment


# PATH environment variable is a List of directories to executable files, separated by :
# thanks to this PATH env variable we dont need to reference the hole path for commands.

# example
/usr/bin/ls -l

# we only use
ls -l

# checking the value of PATH variable
echo $PATH

# Sample, add a custom command/program. Create a file in our home
vim sample

### ------------------------------------------------ 

#!/bin/bash

echo "Welcome to DevOps Bootcamp $USER"

### ------------------------------------------------ 

chmod a+x welcome

# edith the .bashrc file and modify the PATH variable inside
### ------------------------------------------------ 
...

# this add all the executable programs inside the current home to the paht
PATH=$PATH:/home/nana

### ------------------------------------------------ 

# reload variables defined in .bashrc file
source ~/.bashrc 


```

### Summary at this point
- Virtual Machines
- File System
- CLI Commands
- vim editor
- security users & permissions
- bash scripting
- environment variables

