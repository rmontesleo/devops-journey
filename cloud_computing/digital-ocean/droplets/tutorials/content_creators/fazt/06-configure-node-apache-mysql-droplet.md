# Digital Ocean, Subida de Aplicaciones de Nodejs & PHP, MySQL (Linux & Mac)


## Steps


### by curl
```bash
curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"ubuntu-apps-php-node-mysql-droplet",
        "size":"s-1vcpu-1gb",
        "region":"sfo3",
        "image":"ubuntu-22-04-x64",
        "vpc_uuid":"'$vpc_uuid'"}' \
    "https://api.digitalocean.com/v2/droplets"
```

### by doctl
```bash
doctl compute droplet create \
    --image ubuntu-22-04-x64 \
    --size s-1vcpu-1gb \
    --region sfo3 \
    --vpc-uuid $vpc_uuid \
    ubuntu-apps-php-node-mysql-droplet
```

###
```bash
#
ssh root@$virtualmachine-ip

#
ssh -i .ssh/$privateKey root@$virtualmachine-ip

```

###
```bash

# verify your system
cat /etc/os-release

# update your system
apt-get -y update  && apt-get -y upgrade

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# 
command -v nvm

source  ~/.bashrc

# 
command -v nvm

# install latest version of node
nvm install node


# 
mkdir projects

# 
cd projects

#
mkdir my-app

# 
cd my-app

#
npx express-generator

# 
npm install

#
npm audit --force

#
npm audit fix --force

npm star


```


```bash
#
cd ~/projects


git clone https://github.com/FaztWeb/first-node-express-app.git

cd first-node-express-app

npm install

npm audit fix

npm start

```


###
```bash

cd ~/projects

npm install pm2 -g

cd ~/projects/first-node-express-app

pm2 start src/index.js

pm2 list

# use the id of the application
pm2 show 0


pm2 stop 0

pm2 restart 0
```

###
```bash
ufw app list

ufw allow OpenSSH

ufw enable

ufw allow 3000

ufw reload
```

###
```bash
pm2 delete 0
pm2 list
```


### install lamp
```bash

# add require repository for php
sudo add-apt-repository ppa:ondrej/php

# update packages
apt-get update

# install apache2, php 7 and the library to integrate php with apache
apt-get install apache2 php7.0 libapache2-mod-php7.0  -y 

#
ufw allow http

#
ufw reload

cd /var/www/html

vim index.php
```


###
```php
<?php echo "Hello World of PHP";  ?>

```

###
```bash
cat index.php
mv index.html  index.html.bak

```

### install mysql
```bash
apt-get -y install mysql-server
```



--

## References

- [Digital Ocean, Subida de Aplicaciones de Nodejs & PHP, MySQL (Linux & Mac)](https://www.youtube.com/watch?v=z4SIkzGkDD0&list=PLL0TiOXBeDajr7MaBM4y4VszDu60SFHoO&index=1)

- [Your First Nodejs/Express Website](https://github.com/FaztWeb/first-node-express-app.git)


- [Node Version Manager](https://github.com/nvm-sh/nvm)

- [Express JS](https://expressjs.com/)

- [PM2](https://pm2.keymetrics.io/)

- [unable to locate package php7.0 and libapache2-mod-php7.0](https://askubuntu.com/questions/863627/unable-to-locate-package-php7-0-and-libapache2-mod-php7-0)