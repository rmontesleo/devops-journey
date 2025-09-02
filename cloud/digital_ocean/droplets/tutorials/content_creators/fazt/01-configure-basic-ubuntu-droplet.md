# Ubuntu 22.04 LTS

```bash
curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"demo-ubuntu-droplet",
        "size":"s-1vcpu-512mb-10gb",
        "region":"sfo3",
        "image":"ubuntu-22-04-x64"}' \
    "https://api.digitalocean.com/v2/droplets"
```

```bash
doctl compute droplet create \
    --image ubuntu-22-04-x64 \
    --size s-1vcpu-512mb-10gb \
    --region sfo3 \
    demo-ubuntu-droplet
```


---
```bash
cat /etc/os-releas
```

### update the system like root
```bash
apt-get -y update && apt-get -y upgrade
```

```bash
# verify the allow programs in the firewall
ufw app list

# allow the OpenSSH
ufw allow OpenSSH

# check the status
ufw status

# enable the rules un ufw
ufw enable

```

### 
```bash
adduser $newUser

usermod -aG sudo $newUser
```


### sync the ssh key of root with the $newUser
```bash
rsync --archive --chown=$newUser:$newUser ~/.ssh /home/$newUser
```

## REFERENCES

- [ubuntu | Configuracion inicial. (Droplet en DigitalOcean)](https://www.youtube.com/watch?v=Z4yeRyf8MhM&list=PLo5lAe9kQrwpvZYLL908Rx693aGcWMUuL&index=4)

