# Nodejs Deploy | DigitalOcean, Nginx, PM2, y SSL con Let's Encrypt (Certbot)



## 


### curl
```bash
curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"ubuntu-node-nginx-droplet",
        "size":"s-1vcpu-1gb",
        "region":"nyc1",
        "image":"ubuntu-22-04-x64",
        "vpc_uuid":"'$vpc_uuid'"}' \
    "https://api.digitalocean.com/v2/droplets"
```


### doctl
```bash
doctl compute droplet create \
    --image ubuntu-22-04-x64 \
    --size s-1vcpu-1gb \
    --region nyc1 \
    --vpc-uuid $vpc_uuid \
    ubuntu-node-nginx-droplet
```


### 
```bash
ssh root@$virtualmachine_ip

ssh -i ~/.ssh/$sshKey root@$virtualmachine_ip
```

### 
```bash
# verify system
cat /etc/os-release

# update 
sudo apt-get -y update && sudo apt-get -y upgrade

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

#
nvm


#
source ~/.bashrc

#
nvm

# to install the latest node version
nvm install node

# to install the LTS version
nvm install node --lts

#
git --version

#
mkdir projects

# 
cd projects

#
git clone $fazt-project

# verify the download projec
ls


# change to the project dirctor
cd $fazt-project

# 
ls

# 
npm install


#
npm start

```

### 
```bash

#
curl $virtualmachine-ip

#
curl $virtualmachine-ip:3000



```

### install pm2 to manage node proejcts
```bash

#
npm install pm2 -g

#
pm2 --version

#
cd ~/projects/$fazt-project

#
pm2 start src/index.js --name $applicationName

#
pm2 startup

#
pm2 save


```

### security considerations
```bash

#
sudo ufw status

#
sudo ufw enable

#
sudo ufw status

#
sudo ufw app list

#
sudo ufw allow ssh

# 
sudo ufw allow http

#
sudo ufw allow https

#
sudo ufw reload


```


### nginx configuration
```bash
#
sudo apt-get install nginx -y

#
cd /etc/nginx/sites-available

#
ls

#
cat default

#
cd

#
vim /etc/nginx/sites-available/fazttech.store

```

### then nginx configuration
```bash
server {
	listen 80;

	server_name fazttech.store www.fazttech.store

	location / {
		proxy_pass http://localhost:3000;
		proxy_http_version 1.1;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection 'upgrade';
		proxy_set_header Host $host;
		proxy_cache_bypass $http_upgrade;
	}
}


```

### 
```bash

# validate the configuration
nginx -t

# create a link from sites-available to sites-enabled
ln -s /etc/nginx/sites-available/fazttech.store /etc/nginx/sites-enabled/fazttech.store

# 
nginx -t

# restart nginx
sudo service nginx restart

#
sudo service nginx status

# cerebot clasic was deprecated on ubuntu 20.04

#
sudo snap install core; sudo snap refresh core

#
sudo apt remove certbot

#
sudo snap install --classic certbot

#
sudo ln -s /snap/bin/certbot /usr/bin/certbot



# add ssl
sudo certbot --nginx -d fazttech.store -d www.fazttech.store


# if you want to renew the ssl 
cerbot renew --dry-run


```

## TODOS

- see how to create a domain
- install the ssl to this domain


## References

- [Nodejs Deploy | DigitalOcean, Nginx, PM2, y SSL con Let's Encrypt (Certbot)](https://www.youtube.com/watch?v=6qR_EpxadMo&list=PLo5lAe9kQrwpvZYLL908Rx693aGcWMUuL&index=7)

- [Your First Nodejs/Express Website](https://github.com/FaztWeb/first-node-express-app)


- [How To Secure Nginx with Let's Encrypt on Ubuntu 22.04](https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-22-04)


- [Node Version Manager](https://github.com/nvm-sh/nvm)

- [PM2](https://pm2.keymetrics.io/)

- [NGINX](https://www.nginx.com/)

- [namecheap](https://www.namecheap.com/)

- [Let's Encrypt](https://letsencrypt.org/)