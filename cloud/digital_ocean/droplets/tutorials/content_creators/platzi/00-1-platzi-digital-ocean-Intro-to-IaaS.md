# Platzi

## Clase 4: ¿Qué es un Droplet?


### curl
```bash
curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"first-ubuntu22-droplet",
        "size":"s-1vcpu-512mb-10gb",
        "region":"sfo3",
        "image":"ubuntu-22-04-x64",
        "vpc_uuid":"'$vpc_uuid'"}' \
    "https://api.digitalocean.com/v2/droplets"
```

### doctl
```bash
doctl compute droplet create \
    --image ubuntu-22-04-x64 \
    --size s-1vcpu-512mb-10gb \
    --region sfo3 \
    --vpc-uuid $vpc_uuid \
    first-ubuntu22-droplet
```



### Create your ssh key
```bash
ssh-keygen
```

### connect with your key
```bash
# using the default key
ssh root@$droplet_ip

# using other key
ssh -i $connection_ssh_key root@$basic_droplet_ip

```

### first commands in the first droplet
```bash
hostname

hostname -I

cat /etc/os-release

sudo apt-get -y update && sudo apt-get -y upgrade

exit
```

## Clase 5: Storage: Volumes y Spaces

```bash
- Almacenamiento: Capacidad de guardar cosas
- Transferencia: El consumo de los archivos almacenados, hacer analogía al plan de datos.
```

## Clase 6: Marketplace de Digital Ocean

```bash

# create a droplet with node installed, choose the droplet in the market place and use the steps to create the droplet. Only use a differente image from the market place

```

### create with curl
```bash
curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"nodejs-webserver-droplet",
        "size":"s-1vcpu-1gb",
        "region":"sfo3",
        "image":"nodejs-20-04",
        "vpc_uuid":"'$vpc_uuid'"}' \
    "https://api.digitalocean.com/v2/droplets"
```

### create with doctl
```bash
doctl compute droplet create \
    --image nodejs-20-04 \
    --size s-1vcpu-1gb \
    --region sfo3 \
    --vpc-uuid $vpc_uuid \
    nodejs-webserver-droplet
```

### connect
```bash
ssh root@$node_droplet_ip

ssh -i $connection_ssh_key root@$nodejs_droplet_ip
```

### inside the droplet
```bash
cat /etc/os-release

ufw status

node --version

pm2 --versioin

nginx -v

vim app.js

```
### find the hello world with node
```javascript
/* 
url sample: https://nodejs.org/en/docs/guides/getting-started-guide/

filename: app.js

*/

const http = require('http');

// Change the 127.0.0.1 by the droplet ip
const hostname = '<CHANGE_ME_BY_DROPLET_IP>';
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});

```

### execute the app
```bash
node app.js
```


---

## References

- [How do I start with Node.js after I installed it?](https://nodejs.org/en/docs/guides/getting-started-guide/)


- [How To Find Out Nginx Version using command line](https://www.cyberciti.biz/faq/unix-linux-bsd-display-nginx-version/)

- [Digital Ocean Market Place. NodeJS](https://marketplace.digitalocean.com/apps/nodejs?utm_medium=marketplace&utm_source=marketplace&utm_campaign=marketplace&utm_content=no_image)


- [Volumes Block Storage](https://docs.digitalocean.com/products/volumes/)

- [How to Install the DigitalOcean Metrics Agent](https://docs.digitalocean.com/products/monitoring/how-to/install-agent/)

- [How to Enable VPC Networking on Existing Droplets](https://docs.digitalocean.com/products/networking/vpc/how-to/enable/)

- [How to Upload SSH Public Keys to a DigitalOcean Team](https://docs.digitalocean.com/products/droplets/how-to/add-ssh-keys/to-team/)

- [How-to Add SSH Keys to New or Existing Droplets](https://docs.digitalocean.com/products/droplets/how-to/add-ssh-keys/)

- [How to Customize Your Ubuntu Kernel](https://www.howtogeek.com/191/how-to-customize-your-ubuntu-kernel/)