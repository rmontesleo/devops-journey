# Install MySQL on Ubuntu in Digital ocean


##

### get vpcs
```bash
curl -X GET   -H "Content-Type: application/json"   \
-H "Authorization: Bearer $TOKEN" \
"https://api.digitalocean.com/v2/vpcs" | jq
```

### get your ssh keys
```bash
curl -X GET -H 'Content-Type: application/json' \
-H 'Authorization: Bearer '$TOKEN'' \
"https://api.digitalocean.com/v2/account/keys" | jq
```

### install with curl
```bash
curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"ubuntu-mysql-demo-droplet",
        "size":"s-1vcpu-2gb",
        "region":"sfo3",
        "image":"ubuntu-22-04-x64",
        "vpc_uuid":"'$vpc_uuid'"}' \
    "https://api.digitalocean.com/v2/droplets" | jq
```


### install with doctl
```bash
doctl compute droplet create \
    --image ubuntu-22-04-x64 \
    --size s-1vcpu-2gb \
    --region sfo3 \
    --vpc-uuid $vpc_uuid \
    ubuntu-mysql-demo-droplet
```

---

##


### connect
```bash
## use this if you connect with the default key
ssh root@$virtual_machine_ip

## use this if your key is another folder or other name
ssh -i .ssh/$private_key_name root@$virtual_machine_ip
```


### configuring system and user
```bash
#
cat /etc/os-release

# find updates and install the updates in the system
apt-get -y udate && apt-get -y upgrade

# create user in ubuntu
adduser $newUser

# add privileges to the new user
usermod -aG sudo $newUser

# copy the ssh key from root to the new user
rsync --archive --chown=$newUser:$newUser ~/.ssh /home/$newUser

```

### configuring firewall
```bash

#
ufw status

# 
ufw app list

# allow open ssh connections
ufw allow OpenSSH

# enable, activate the rules in ufw
ufw enable

# verify
ufw status

## exit from root
exit
```


### connect with the newUser
```bash
# use this if you are connecting with the default ssh key
ssh $newUser@$virtual_machine_ip

# use this if you are connecting with other ssh key
ssh -i .ssh/$private_key_name  $newUser@$virtual_machine_ip
```


### in the server install and configure mysql
```bash
# install mysql server
sudo apt-get install mysql-server -y

# verify status
systemctl status mysql


# when proving mysql connection, it dont ask by password
sudo mysql
```

### Inside the mysql client
```sql
SELECT user, authentication_string, plugin, host FROM mysql.user;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '<NEW_PASSWORD>';

FLUSH PRIVILEGES;

exit;
```

### continue with the configuration of mysql in the droplet
```bash
# we must configure the database
sudo mysql_secure_installation

# we will be prompt by password
mysql -u root -p

```

###
```sql

SELECT VERSION();

exit;
```

### connect again
```bash
mysql -u root -p
```

### working with the new configuration to create a database user
```sql
CREATE USER '<DB_USER>'@localhost IDENTIFIED BY '<NEW_COMPLICATED_PASSWORD>';

# SET PRIVILEGES ON ALL TABLES
GRANT ALL PRIVILEGES ON *.* TO '<DB_USER>'@'localhost' WITH GRANT OPTION;

exit;
```

###
```bash

# you can connect with root 
mysql -u root -p

# or your other user
mysql -u $db_user -p

```

###
```bash
# check if mysql service is working
systemctl status mysql

# you can stop
systemctl stop mysql


# verify the new status
systemctl status mysql


# start again the service
systemctl start mysql


# verify the version of mysql
mysqladmin -p -u root version
```

### steps to installl and run node application
```bash

# clone the git project
git clone https://github.com/fazt/nodejs-mysql-links.git

# install node version manager 
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# update configuration
source ~/.bashrc

# install last version ofnode 
nvm install node

## verify instalation
node --version

npm --version

# got to project directory
cd node-js-mysql-links

# install dependencies
npm install

# fix any posible issue
npm audit

# see fixes details
npm fund

npm run dev

```

### content of .env file
```bash
DATABASE_USER='<YOUR_DB_USER_NAME>'
DATABASE_PASSWORD='<YOUR_DB_USER_PASSWORD>'
DATABASE_NAME='<YOUR_DATABASE_NAME>'
DATABASE_HOST='127.0.0.1'
```



###
```bash
# allow port 4000 
sudo ufw allow 4000

# reload 
sudo ufw reload
```

### test your application on your localhost
```bash
curl "$virtual_machine_ip":4000
```

### modify authentication method in mysql
```bash
mysql -u $otherUser -p
```

### in the database client
```sql
SELECT user, authentication_string, plugin FROM mysql.user;

ALTER USER '<DB_USER>'@'localhost' IDENTIFIED 
WITH mysql_native_password BY '<NEW_COMPLICATED_PASSWORD>';

```


## REFERENCES

- [Mysql & DigitalOcean | Instalación de Mysql en Digitalocean](https://www.youtube.com/watch?v=fjAHGyF-5s4)

- [GitHub Project](https://github.com/fazt/nodejs-mysql-links)

- [Node Version Manager](https://github.com/nvm-sh/nvm)

- [Solución al error "Error: SET PASSWORD has no significance for user 'root'@'localhost' as ..."](https://blog.pleets.org/article/soluci%C3%B3n-al-error-set-password-has-no-significance-for-user)

- [Fix – MySQL ERROR 1819 (HY000): Your password does not satisfy the current policy requirements](https://ostechnix.com/fix-mysql-error-1819-hy000-your-password-does-not-satisfy-the-current-policy-requirements/)

- [Node.js MySQL - Error: connect ECONNREFUSED](https://stackoverflow.com/questions/30266221/node-js-mysql-error-connect-econnrefused)


