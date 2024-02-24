# PGAdmin configuration

```bash
docker run -d -p 9090:80 \
--name pgAdmin4 \
-e 'PGADMIN_DEFAULT_EMAIL=user@domain.com' \
-e 'PGADMIN_DEFAULT_PASSWORD=supersecret' \
dpage/pgadmin4:6.8
```


