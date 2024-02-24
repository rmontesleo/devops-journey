# Data in Docker

### run a mongodb
```bash
docker run -d --name db mongo
```

### check the logs
```bash
docker logs db
```

### Go inside the db container
```bash
docker exec -it db bash
```

### Execute the mongo command inside the container
```bash
`root@<CONTAINER_ID>:/#` mongo
```

### Create a document inside the mytaskdb database
```bash
> use mytasksdb
> db.users.insert({"name": "Leo"});
> db.users.find();
> exit

`root@<CONTAINER_ID>:/#` exit
```

### delete the container and delete the data
```bash
docker rm db
```

### create a directory
```bash
mkdir mongo-data
```

### we mount a directory to a container
### our file system and what destiny in container
```bash
docker run --name db -d -v ${PWD}/mongo-data:/data/db mongo
```

## inspect and see volume in mounts
```bash
docker inpect db
```
# we see we have files of mongo-data
```
ls mongo-data
```

### if we create or change something.. we can affect the container
```bash
touch mongo-data/hola-mundo
```

### enter in mongo container
```bash
docker exec -it db bash
```

### we see the changes
```bash
`root@<CONTAINER_ID>:/#`  ls /data/db
```

---

### Data with Docker: Volumes

- [manage data in Docker](https://docs.docker.com/storage/)


### see the created volumes
```bash
docker volume ls
```

### release volume
```bash
$ docker volume prune
```

### create a volume
```bash
docker volume create dbdata
```

### create a container and mount a volume, indicate the volume and the destination
```bash
docker run -d --name db --mount src=dbdata,dst=/data/db mongo
```
