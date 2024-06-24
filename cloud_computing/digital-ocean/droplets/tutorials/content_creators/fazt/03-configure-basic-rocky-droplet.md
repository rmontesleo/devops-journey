#

### Create with curl
```bash

curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"rockylinux9-demo-droplet",
        "size":"s-1vcpu-512mb-10gb",
        "region":"sfo3",
        "image":"rockylinux-9-x64",
        "vpc_uuid":"'$vpc_uuid'"}' \
    "https://api.digitalocean.com/v2/droplets"
```

### create with doctl
```bash
doctl compute droplet create \
    --image rockylinux-9-x64 \
    --size s-1vcpu-512mb-10gb \
    --region sfo3 \
    --vpc-uuid $vpc_uuid \
    rockylinux9-demo-droplet
```

### login
```
ssh root@rocky-ip
```

### manage your rocky server
```bash

cat /etc/os-release

yum update -y && yum upgrade -y

### install firewall
dnf install firewalld -y

### check status of firewall
systemctl status firewalld

### start the firewall
systemctl start  firewalld

### verify the firewall is active
systemctl status firewalld

### see the list of all current services you can add
firewall-cmd --permanent --list-all

### see available services you can add
firewall-cmd --get-services

### add http to the firewall rules
firewall-cmd --add-service=http

### verify the http is now on services
firewall-cmd --permanent --list-all

### update the firewall rules
firewall-cmd --reload

```

### create a new user can connect to the server
```bash
## add a new user
adduser $newUser

## set a passworrd for newUser
passwd $newUser

## add this user to sudoers
usermod -aG wheel $newUser

rsync --archive --chown=$newUser:$newUser ~/.ssh /home/$newUser

```
