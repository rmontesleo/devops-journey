# Creating image

### Create your Dockere file
```bash
touch Dockerfile
``` 

### Basic structure
```yaml
FROM <IMAGE_SOURCE>

RUN <COMMANDS_TO_EXECUTE>
```

###
```yaml
FROM ubuntu

RUN touch /usr/src/hello-world
```


### to create the image -t TAR
```bash
docker build -t <IMAGE_NAME>:<OUR_VERSION_NAME> <CONTEXTO_BUILD>

docker build -t ubuntu:rmleo-v1 .
```

### to run our image
```bash
docker run -it ubuntu:rmleo-v1
```

## make push our image, but we are not owners in main repository, it will send an error
```bash
$ docker push ubuntu:rmleo-v1
```

### dennied request to repository 
```bash
The push refers to repository [docker.io/library/ubuntu]
denied: requested access to the resource is denied
```

### set a variable with your docker user name
```bash
export DOCKER_USERNAME=<YOUR_DOCKER_USER_NAME>
```

### we must add a new tag to our image
```bash
docker tag <IMAGE_NAME>:<OUR_VERSION_NAME> <DOCKER_USER>/<IMAGE_NAME>:<OUR_VERSION_NAME>
docker tag ubuntu:rmleo-v1 $DOCKER_USERNAME/ubuntu:rmleo-v1
```

### Logout 
```bash
docker logout
```

### Login to dockerhub
```bash
docker login
```

## we must push to our repository, like in github
```bash
docker push $DOCKER_USERNAME/$IMAGE_NAME:$OUR_VERSION_NAME
docker push $DOCKER_USERNAME/ubuntu:rmleo-v1
```

---

### layer system

### review our version layers
```bash
docker history [IMAGE_NAME]:[OUR_VERSION_NAME]
docker history ubuntu:rmleo-v1
```

