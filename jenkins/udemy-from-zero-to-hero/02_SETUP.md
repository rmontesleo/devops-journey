

## TODO List
- change the local volume to volume in docker
- install docker and docker compose on rocky 9
- create an ssh key to access to virtual machine

## 
Instead use Cent0S 7, I used Rocky 9 Linux (In February of 2024)

##
```bash
# to check the ip address
ip a

# verify you have internet connection
ping google.com

```



## Setup docker image for Jenkins
```bash
docker pull jenkins/jenkins
docker images
#
docker info | grep -i root

#
sudo du -sh /var/lib/docker

mkdir jenkins-data
ls
cd jenkins-data
vim docker-compose.yml

```

### create a docker file for Jenkins (update to version 2 of docker compose)
```yaml
#version: '3'
services:
  jenkins:
  	container_name: jenkins
  	image: jenkins/jenkins
  	ports:
  	  - "8080:8080"
  	volumes:
  	  - "$PWD/jenkins_home:/var/jenkins_home"
  	networks:
  	  - net

networks:
  net:

```

###
```bash
mkdir jenkins_home
ls -la
id

# give permissions to jenkins home in recursive mode
sudo chown 1000:1000 jenkins_home -R
ls -la

#
docker compose up -d
docker ps
docker logs -f jenkins

ip a
```

###



### 13 Add a local DNS for jenkins in hosts file  map the ip with jenkins.local

### 15 
```bash
# stop docker compose
docker compose stop

# start again the docker compose
docker compose start

# restart the jenkins container
docker compose restart jenkins

```


## Resources

- [Jenkins](https://jenkins.io)
- [VirtualBox](https://www.virtualbox.org/)
- [GitHub Repository](https://github.com/ricardoandre97/jenkins-resources)
- [How To Install and Use Docker on Rocky Linux 9](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-rocky-linux-9)
- [How To Install and Use Docker Compose on Rocky Linux 9](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-rocky-linux-9)
- [Install Docker Engine on CentOS](https://docs.docker.com/engine/install/centos/)
- [Jenkins Official Docker Image](https://hub.docker.com/r/jenkins/jenkins)
- [Jenkins - Docker](https://www.jenkins.io/doc/book/installing/docker/)
- [Docker Compose overview](https://docs.docker.com/compose/)