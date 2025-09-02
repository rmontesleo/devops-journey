# Chapter 2 : CI/CD Pipeline Using Git, Jenkins, and Maven


## Setup Jenkins Server

### Setup the Amazon EC2  Amazon Linux 2 AMI . Install Jenkins with  Java 11 (OpenJDK)
```bash
pwd

sudo amazon-linux-extras install epel

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y

sudo amazon-linux-extras install java-openjdk11

sudo yum install jenkins -y

sudo service jenkins status
sudo service jenkins start

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

```

### Setup the Amazon EC2  Amazon Linux 2 AMI . Install Jenkins with  Java 17 (Amazon Coreto)
```bash
pwd

sudo amazon-linux-extras install epel

sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y

sudo yum install java-17-amazon-corretto-headless

sudo yum install jenkins -y
sudo systemctl daemon-reload

sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

```

### Setup Ubuntu 22.04 LTS. Install Jenkins with Java 17 (OpenJDK)
```bash
sudo apt-get -y update

# Install Jenkins
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt-get update
sudo apt-get install jenkins -y

# Install Java
sudo apt update
sudo apt install openjdk-17-jre -y

# Star Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

```


### Setup on Rocky Linux



## Run First Jenkins Job


---

## Integrate  Git with Jenkins

```bash
cat /etc/hostname

yum install git -y

whereis git


```



---

## Run Jenkisn Job to Pull Code from GitHub


## Build a Java Project Using Jenkins