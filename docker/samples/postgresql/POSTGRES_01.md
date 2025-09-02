# Working with Docker and Postgres


## Sample 01

```bash
docker run -p [PORT_TO_EXPOSE]:5432 -d \
--name [CONTAINER_NAME] \
-e POSTGRES_USER=[DB_USER] \
-e POSTGRES_PASSWORD=[DB_PASSWORD] \
-e POSTGRES_DB=[DB_NAME] \
postgres:[VERSION_TO_USE]
```

```bash
docker run -p 5432:5432 -d \
--name postgresdb_dev_container_01 \
-e POSTGRES_USER=postgres_user \
-e POSTGRES_PASSWORD=supersecret \
-e POSTGRES_DB=demos_db \
postgres:13.2
```
---

## Sample 02


## Creating Docker Volume 

```bash
docker volume create [NAME_OF_THE_VOLUME]
```

```bash
docker volume create postgres-volume
```

### Create a continer of Postgres  with Docker
```bash
docker run -p [PORT_TO_EXPOSE]:5432 -d \
--name [CONTAINER_NAME] \
--mount src=[VOLUME_NAME],dst=/var/lib/posgresql/data \
-e POSTGRES_USER=[DB_USER] \
-e POSTGRES_PASSWORD=[DB_PASSWORD] \
-e POSTGRES_DB=[DB_NAME] \
postgres:[VERSION_TO_USE]
```

```bash
docker run -p 5432:5432 -d \
--name postgresdb_dev_container_02 \
--mount src=postgres_dev_volume,dst=/var/lib/posgresql/data \
-e POSTGRES_USER=postgres_user \
-e POSTGRES_PASSWORD=supersecret \
-e POSTGRES_DB=demos_db \
postgres:13.2
```

---

## Operations with the container

### First Check the container of the database
```
docker exec -it postgresdb_dev_container_01 bash
```

### Connect directly to Database
```bash
docker exec -it postgresdb_dev_container psql [DB_NAME] -U [DB_USER]
```

```bash
docker exec -it postgresdb_dev_container_01 psql demos_db -U postgres_user
```

---

## Operations with the database

### After thar we enter like root

```bash
# root@[ID_CONTAINER]:/#
```

### To use the shell with posgress
```bash
psql demos_db -U postgres_user
```

### The promt will be
```bash
# ts_api_ps_db=#
```



