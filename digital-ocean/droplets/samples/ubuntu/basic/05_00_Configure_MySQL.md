# Install MySQL 


## Install MySQL 8 on Ubuntu 22.04 LTS


### Install MySQL
```bash

# Verify you Linux distribution
cat /etc/os-release

# find updates and install the updates in the system
apt-get -y update 

# install mysql server
sudo apt-get install mysql-server -y

# verify status
systemctl status mysql

# when proving mysql connection, it dont ask by password
sudo mysql

```

### Inside the mysql client
```sql

-- Verify the version of mysql
SELECT VERSION();

-- Verify the mysql.user table
SELECT user, authentication_string, plugin, host FROM mysql.user;

-- Change the password of the root user in localhost
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '<NEW_PASSWORD>';

FLUSH PRIVILEGES;

exit;
```

### execute the mysql_secure_installation in the droplet
```bash
# we must configure the database
sudo mysql_secure_installation

#

# we will be prompt by password
mysql -u root -p

```

### working with the new configuration to create a database user
```sql
-- CREATE A NEW USER    
CREATE USER '<DB_USER>'@localhost IDENTIFIED BY '<NEW_COMPLICATED_PASSWORD>';

-- SET PRIVILEGES ON ALL TABLES
GRANT ALL PRIVILEGES ON *.* TO '<DB_USER>'@'localhost' WITH GRANT OPTION;

exit;
```

###  you can connect with root or the new user
```bash

# If you want to connect with root
mysql -u root -p

# If you wnt to connect with the $db_user
mysql -u $db_user -p

```

### Basic administration of MySQL
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

## References

- [How To Install MySQL on Ubuntu 22.04](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-22-04)