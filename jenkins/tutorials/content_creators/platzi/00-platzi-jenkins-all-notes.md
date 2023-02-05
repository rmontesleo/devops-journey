

## Clase 03/15: Instalación y Configuración Básica de Jenkins

### Steps in console
```bash
# Update the system
apt-get -y update

# Install Java 8
apt-get install openjdk-8-jdk wget gnupg

# add jenkins repository
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

#
apt-get -y update

#
apt-get install git jenkins -y

# add a key for the installation user
ssh-keygen

#
service jenkins start

# 
service jenkins status

#
curl localhost:8080

# Get the password and use it in the browser to configure jenkins
cat /var/lib/jenkins/secrets/initialAdminPassword

```

### Steps in Browser
```html
- add user name
- add password
- confirm password
- add email
- add jenkins url ( its recomendable use a Domain name, for simple demo an IP, but production you MUST use an Domain name)
```

---

## Clase 04/15: Manejo Básico de Usuarios

```html
- manages users.
- Create user



```

---


## Clase 05/15: ¿Qué es un Job?

```html

```


---



## Clase 06/15:

---



## Clase 07/15:

---


## Clase 08/15:

---


## Clase 0/15:

---



## Clase 0/15:

---



## Clase 0/15:

---



## Clase 0/15:

---


## Clase 0/15:

---


## Clase 0/15:

---


## Clase 0/15:

---