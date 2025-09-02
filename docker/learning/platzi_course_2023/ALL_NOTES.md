# Curso de Docker


## Introducción

### 1/32. Todo lo que aprenderás sobre Docker

- [Slides](https://static.platzi.com/media/public/uploads/slides-curso-docker_d04a71e1-4aa5-4b52-9dea-ba3ad2724202.pdf)



### 2/32. Las tres áreas en el desarrollo de software profesional


### 3/32. Virtualización

### 4/32. Preparando tu entorno de trabajo

```bash
#
docker --version

#
docker info



```

### 5/32. [Bonus] Play with Docker

- [Play with Docker](https://labs.play-with-docker.com/)


### 6/32. Qué es y cómo funciona Docker

---

## Contenedores

### 7/32. Primeros pasos: hola mundo


### 8/32. Conceptos fundamentales de Docker: contenedores


### 9/32. Comprendiendo el estado de Docker

```bash
#
docker run hello-world

# show only running containers
docker ps


# show all containers (stoped and running containers)
docker ps -a


#
docker inspect $container_id


docker inspect $container_name

#
docker run  --name hello-platzi  hello-world 

#
docker rename $old_name $new_name

#
docker rm [ $container_id | $container_name ]

# remove all stoped containers
docker container prune

```


### 10/32. El modo interactivo

```bash
# the container execute /bin/bash 
docker run ubuntu

# execute the /bin/bash in iterative mode
docker run -it ubuntu

```


### 11/32. Ciclo de vida de un contenedor

```bash

# override /bin/bash with /dev/null
docker run --name allwaysup -d ubuntu tail -f /dev/null

#
docker ps

#
docker exec -it allwaysup bash

# inside the container run
ps -aux

```

## you will see

- tail -f /dev/null
- bash
- ps -aux


###
```bash
#
process_id=$( docker inspect  --format '{{.State.Pid}}' allwaysup )

## in linux this works, but not in mac or windows
kill -9 $process_id


# 
docker ps -a


```

### 12/32. Exponiendo contenedores

```bash

#
docker run -d --name proxy nginx

#
docker stop proxy

#
docker rm -f proxy

# -p or --publish   [HOST_PORT]:[CONTAINER:PORT]
docker run --name -p 8080:80  proxy nginx

#
docker run -d --name -p 8080:80  proxy nginx

#
docker logs proxy

# -f follow the new logs
docker logs -f proxy

# take only the last 10 lines of the logs
docker logs --tail 10 -f proxy

```

---

## Datos en Docker

### 13/32. Bind mounts

####
```bash
#
mkdir dockerdata

#
cd dockerdata

#
docker run -d --name db mongo

#
docker exec -it db bash

mongo

```

```javascript
show dbs

use platzi

show dbs;

db.users.insert({"nombre":"Guido"})

db.users.find()

```

```bash
docker rm -f db
docker run -d --name db mongo
mongo
show dbs;
docker rm -f db
```

```bash

## create a bind mount
mkdir mongodata
cd mongodata
mongo_bind_mount=$(pwd)

# -v: bind mount, with the full path [LOCAL_MOUNT_DATA]:[CONTAINER_DATA]
docker run -d --name db -v $mongo_bind_mount:/data/db

#
docker ps

docker exec -it db bash

use platzi
show dbs;
db.users.insert({"nombre":"Guido"})
db.users.find()

exit

docker rm -f db

# run again
docker run -d --name db -v $mongo_bind_mount:/data/db

docker exec -it db bash
mongo
show dbs;
use platzi
db.users.find()

```


### 14/32. Volúmenes

####
```bash

# list all volumes
docker volume ls

#
docker volume create dbdata

#
docker volume ls

# if dbdata is not created previously , docker will create for us, then the value of dst (destiny) is /data/db
docker run -d --name db --mount src=dbdata,dst=/data/db

# with inspect we can see all the definition of the container
docker inspect db

dockder exec -it db bash

mongo
user platzi
db.users.insert({"nombre":"Guido"})
db.users.find()
exit

docker rm -f db
#
docker run -d --name db --mount src=dbdata,dst=/data/db

mongo
use platzi
db.users.fin()
```


### 15/32. Insertar y extraer archivos de un contenedor


#### The operations of copy can be executed even if the conatiner is stoped
```bash

cat prueba.txt

## run ubuntu, but I override the default command
docker run -d --name copytest ubuntu tail -f /dev/null

##
docker exec -it copytest bash
mkdir testing
exit

# docker cp <file_to_move> <container_name>:/<full_path>/<same_name_or_new_file_name>
docker cp prueba.txt copytest:/testing/test.txt


# docker cp  <name_of_the_container>:<full_path>  <name_for_local_directory_or_file>
docker cp  copytest:/testing localtesting

#
ls -la



```

---

## Imágenes

### 16/32. Conceptos fundamentales de Docker: imágenes

####
```bash
#
docker image ls 

#
docker images

docker pull

```

### 17/32. Construyendo una imagen propia

####
```bash

mkdir imagenes
cd imagenes
ll
touch Dockerfile
code .

```

#### 
```bash
FROM ubuntu:latest
RUN  touch /usr/src/hola-platzi.txt
```

####
```bash
#
docker build -t ubuntu:platzi .

#
docker images

#
docker run -it ubuntu:platzi

docker login

docker tag ubuntu:platzi $docker_username/ubuntu:platzi 

docker images

docker push $docker_username/ubuntu:platzi


```


### 18/32. El sistema de capas

####
```bash

docker history ubuntu:platzi

dive  ubuntu:platzi

```

#### 
```bash
FROM ubuntu:latest
RUN  touch /usr/src/hola-platzi.txt
RUN rm /usr/src/hola-platzi.txt
```

####
```bash
docker build -t ubuntu:platzi .
dive ubuntu:platzi
```


- [dive](https://github.com/wagoodman/dive)
- [docker commit](https://docs.docker.com/engine/reference/commandline/commit/)


---

## Docker como herramienta de desarrollo


### 19/32. Usando Docker para desarrollar aplicaciones

####
```bash

git clone https://github.com/platzi/docker

cd docker

```

####
```bash
# Base image is node version 12
FROM node:12

# copy all docs in the current context to /usr/src/
COPY [".", "/usr/src/"]

# move to the working directory
WORKDIR /usr/src

# install the project dependencies
RUN npm install

# expose the port 3000. Open , allow the port in container by this port
EXPOSE 3000

# define the default command to be executed when the container is run
CMD ["node", "index.js"]

```

####
```bash
docker build -t platziapp .

docker image ls

docker run --rm  -d -p 3000:3000 platziapp
```




### 20/32. Aprovechando el caché de capas para estructurar correctamente tus imágenes

####
```bash

# 
docker build -t platziapp .
```

#### version two of the Dockerfile
```bash
# when you change this version, it invalidate the rest of the layers and all the steps will be created again
FROM node:14

COPY ["package.json", "package-lock.json", "/usr/src/"]

WORKDIR /usr/src

RUN npm install

COPY [".", "/usr/src/"]

EXPOSE 3000

CMD ["npx",  "nodemon",  "index.js"]

```

### bash
```bash
local_volume=$(pwd)

# this fails because the dependencies are excluded
docker run -rm -p 3000:3000 -v   $local_volume:/usr/src platziapp

# this works
docker run -rm -p 3000:3000 -v   $local_volume/index.js:/usr/src/index.js platziapp
```


### 21/32. Docker networking: colaboración entre contenedores

####
```bash

docker network ls

```

#### Docker virtual nentwork

 - bridge: retrocompatibility with previous versions
 - host:  representation of our network in docker 
 - none:  When we want/need a container have no acces to internet or any network. Disble networking

####
```bash

#
docker network create --attachable  platzinet

#
docker network ls

#
docker network inspect platzinet

#
docker container prune

# 
docker run -d --name db mongo

# connect the container db to platzinet 
docker network connect platzinet db

#
docker network inspect

#
docker run -d --name app -p 3000:3000 --env MONGO_URL=mongodb://db:27017/test platziapp

#
docker network connect platzinet app


```

---


## Docker compose

### 22/32.

####
```bash

#
docker rm -f $(docker ps -aq)

#
docker-compose up 

#
docker-compose up -d

#
docker compose up -d
```

- [Install docker Compose](https://docs.docker.com/compose/install/)
- [class image](https://static.platzi.com/media/public/uploads/screenshot_20201108_170733_21a7d25e-41a7-46a4-b1d1-4af3cf69e8ed.png)



### 23/32. Subcomandos de Docker Compose

#### 
```bash
#
docker-compose up -d

#
docker network ls

#
docker-compose logs 

# add the name of the service name in this case app
docker-compose logs app

# seee the log of app and wait for more 
docker-compose logs app -f

# see the logs of two services
docker-compose logs app db -f

# The -it its not required when you are using compose
docker-compose exec app bash

#
docker-compose down

#
docker-compose down -v

```


### 24/32. Docker Compose como herramienta de desarrollo

#### Change the compose for development
```yaml
version: "3.8"

services:
  app:
    build: .
    environment:
      MONGO_URL: "mongodb://db:27017/test"
    depends_on:
      - db
    ports:
      - "3000:3000"

  db:
    image: mongo

```

####
```bash
#
docker-compose build

#
docker-compose up -d

#
docker ps

#
docker-compose build app

#
docker-compose up -d

```


```yaml
version: "3.8"

services:
  app:
    build: .
    environment:
      MONGO_URL: "mongodb://db:27017/test"
    depends_on:
      - db
    ports:
      - "3000:3000"
    volumes:
    	- .:/usr/src

  db:
    image: mongo

```

####
```bash
docker-compose logs app
```

#### conservar los node_modules del container
```yaml
version: "3.8"

services:
  app:
    build: .
    environment:
      MONGO_URL: "mongodb://db:27017/test"
    depends_on:
      - db
    ports:
      - "3000:3000"
    volumes:
    	- .:/usr/src
    	- /usr/src/node_modules

  db:
    image: mongo

```

```bash
docker-compose up -d
```

```yaml
version: "3.8"

services:
  app:
    build: .
    environment:
      MONGO_URL: "mongodb://db:27017/test"
    depends_on:
      - db
    ports:
      - "3000:3000"
    volumes:
    	- .:/usr/src
    	- /usr/src/node_modules
    command: npx nodemon index.js

  db:
    image: mongo

```

```bash
docker-compose up -d
```


### 25/32. Compose en equipo: override

####
```bash
touch docker-compose.override.yml 
```

### docker-compose.override.yml
```bash
version: "3.8"

services:
  app:
	build: .  
```

### docker-compose.override.yml
```bash
version: "3.8"

services:
  app:
	build: .  
	environment:
	  UNA_VARIABLE: "Hola Platzi"	
```


```bash
#
docker-compose up -d

#
docker-compose exec app bash

docker-compose down -v

# the first time, this will fail because only one port is available
docker-compose up -d --scale app=2
```

#### we must define a range of ports to use in scale
```bash
version: "3.8"

services:
  app:
    image: platziapp
    environment:
      MONGO_URL: "mongodb://db:27017/test"
    depends_on:
      - db
    ports:
      - "3000-3002:3000"

  db:
    image: mongo
```

```bash
docker-compose up -d --scale app=2

docker-compose down
```


---

## Docker Avanzado

### 26/32. Administrando tu ambiente de Docker

####
```bash
#
docker ps -a

#
docker container prune

#
docker rm -f $(docker ps -aq)

#
docker system prune

#
docker run -d --name app --memory 1g platziapp

# see how many resources are using docker and the containers
docker stats

#
docker run -d --name app2 --memory 4m platziapp

#
docker inspect app2

```

### 27/32. Deteniendo contenedores correctamente: SHELL vs. EXEC

####
```bash
cd avanzado/loop
docker build -t loop .

docker run -d --name looper loop
docker stop looper
docker ps -a

# show the last process if its working or not
docker ps -l
docker rm looper

docker run -d --name looper loop
docker kill looper
docker ps -a
docker rm looper

docker run -d --name looper loop

#
docker exec looper ps -ef
docker rm -f looper

```

#### change dockerfile, the shell is run like a subprocess (shell mode)
```bash
FROM ubuntu:trusty
COPY ["loop.sh", "/"]
CMD /loop.sh
```

#### change dockerfile, the shell runs directly (exec mode)
```bash
FROM ubuntu:trusty
COPY ["loop.sh", "/"]
CMD ["/loop.sh"]
```

####
```bash
docker build -t loop .
docker run -d --name looper loop
docker exec looper ps -ef
docker stop looper
docker ps -l

```


### 28/32. Contenedores ejecutables: ENTRYPOINT vs CMD

####
```bash
cd ping
docker build -t ping .
docker run --name pinger ping 
docker rm pinger

# override the default command and execute hostname
docker run --name pinger ping hostname 

```

### The original image
```bash
FROM ubuntu:trusty
CMD ["/bin/ping", "-c", "3", "localhost"]
```


### ENTRYPOINT , default command to be executed in container
### CMD, the parameter for ping in this case localhost
```bash
FROM ubuntu:trusty
ENTRYPOINT ["/bin/ping", "-c", "3"]
CMD ["localhost"]
```

####
```bash
docker rm -f $(docker ps  -aq)
docker build -t ping .

## ping to localhost
docker run --name pinger ping
docker ps -l

docker run --name pinger2 ping google.com
docker ps -l
```

### 29/32. El contexto de build

####
```bash


docker run -d -rm --name app prueba
docker exec -it app bash

```

### 30/32. Multi-stage build

####
```bash
# build with other dockerfile in a differen folder
docker buidl -t prodapp -f build/production.Dockerfile .

docker run -d --name prod prodadd

docker ps -a

docker exec -it prod bash


```

### 31/32. Docker-in-Docker

### Carefull with this point

####
```bash
# Docker in docker
docker run -it  --rm -v /var/run/docker.sock:/var/run/docker.sock docker:19.03.12

docker ps

docker run -d --name app02 prodapp 


docker run -it  --rm -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/bin/docker wagoodman/dive:latest prodadd


```




---

## Cierre

### 32/32. Cierre del curso

####
```bash

```
