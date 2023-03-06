# Install Maria DB on CentOS in Digital Ocean


## Create the droplet

###
```bash
curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"centos-mariadb-droplet",
        "size":"s-1vcpu-1gb",
        "region":"sfo3",
        "image":"centos-stream-8-x64",
        "vpc_uuid":"'$vpc_uuid'"}' \
    "https://api.digitalocean.com/v2/droplets"
```


```bash
doctl compute droplet create \
    --image centos-stream-8-x64 \
    --size s-1vcpu-1gb \
    --region sfo3 \
    --vpc-uuid $vpc_uuid \
    centos-mariadb-droplet
```

---

```bash
#
ssh  root@$virtual-machine-ip

#
ssh -i .ssh/$privateKey root@virtual-machine-ip
```

---

```bash
cat /etc/os-release

yum install mariadb-server -y

systemctl status mariadb

# start the datbase service
systemctl start  mariadb

systemctl status mariadb

# enable the service
systemctl enable mariadb

# check again the service
systemctl status mariadb


#
mysql --version

# connect to the database with the cli
mysql -u root


# secure the database configuration
mysql_secure_installation

# select Y in all steps to secure your database

# connect again
mysql -u root -p

# to see the version of the database use mysqladmin
mysqladmin -u root -p version


```

## REFERENCES

- [Centos & MariaDB, Instalación en DigitalOcean](https://www.youtube.com/watch?v=iRhvpyGpl3E&list=PLo5lAe9kQrwpvZYLL908Rx693aGcWMUuL&index=9)