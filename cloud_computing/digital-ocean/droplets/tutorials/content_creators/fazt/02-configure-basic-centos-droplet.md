# Configure Centos on Digital Ocean


### create with curl
```bash
curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"centos-demo-droplet",
        "size":"s-1vcpu-512mb-10gb",
        "region":"sfo3",
        "image":"centos-stream-8-x64",
        "vpc_uuid": "'$vpc_uuid'" }' \
    "https://api.digitalocean.com/v2/droplets"

```

### create with doctl
```bash
doctl compute droplet create \
    --image centos-stream-8-x64 \
    --size s-1vcpu-512mb-10gb \
    --region sfo3 \
    --vpc-uuid $vpc_uuid \
    centos-demo-droplet
```



```bash
ssh root@$centos-ip

### see the version of the current system
cat /etc/os-release

### update and upgrade the system
yum update -y && yum upgrade -y

### add new user
adduser $newUser

### add password
passwd $newUser

### add this user to sudoers to take privileges
usermod -aG wheel $newUser



### install firewall
dnf install firewalld -y

### verify the initial state of the firewall
sudo systemctl status firewalld

### start the firewall
sudo systemctl start firewalld

### verify the firewall is active now
sudo systemctl status firewalld

### verify what programs, ports, services, etc you can permit
firewall-cmd --permanent --list-all

### list all extra services you can permit on your server
firewall-cmd --get-services

### add to the rule allow http
firewall-cmd --permanent --add-service=http

### verify the added service
firewall-cmd --permanent --list-all

### reload the firewall with the new rules
firewall-cmd --reload

### synchronized the .ssh folder from root to newUser
rsync --archive --chown=$newUser:$newUser ~/.ssh /home/$newUser

```

## REFERENCES

- [Centos & DigitalOcean | Configuración Básica](https://www.youtube.com/watch?v=bwwKNDHC6PU&list=PLo5lAe9kQrwpvZYLL908Rx693aGcWMUuL&index=8)