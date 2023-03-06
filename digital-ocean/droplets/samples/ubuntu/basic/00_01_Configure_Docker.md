#

##


### Create a droplet with Docker configured using
```bash
curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"ubuntu-docker-droplet",
        "size":"s-1vcpu-2gb",
        "region":"sfo3",
        "image":"docker-20-04",
        "vpc_uuid":"'$vpc_uuid'"}' \
    "https://api.digitalocean.com/v2/droplets"

```

### Create a droplet with Docker configured using doctl
```bash

doctl compute droplet create \
    --image docker-20-04 \
    --size s-1vcpu-2gb \
    --region sfo3 \
    --vpc-uuid $vpc_uuid \
    ubuntu-docker-droplet
```

## REFERENCES

- [](https://marketplace.digitalocean.com/apps/docker)
- [](https://docs.docker.com/language/java/)