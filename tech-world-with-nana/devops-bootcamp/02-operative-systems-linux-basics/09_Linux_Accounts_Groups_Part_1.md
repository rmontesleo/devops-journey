###  9 - Linux Accounts & Groups (Users & Permissions Part 1)
```bash
# User categories
# - Superuser account (Only one)
# - User account (multiple)
# - Service Account (multiple)

# User Level: Give permissions to user directly
# Group Level: 

# Access Control Files
# /etc/passwd : Stores account information - USERNAME: PASSWORD: UID: GID: GECOS: HOMEDIR:SHELL

# to add new user (tom in this sample)
sudo adduser tom

# Change password of a user (in this sample for tom)
sudo passwd tom

# loging with some specific user
su - tom

# to logins as root
su -

# create groups
sudo groupadd devops

# verify the group is created
cat /etc/group



# Two categories of user & group commands

## This category is friendly user and interactive
# adduser
# deluser
# addgroup
# delgroup

## This category is more for scripts
# useradd
# userdell
# groupadd
# groupdel

# modify a the devops account to add the tom user 
sudo usermod -g devops tom

# remove some group
sudo delgroup tom

# adding tom to the additional grupo newgroup
sudo usermod -aG newgroup tom

# show the groups of the current user
groups

# show the groups of the tom user
groups tom

# Create a new user
# Low-level command
# -G create user with multiple secondary groups
# -d custom home directory
# and other options for shell

# create the user nicole and add to the additional group devops
sudo useradd -G devops nicole

# remove nicole from the devops group
sudo gpasswd -d nicole devops

# verify the group
cat /etc/groups



# /etc/shadow : 
# /etc/group  : 


```

- [](https://www.guru99.com/linux-commands-cheat-sheet.html)
- [](https://cheatography.com/davechild/cheat-sheets/linux-command-line/)

---
