



## To remove the runner
```bash
# To remove in Linux/Mac Runner
./config.sh remove --token $token

# To remove in Windows Runner
./config.cmd remove --token $token

```


## Create users in Linux

### Adding a New User in Ubuntu
```bash
# Create new user command
sudo adduser polo

# Granting Sudo Privilgees
sudo usermod -aG sudo polo

# verify sudo privileges
groups polo

# Deletein a User
sudo deluser polo

# Deletge user along with home directory
sudo deluser --remove-home polo

```

### Addin a New User in Rocky Linux
```bash
# Step 1: Add a Newe User
# add new user
sudo useradd polo

# set a password for the new user
sudo passwd polo

# Step 2: Add teh User to the Admin Group
sudo usermod -aG wheel polo

# Step 3: Verify sudo access
su - username

sudo ls -la /root

```


### Positional Parameters
```bash
#!/bin/bash

echo "First parameter: $1"
echo "Second parameter $2"
echo "All parameters $@"
echo "Number of parameters: $#"

```


## Exercise 5

### TODO: Pending do a deployment and create surge account to deploy the practice

### This execution is in Windows Powershell
```bash
#
Set-ExecutionPolicy bypass -Scope Process

#
npm install --global surge

surge --version

surge list

# create a file in c:\test\index.html

# you wll be ask for a project path, C:\tesst
surge

# to generate a token for surge
surge token


```


