#


##



### create with curl
```bash
curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"ubuntu-jenkins-droplet",
        "size":"s-1vcpu-2gb",
        "region":"sfo3",
        "image":"ubuntu-22-04-x64",
        "vpc_uuid":"'$vpc_uuid'",
        "tags":["devops",
        "jenkins",
        "ubuntu"]}' \
    "https://api.digitalocean.com/v2/droplets"
```

### create with doctl
```bash
doctl compute droplet create \
    --image ubuntu-22-04-x64 \
    --size s-1vcpu-2gb \
    --region sfo3 \
    --vpc-uuid $vpc_uuid \
    --tag-names 'devops,jenkins,ubuntu' \
    ubuntu-jenkins-droplet
```