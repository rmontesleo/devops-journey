# Vue & Digital Ocean, Despliegue de Vue en la Nube

## Create the web application

###
```bash
npm install @vue-cli -g

vue --version

vue create fazt-20191022-blog-vue

# Select Manual, then choose only Babel an Router
# Then choose vue 2, Y in history and N in presets

# change in the new directory
cd fazt-20191022-blog-vue

# open con vscode
code .

# run the development serve
npm run serve

# open the proyect in localhost
curl http://localhost:8080

```

## Work on digital ocean

### create with curl
```bash
curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"ubuntu-vuejs-webapp-droplet",
        "size":"s-1vcpu-512mb-10gb",
        "region":"nyc1",
        "image":"ubuntu-22-04-x64",
        "vpc_uuid":"'$vpc_uuid'",
        "tags":["vuejs",
        "development"]}' \
    "https://api.digitalocean.com/v2/droplets"
```

### create with doctl
```bash
doctl compute droplet create \
    --image ubuntu-22-04-x64 \
    --size s-1vcpu-512mb-10gb \
    --region nyc1 \
    --vpc-uuid $vpc_uuid \
    --tag-names 'vuejs,development' \
    ubuntu-vuejs-webapp-droplet
```

###
```bash
# login in the droplet
ssh -i $ssh_key root@$droplet_ip

# update software catalog and update
sudo apt-get -y update && sudo apt-get -y upgrade


# install git
apt-get -y install git


#install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

source ~/.bashr

nvm --version

nvm install node


# install nginx
sudo apt-get -y install nginx

# verify index file
cd /var/www/html/

cat index.nginx-debian.html

# move to www folder
cd /var/www/

# clone the git project
git clone $git_web_project_repository

#
cd $web_project_repository

#
npm install

#
npm run build

# 
ls dist

# move to ngixn configuration
cd /etc/nginx/sites-available

# verify the content in this folder
ls -la

# edit de default file
vim default

```

### 
```bash

# in the default file find
root /var/www/html 

# change for the vue project
root /var/www/<CHANGE_FOR_THE_PROJECT_NAME>/dist
```

###
```bash
# verify the ngnix files are correct
nginx -t
```


###
```bash
cd /etc/nginx/sites-available

vim default
```

###
```yaml

# below server_name add
error_page 404 /;

```

```bash
sudo service nginx restart

nginx -t
```




## References

- [Vue & Digital Ocean, Despliegue de Vue en la Nube](https://www.youtube.com/watch?v=TbRU8hdjiNg&list=PLo5lAe9kQrwpvZYLL908Rx693aGcWMUuL&index=1)

- [JSON Placeholder](https://jsonplaceholder.typicode.com/)

- [data Must Be a Function](https://v2.vuejs.org/v2/guide/components.html#data-Must-Be-a-Function)

- [Node Version Manager](https://github.com/nvm-sh/nvm)



