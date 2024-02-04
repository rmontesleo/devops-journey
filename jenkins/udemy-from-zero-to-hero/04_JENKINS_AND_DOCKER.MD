

### on remote host
```bash
## find how to install ssh server for centos 7, rocky 9 linux
sudo yum -y install openssh-server
```

### on localhost
```bash
# create your ssh key
ssh-keygen

# copy your public key to the remote host
ssh-copy-id -i your_public_key.pub  username@remote_host
```


```bash

# go to docker compose file
docker compose build 

docker images
docker ps

# start again the compose
docker compose up -d

# go inside the jenkins container
docker exec -it jenkins bash

## inside the container connect with the remote user
ssh remote_user@remote-host
############################################

# from server copy ssh key into jenkins container
cd rocky9
docker cp remote-key jenkins:/tmp/remote-key

## inside the jenkins container to the remote container
ssh -i /tmp/remote-key  remote_user@remote_host
########################################




```



## References

- [How to Set Up SSH Keys on Rocky Linux 9](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-rocky-linux-9)
- [Docker Hub Rocky Linux](https://hub.docker.com/_/rockylinux)
- [How to Add Users and Groups from the Command Line in Rocky Linux](https://ciq.com/blog/how-to-add-users-and-groups-from-the-command-line-in-rocky-linux/)