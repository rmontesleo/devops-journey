###  10 - Linux Accounts & Groups (Users & Permissions Part 2)
```bash

# show hidden folder
ls -a

# show ownership permition in files
ls -l

# owner group 

# change the ownership of the file
# chwon <username>:<groupname> <filename>
sudo chown tom:admin test.txt

# verify
ls -l

# see who owns the content inside /etc/ folder  
ls -l /etc/

# change only user or group
# user
sudo chown admin  test.txt

# group
sudo chgrp devops  test.txt

# Linux permissions

## File type
# - regular file
# d directory
# c characer device file
# l symbolic link


# d  rwx  rwx  r-x   :  drwxrwxr-x   
# directory
# Owner: user onwer can rwx (read, write, execute) on the file
# Group: any person on that group can rwx (read,write,execute)
# Other: any other person in different group can  r-x ( reand, , execute )

---

# change permision
## remove(-) permision of execute(x) to the api folder to all users and groups
sudo chmod -x api

# Remove the permision to write to the group of this file  config.yaml
sudo chmod g-w config.yaml

# Add the permition to execut th the current group of the file config.yaml
sudo chmod g+x config.yaml

# verify
ls -l

# remove again the execution permition to the file config.yaml to the group
sudo chmod g-x config.yaml


# rename the filenam from test.txt to script.sh
mv test.txt script.sh

# verify permissions
ls -l

# change execuion permition to the owner user of this file
sudo chmod u+x script.sh


# owner (u), group (g), other(o)
# + (add), -(remove)
# read (r), w(write), x(execute)

# remove the execution permision to all owner
sudo chmod a-x script.sh

# we cand add a hole block of permitions
# this group can rwx (read, write and execute) on config.yaml
sudo chmod g=rwx config.yaml

# This group can only read (r) on config.yaml
sudo chmod g=r-- config.yaml

# Absolute (numeric) mode

0 No permition             ---
1 Execute                  --x
2 Write                    -w-
3 Write and Execute        -wx 
4 Read                     r--
5 Read and Execute         r-x
6 Read and Write           rw-   
7 Read, Write and Execute  rwx

## give all permisions to user, group and other to script.sh file
sudo chmod 777 script.sh

## give all permision to user, read only to group and none to others to script.sh file
sudo chmod 740 script.sh


## 3 ways to set permissions

# 1) Symbolic Mode  +(add), -(remove) 
#                   read(read), w(write), x(execute), -(no permission)


# 2) Set permision 
#  = set the permissions and override the permissions set earlier

# 3) Numeric Mode
# 4 read
# 2 write
# 1 execute
# 0 No permition	


# show hidden files and their permissions
ls -la

```
