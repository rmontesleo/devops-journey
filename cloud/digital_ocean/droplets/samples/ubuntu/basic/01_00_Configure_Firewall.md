# Congiure the firewall


## Basic configuration

### Steps
```bash

# Update your system
apt-get -y update && apt-get -y upgrade

# verify the allow programs in the firewall
ufw app list

# allow the OpenSSH
ufw allow OpenSSH

# check the status
ufw status

# enable the rules un ufw
ufw enable

# reload the rules in your ufw
ufw reload

```