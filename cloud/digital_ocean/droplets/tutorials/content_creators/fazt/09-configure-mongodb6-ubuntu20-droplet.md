# Install MongoDB 6 on ubuntu 20.04 LTS

##

### create with curl
```bash
curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"ubuntu20-mongodb-droplet",
        "size":"s-2vcpu-4gb",
        "region":"sfo3",
        "image":"ubuntu-20-04-x64",
        "vpc_uuid":"'$vpc_uuid'"}' \
    "https://api.digitalocean.com/v2/droplets"
```


### create droplet with doctl
```bash
doctl compute droplet create \
    --image ubuntu-20-04-x64 \
    --size s-2vcpu-4gb \
    --region sfo3 \
    --vpc-uuid $vpc_uuid \
    ubuntu20-mongodb-droplet
```

###
```
ssh root@$virtualmachine-ip

ssh -i ~/.ssh/$sshKey  root@$virtualmachine-ip
```


### update program list and then update the system
```
#
sudo apt-get -y update && sudo apt-get -y upgrade
```

### install mongodb
```bash

# Step 1
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -

# Step 2
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

# Step 3
sudo apt-get update

# Step 4
sudo apt-get install -y mongodb-org

```


### Configuring
```bash

# verify the status
sudo service mongod status

# start mongod service
sudo service mongod start

# verify again the status
sudo service mongod status

```


### test mongo and configure to allow remote connections
```bash

#
mongo

# get info from the droplet
lsb_release -cd; getconf LONG_BIT ; hostname -I


# 
hostname -I

#
sudo vim /etc/mongod.conf 


```

# find network interfaces and add the ip of your droplet
```yaml
net:
  port: 27017
  bindIp: 127.0.0.1,<DROPLET_IP_WHITHOUT_SPACES>

```

###
```bash

#
sudo service mongod restart

#
sudo service mongod status


```


### on client
```bash

# test connection on remote client
mongo --host $virtualmachine-ip

#
git clone https://github.com/FaztWeb/express-mongodb-crud.git


#
cd express-mongodb-crud.git

# 
npm install

#
npm run dev

# execute the application

```


### verify in droplet
```bash

mongo

show databases;

use <APPLICATION_DATABASE>

show collections

db.<COLLECTION>.find().pretty();

```




---

## References

- [MongoDB, Instalación en DigitalOcean y acceso remoto (VPS)](https://www.youtube.com/watch?v=gdnWRVQci8Q&list=PLo5lAe9kQrwpvZYLL908Rx693aGcWMUuL&index=5)

- [CRUD with Nodejs, Express and Mongodb](https://github.com/FaztWeb/express-mongodb-crud)

- [MongoDB](https://www.mongodb.com/)

- [MongoDB Documentation](https://www.mongodb.com/docs/)

- [Install MongoDB V6](https://www.mongodb.com/docs/v6.0/installation/)

- [Install MongoDB V4](https://www.mongodb.com/docs/v4.4/tutorial/install-mongodb-on-ubuntu/)

- [Install MongoDB Community Edition on Ubuntu](https://www.mongodb.com/docs/v6.0/tutorial/install-mongodb-on-ubuntu/)

- [MongoDB University](https://learn.mongodb.com/)