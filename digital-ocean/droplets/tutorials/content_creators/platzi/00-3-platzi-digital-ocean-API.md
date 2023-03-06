# Platzi


## Clase 16: Conociendo una API



####
```text
Digital Ocean cuenta con una API que nos permite mediante peticiones HTTP (con los métodos get, post, put, delete) realizar operaciones sobre los productos que ellos ofrecen, como droplets, volumes, etc.

Es decir, podemos crear un droplet, apagarlo, destruirlo o incluso redimensionarlo mediante el llamado a la API.

En la documentación oficial podremos encontrar más casos de uso, lo único que debemos tener en cuenta es que requerimos de un token de autorización para interactuar con la API y este se obtiene en el panel de control.
```

## Clase 17: Cómo generar una API Key en Digital Ocean


####
```text
La API de Digital Ocean nos permite automatizar todo lo que hacemos en el panel de control pero usando comandos a través de peticiones http.

API Key es un hash que identifica el equipo que se conecta a Digital Ocean.
```

#### Creating the token
```bash
# Go to API section
# Create a new token
```


## Clase 18: Creacion de un Droplet por API 

#### get account ssh keys
```bash
curl -X GET -H 'Content-Type: application/json' \
-H 'Authorization: Bearer '$TOKEN'' \
"https://api.digitalocean.com/v2/account/keys"  | jq

# copy the id of the required ssh key
```

### get vpc
```bash
# get vpcs
curl -X GET   -H "Content-Type: application/json"   \
-H "Authorization: Bearer $TOKEN" \
"https://api.digitalocean.com/v2/vpcs" | jq
```

#### Create 
```bash

curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"created-api-ubuntu-droplet",
        "size":"s-1vcpu-512mb-10gb",
        "region":"sfo3",
        "ssh_keys": [ "'$ssh_id_key'"  ],
        "image":"ubuntu-22-04-x64"}' \
    "https://api.digitalocean.com/v2/droplets" | jq
```


---

## References

- [API](https://docs.digitalocean.com/reference/api/)

- [DigitalOcean API (2.0)](https://docs.digitalocean.com/reference/api/kafka-beta-api-reference/)

- [Droplet Actions](https://docs.digitalocean.com/reference/api/kafka-beta-api-reference/#tag/Droplet-Actions)


- [How do I start with Node.js after I installed it?](https://nodejs.org/en/docs/guides/getting-started-guide/)


- [How To Find Out Nginx Version using command line](https://www.cyberciti.biz/faq/unix-linux-bsd-display-nginx-version/)

- [Digital Ocean Market Place. NodeJS](https://marketplace.digitalocean.com/apps/nodejs?utm_medium=marketplace&utm_source=marketplace&utm_campaign=marketplace&utm_content=no_image)


- [Volumes Block Storage](https://docs.digitalocean.com/products/volumes/)

- [How to Install the DigitalOcean Metrics Agent](https://docs.digitalocean.com/products/monitoring/how-to/install-agent/)

- [How to Enable VPC Networking on Existing Droplets](https://docs.digitalocean.com/products/networking/vpc/how-to/enable/)

- [How to Upload SSH Public Keys to a DigitalOcean Team](https://docs.digitalocean.com/products/droplets/how-to/add-ssh-keys/to-team/)

- [How-to Add SSH Keys to New or Existing Droplets](https://docs.digitalocean.com/products/droplets/how-to/add-ssh-keys/)

- [How to Customize Your Ubuntu Kernel](https://www.howtogeek.com/191/how-to-customize-your-ubuntu-kernel/)