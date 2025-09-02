# Notes

## First Segment


### First example
```bash
# running on rhel 10
podman run -it ubuntu

# ----  start inside the container, this run on ubuntu
cat /otc/os-release
uname -r
exit
#----- end the container


# run an nginx container
podman run -ti nginx sh

# ---- start inside the container , this runs on debian
cat /etc/os-release
uname -r

# see what happen with this
ps aux
# ---

```


### Second sample
```bash
# almos all samples runs in podman or docker.  In RHEL podman is already installed

# show all container, running and stoped ones.
podman ps -a

# show anly running containers
podman ps

# This value are the first characters of container ID of the class sample. You will use the proper of you environment
# For this sample the container IDis d337c0c4090

#This command is to use the place where the container is store in filesystem
# TODO: Verify more about the find linux command.
# Verify in a linx machine
sudo find . -name "d337c9*"

```

### clone working repository
```bash
git clone https://github.com/sandervanvugt/containers

cd containers

# execute script to run a countdown, argument is time in minutes, show the remaining time in seconds.
./countdown 12

```

---

## Second segment


### Docker onyl sample, running on Ubuntu Virtual Machine
```bash
# verify the operating system
cat /etc/os-release

# install docker(very simple on Ubuntu 24 or later)
sudo apt install -y docker.io 

# verify if docker is running
systemctl status docker

# the first time, permission denied, because the current user does not allow to run docker processes
docker run -d nginx

# add current user to docker group
sudo usermod -aG docker $USER

# run newgrp 
# TODO: Vefify if this really works
newgrp $USER




```



---

## Auxiliar notes

### Ubuntu Notes
```bash

# see all users in linux
cat /etc/passwd


# Create new user command
sudo adduser developer

# Granting Sudo Privilgees
sudo usermod -aG sudo developer

su - developer

# change password for current user
passwd

# change password for other user, example user developer
passwd developer

# switch to root
su -

# swith to developer user
su - developer


```


### Rocky Notes
```bash

# create user developer
sudo adduser developer

# set a password for user developer
sudo passwd developer

# add to the admin group
sudo usermod -aG wheel developer

# install podman
sudo dnf install -y podman

# install podman compose
sudo dnf install -y podman-compose

# run nextcloud
podman run -d -p 8080:80 nextcloud


```


