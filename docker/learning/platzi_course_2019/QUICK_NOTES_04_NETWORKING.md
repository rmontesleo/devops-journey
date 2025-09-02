#  Docker networking

## review the networks with docker shows 3 docker networks

```bash
docker network ls
```

- **host**: represents our laptop network, not recomendable, its dangerous if you dont use it correctly
- **none**: disable the network, is isolated, nothing connect to this.


### create a network call academynet and attachable (--attachable)
```bash
docker network create --attachable academynet
```


### create our mongodb database
```bash
docker run -d --name mongo-db mongo
```

### we attache our database to the network
```bash
docker network connect academynet mongo-db
```

### inspect the network and check the db is in the academynet
```bash
docker network inspect academynet
```


### Create the postgres database container
```bash
docker run -p 5432:5432 -d \
--name postgresdb_dev_container_02 \
--mount src=postgres_dev_volume,dst=/var/lib/posgresql/data \
-e POSTGRES_USER=postgres_user \
-e POSTGRES_PASSWORD=supersecret \
-e POSTGRES_DB=demos_db \
postgres:13.2
```

### Create the pgadmin container
```bash
docker run -d -p 9090:80 \
--name pgAdmin4 \
-e 'PGADMIN_DEFAULT_EMAIL=user@domain.com' \
-e 'PGADMIN_DEFAULT_PASSWORD=supersecret' \
dpage/pgadmin4:6.8
```


### connect postgres to the network
```bash
docker network connect academynet postgresdb_dev_container_02
```

### connect pgadmin to the network
```bash
docker network connect academynet pgAdmin4
```

### remove a network
```bash
docker network rm academynet
```