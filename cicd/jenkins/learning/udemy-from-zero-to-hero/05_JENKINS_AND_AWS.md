#

##

###
```bash
mkdir db_data
docker commpose up -d

# go inside the container
docker exec -it db bash

## inside the db container ###########
myaql -u root -p
show databases;
# exit from mysql client
exit
# exit from db container
exit
######################################

# go to remote-host container
docker exec -it remote-host bash


# change the dockerfile to version 2
# rebuild the docker image
docker compose build

# to take effect the changes execute again
docker compose up -d

# check the changes inside the container
docker exec -it remote-host bash
```








## References

- [Docker Hub Mysql](https://hub.docker.com/_/mysql)
- [Install or update the latest version of the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [Installing the AWS CLI on Linux](https://www.baeldung.com/linux/aws-cli-install)
- [How To Install MySQL on Rocky Linux 9](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-rocky-linux-9)