# Configure Jenkins on Digital Ocean

```text
This installations methods were tested on Ubuntu 18.04LTS , 20.04 LTS and Ubuntu 22.04 LTS on february 2023.
```


## Create the droplets

### create with curl
```bash
curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"ubuntu-jenkins-droplet",
        "size":"s-1vcpu-2gb",
        "region":"sfo3",
        "image":"ubuntu-22-04-x64",
        "vpc_uuid":"'$vpc_uuid'",
        "tags":["devops",
        "jenkins",
        "ubuntu"]}' \
    "https://api.digitalocean.com/v2/droplets"
```

### create with doctl
```bash
doctl compute droplet create \
    --image ubuntu-22-04-x64 \
    --size s-1vcpu-2gb \
    --region sfo3 \
    --vpc-uuid $vpc_uuid \
    --tag-names 'devops,jenkins,ubuntu' \
    ubuntu-jenkins-droplet
```

---


## Install with Digital Ocean Instructions

### Setup and configure to install Jenkins using an script `init_jenkins_digital_ocean.sh`
```bash
#!/bin/bash

# Update the system
sudo apt-get -y update

# Install JRE
sudo apt install -y default-jre

# Install JDK
sudo apt install -y default-jdk


# add jenkins repository key
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg

# append the Debian package repository address to the server’s
sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Update the repositories
sudo apt-get -y update

# Install Jenkins
sudo apt-get install jenkins -y


# Verify jenkins service
sudo systemctl start jenkins.service


# Test the jenkins service is responding
curl localhost:8080

# Get the password and use it in the browser to configure jenkins
export initial_password=$( cat /var/lib/jenkins/secrets/initialAdminPassword )

cat "Password is $initial_password "

echo "###### End of installation ######"

```


### post installation
```bash

sudo ufw allow 8080

sudo ufw reload

sudo ufw status
```


## Install with Jenkins Instructions


### Script to install Jenkins with Java 11 `init_jenkins_jenkins.sh`
```bash
#!/bin/bash

# Update packages
sudo apt update

# Install Java 11
sudo apt install openjdk-11-jre -y

#
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

#
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

#
sudo apt-get update

#
sudo apt-get install jenkins -y

#
sudo systemctl enable jenkins

#
sudo systemctl start jenkins

#
sudo systemctl status jenkins

#
curl localhost:8080

#
export initial_password=$(cat /var/lib/jenkins/secrets/initialAdminPassword) 

#
echo "Initial password is $initial_password "

```


### post installation
```bash

sudo ufw allow 8080

sudo ufw reload

sudo ufw status
```


---

## Another way to install

### With Java 11:  init_jenkins_jdk_11.sh
```bash
#!/bin/bash

sudo apt update

sudo apt install -y openjdk-11-jdk

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -


sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt update

sudo apt install -y jenkins

systemctl status jenkins

#
curl localhost:8080

#
export initial_password=$(cat /var/lib/jenkins/secrets/initialAdminPassword) 

#
echo "Initial password is $initial_password "

```


### With Java 17: init_jenkins_jdk_17.sh
```bash
#!/bin/bash

sudo apt update

sudo apt install -y openjdk-17-jdk

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -


sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt update

sudo apt install -y jenkins

systemctl status jenkins

#
curl localhost:8080

#
export initial_password=$(cat /var/lib/jenkins/secrets/initialAdminPassword) 

#
echo "Initial password is $initial_password "

```


## References

- [Jenkins compatibility & Java 8 update](https://community.jenkins.io/t/jenkins-compatibility-java-8-update/3088/2)

