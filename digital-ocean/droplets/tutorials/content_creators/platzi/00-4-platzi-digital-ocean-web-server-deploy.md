# Platzi




## Clase 19: Instalacion de Nginx en un Droplet 

#### Create the basic server
```bash

# get vpcs
curl -X GET   -H "Content-Type: application/json"   \
-H "Authorization: Bearer $TOKEN" \
"https://api.digitalocean.com/v2/vpcs" | jq


# get ssh_id_keys
curl -X GET -H 'Content-Type: application/json' \
-H 'Authorization: Bearer '$TOKEN'' \
"https://api.digitalocean.com/v2/account/keys"  | jq


# with curl
curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"backend-server-droplet",
        "size":"s-1vcpu-1gb",
        "region":"sfo3",
        "image":"ubuntu-22-10-x64",
        "vpc_uuid":"'$vpc_uuid'",
        "ssh_keys": [ "'$ssh_id_key'"  ],
        "tags":["web"]}' \
    "https://api.digitalocean.com/v2/droplets" | jq


# with doctl
doctl compute droplet create \
    --image ubuntu-22-10-x64 \
    --size s-1vcpu-1gb \
    --region sfo3 \
    --vpc-uuid $vpc_uuid \
    --tag-names 'web' \
    backend-server-droplet

# login to the new droplet    
ssh -i  $connection_ssh_key root@$web_droplet_ip
```

#### inside the droplet
```bash
# update and upgrade the droplet
apt-get -y update && apt-get -y upgrade

# install nginx
apt-get -y install nginx

# verify if nginx is installed
systemctl status nginx

# check the default nginx hello world
ls /var/www/html/

# see the content of the file
cat /var/www/html/index.nginx-debian.html


```


## Clase 20: Recomendaciones 

####
```

```


## Clase 21: Instalacion de PHP en un Droplet 


####
```bash

ssh -i $connection_ssh_key  root@$backend_server_droplet_ip

#---

# add repository
add-apt-repository universe

# install php and php mysql driver
apt-get install -y php-fpm php-mysql

# verify the php service is running
systemctl | grep php 


# edit the php configuration file
vim /etc/php/8.1/fpm/php.ini

```

#### some settings in this php.ini file
```bash
# Change memory_limit from 128M a 256M
memory_limit = 256M

# increment the timeout of execution process from 30 seconds to 30 minuts (1800s)
max_execution_time = 1800

```

####
```bash

# reload php
systemctl reload php8.1-fpm.service

# verify the php service is running
systemctl | grep php


# edit nginx to allow the php files
vim /etc/nginx/sites-available/default

```

### edit the default file and save it
```bash

## comment the line  
# try_files $uri $uri/ =404;

## uncomment the lines 
location ~ \.php$ {
    include snippets/fastcgi-php.conf;

    fastcgi_pass unix:/run/php/php7.4-fpm.sock;

}

# uncomment the lines
location ~ /\.ht {
    deny all;
}

```

### 
```bash

# validate the nginx configuration
nginx -t

# reload configuration
systemctl reload php8.1-fpm.service

# validate the nginx configuration
nginx -t

# reload the nginx service
systemctl reload nginx.service

# go to web directory
cd /var/www/html

# create a php info file
vim prueba.php

```


### content of prueba.php
```php
<?php
    phpinfo();
?>
```

### fix configuration default  file
```bash
vim /etc/nginx/sites-available/default
```

### 
```bash

# add the index.php to the list
index index.php  index.html index.htm index.nginx-debian.html;

# fix the socket with the right version of php
fastcgi_pass unix:/run/php/php8.1-fpm.sock;

```

###
```bash
# verify the proces of ngnix
nginx -t

# reload php
systemctl reload php8.1-fpm.service

# verify nginx
nginx -t

# reload nginx service
systemctl reload nginx.service


```



## Clase 22: Instalacion de Mysql en un Droplet 

#### list your vpc and your ssh
```bash

# get vpcs
curl -X GET   -H "Content-Type: application/json"   \
-H "Authorization: Bearer $TOKEN" \
"https://api.digitalocean.com/v2/vpcs" | jq


# get ssh_id_keys
curl -X GET -H 'Content-Type: application/json' \
-H 'Authorization: Bearer '$TOKEN'' \
"https://api.digitalocean.com/v2/account/keys"  | jq

```


#### create with curl
```bash
# add tags in the droplet creation

curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"database-server-droplet",
        "size":"s-1vcpu-1gb",
        "region":"sfo3",
        "image":"ubuntu-22-04-x64",
        "ssh_keys": [ "'$ssh_id_key'"  ],
        "vpc_uuid":"'$vpc_uuid'"}' \
    "https://api.digitalocean.com/v2/droplets" | jq
```

#### create with doctl
```bash
# verify how to appas the ssh_key...
# add tags in the droplet creation

doctl compute droplet create \
    --image ubuntu-22-04-x64 \
    --size s-1vcpu-1gb \
    --region sfo3 \
    --vpc-uuid $vpc_uuid \
    database-server-droplet
```

####
```bash

# login with your ssh key
ssh -i $connection_ssh_key root@$database_server_droplet_ip

# update the droplet
apt-get -y update && apt-get -y upgrade

# install mysql server
apt-get -y install mysql-server

# TODO: review how to configure the database security.

# --- after that

myslq -u root 

```


####
```sql
grant all privileges on *.* to '<new_sql_user>'@'<PRIVATE_IP>' identified by '<A_NEW_PASSWORD>';

flush privileges;

exit;
```


#### 
```bash

# edit mysql.cnf file
vim /etc/mysql/mysql.conf.d/mysql.cnf


```

#### comment the line
```bash
# bind-address = 127.0.0.1
```


####
```bash

# restart the mysql service
/etc/init.d/mysql restart

# vallidate connecting with the new user
mysql -u <NEW_USER> -p

# but.. you can not connect from this droplte to mysql

```



#### in the backend server install mysql client
```bash
# validate the version of the client to install
apt-get -y install mysql-client-core-8.0


# login to mysql server
mysql -u <NEW_USER> -h <PRIVATE_IP_DB_DROPLET> -p


```


####
```sql
create database curso;

exit;
```





## Clase 23: Instalacion de Wordpress en un Droplet 


#### inside the backend server
```bash
# copy the url of wordpress.org
https://wordpress.org/latest.zip

cd /var/www/html/

rm prueba.php index.nginx-debian.html

wget https://wordpress.org/latest.tar.gz

tar -xzvf latest.tar.gz


mv wordpress/* .

rm -rf latest.tar.gz wordpress/

# give access to the user www-data
chown -R www-data .

ls -lah

## go to url of the droplet and configure wordpress

# set databse user
# set database password
# set private ip from the droplet
# set prefix of each table
# send...


```

####
```bash

```

####
```bash

```

####
```bash

```


---

## References

- [How To Secure Nginx with Let's Encrypt on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04)

- [Point to DigitalOcean Nameservers From Common Domain Registrars](https://docs.digitalocean.com/tutorials/dns-registrars/)

- [How to install WordPress](https://wordpress.org/documentation/article/how-to-install-wordpress/)

- [wordpress.org](https://wordpress.org/)

- [wordpress.com](https://wordpress.com/)

- [How To Install Nginx on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-18-04)

- [How To Install MySQL on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04)


- [FastCGI Process Manager (FPM)](https://www.php.net/manual/en/install.fpm.php)


- [VPCs](https://docs.digitalocean.com/reference/api/kafka-beta-api-reference/#tag/VPCs)


- [doctl vpcs list](https://docs.digitalocean.com/reference/doctl/reference/vpcs/list/)

- [How do I start with Node.js after I installed it?](https://nodejs.org/en/docs/guides/getting-started-guide/)


- [How To Find Out Nginx Version using command line](https://www.cyberciti.biz/faq/unix-linux-bsd-display-nginx-version/)

- [Digital Ocean Market Place. NodeJS](https://marketplace.digitalocean.com/apps/nodejs?utm_medium=marketplace&utm_source=marketplace&utm_campaign=marketplace&utm_content=no_image)


- [Volumes Block Storage](https://docs.digitalocean.com/products/volumes/)

- [How to Install the DigitalOcean Metrics Agent](https://docs.digitalocean.com/products/monitoring/how-to/install-agent/)

- [How to Enable VPC Networking on Existing Droplets](https://docs.digitalocean.com/products/networking/vpc/how-to/enable/)

- [How to Upload SSH Public Keys to a DigitalOcean Team](https://docs.digitalocean.com/products/droplets/how-to/add-ssh-keys/to-team/)

- [How-to Add SSH Keys to New or Existing Droplets](https://docs.digitalocean.com/products/droplets/how-to/add-ssh-keys/)

- [How to Customize Your Ubuntu Kernel](https://www.howtogeek.com/191/how-to-customize-your-ubuntu-kernel/)