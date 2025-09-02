## Explore Docker state

### check the state of containers ,only active
```bash
docker ps
```

### all containers
```bash
docker ps -a
```

# inspect a container, returns a json
```bash
docker inspect [CONTAINER_NAME | CONTAINER_ID | FIRST_3_CHARS_OF_ID]
```

### inspect but use a filter
```bash
docker inspect -f '{{ json.Config.Env }}' [CONTAINER_NAME | CONTAINER_ID | FIRST_3_CHARS_OF_ID]
```

### rename containers, but every container must be unique name
```bash
docker rename [ORIGINAL_CONTAINER_NAME] [NEW_NAME]
```

### show log
```bash
docker logs [CONTAINER_NAME | CONTAINER_ID | FIRST_3_CHARS_OF_ID]
```

### delete container
```bash
$ docker rm [CONTAINER_NAME | CONTAINER_ID | FIRST_3_CHARS_OF_ID]
```

### show all containers id
```bash
docker ps -aq
```

### delete all containers
```bash
docker rm $(docker ps -aq)
```
---

## Iterative mode

# run ubuntu, check what happend
```bash
docker run ubuntu
```

### run in iterative mode ubuntu, this run again
```bash
docker run -it --name my-ubuntu  ubuntu
```

---

## docker assign the container id like hostname 

### details of linux we are running
```bash
`root@<CONTAINER_ID>:/#`  uname -a
```
### linux version
```bash
`root@<CONTAINER_ID>:/#`  cat /etc/lsb-release
```
---


### stop container
```bash
docker stop my-ubuntu
```

### start container
```bash
docker start my-ubuntu
```

### exec again, iterative mode and run bash , and return the bash of the linux

```bash
docker exec -it my-ubuntu bash
```

---


### kill the process
```bash
docker kill [CONTAINER_NAME | CONTAINER_ID | FIRST_3_CHARS_OF_ID]
```

### force to remove the container
```bash
docker rm -f [CONTAINER_NAME | CONTAINER_ID | FIRST_3_CHARS_OF_ID]
```
---

### 10) Expose container to outer world

```text
Los contenedores están aislados del sistema y a nivel de red, cada contenedor tiene su propia stack de net y sus propios puertos.
Debemos redirigir los puertos del contenedor a los de la computadora y lo podemos hacer al utilizar este comando:
```

```bash
docker run -d --name server -p 8080:00  nombreDelContenedor
```
---

- run a container with detache mode -d , release the terminal
- return the sha value of the container

```bash
docker run -d --name server nginx
```

- we need to tell outer port to iner port
- from port 8080 call port 80 of nginx
- and we are running a web server
- we only can use each port once

```bash
docker run -d --name server -p 8080:80 nginx
```
