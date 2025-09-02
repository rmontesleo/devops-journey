#


## Create the project on your local computer


### create a basic project on your local computer
```bash

node --version

mkdir hello-world-express

cd hello-world-express

npm init -y

npm i express

vim index.js
```

### basic server, the content of index.js
```javascript

const express = require('express');
const app = express();

app.get('/', (request, response)=> response.send('Hello World!') );

app.listen(3000);
console.log('Server on port ', 3000 );

```

####
```bash
node index.js
```


### 
```bash
git init

vim .gitignore
```

### the content of .gitignore
```bash
node_modules

.env
```

### 
```bash
#
git init

#
git add .


#
git commit -m "Initial commit"


# create your project on github


# activate your ssh key to github


# add your remote origin

# 
git push origin main
```
---

## Star working with digital ocean



### curl
```bash
curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"ubuntu22-hello-express-droplet",
        "size":"s-1vcpu-1gb",
        "region":"sfo3",
        "image":"ubuntu-22-04-x64",
        "vpc_uuid":"'$vpc_uuid'"}' \
    "https://api.digitalocean.com/v2/droplets"

```


### doctl
```bash
doctl compute droplet create \
    --image ubuntu-22-04-x64 \
    --size s-1vcpu-1gb \
    --region sfo3 \
    --vpc-uuid f6d68f91-0fb2-4d90-9d57-bdecc3668011 \
    ubuntu22-hello-express-droplet
```

### 
```bash
#
ssh  root@$virtualmachine-ip

#
ssh -i  ~/.ssh/$sshKey root@$virtualmachine-ip 

```


###
```bash

#
cat /etc/os-release

#
sudo apt-get -y update && sudo apt-get -y upgrade


# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# 
source ~/.bashrc

# test nvm
nvm

# install the last version of node
nvm install node


#
node --version


#
git --version

#
mkdir projects

#
cd projects


#
git clone $your_github_project

#
cd $your_github_project

#
npm install


# 
node index.js


```

### working with pm2
```bash

# install globally the pm2
npm install  -g pm2

cd  ~/projects/$your_github_project

# look for the main file of the application
pm2 start index.js


# if the server restart, the application also will restart
pm2 startup systemd

# check the status
sudo systemctl status pm2-root

#
sudo systemctl start pm2-root

#
pm2 list

```

### working with nginx
```bash

#
sudo apt-get install -y nginx

# configure
cd /etc/nginx/sites-available/

# see the file defautl
ls

#
vim default

```

### look for
```bash

server_name _;

location / {
	try_files $uri $uri/ =404;

}
```

### change for. When the root is visited, redirect to localhost:3000 and update headers
```bash
server_name _;

location / {

	proxy_pass http://localhost:3000;
	proxy_http_version 1.1;
	proxy_set_header Upgrade $http_upgrade;
	proxy_set_header Connection 'upgrade';
	proxy_set_header Host $host
	proxy_cache_bypass $http_upgrade;
}
```

### continue the configuratio
```bash

# validate the content of default file
nginx -t


# restart the server
sudo systemctl restart nginx

# see the status of ngnix
sudo systemctl status nginx


```



---


## REFERENCES

- [Nodejs & DigitalOcean | Subida de Aplicacion con SSH, PM2 y nginx](https://www.youtube.com/watch?v=gmfUNDmJDuk&list=PLo5lAe9kQrwpvZYLL908Rx693aGcWMUuL&index=3)

- [Node Version Manager](https://github.com/nvm-sh/nvm)

- [PM2](https://pm2.keymetrics.io/)

- [PM2 Cheat sheet](https://khoirul.id/java-process-manager-2-pm2-cheat-sheet/)