# Platzi


## Clase 24: Instalacion de un servidor VPN 


### get you ssh keys
```bash
curl -X GET -H 'Content-Type: application/json' \
-H 'Authorization: Bearer '$TOKEN'' \
"https://api.digitalocean.com/v2/account/keys" | jq
```

### get vpcs
```bash
curl -X GET   -H "Content-Type: application/json"   \
-H "Authorization: Bearer $TOKEN" \
"https://api.digitalocean.com/v2/vpcs" | jq
```

#### create the droplet by curl
```bash
curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"vpn-server-02-drooplet",
        "size":"s-1vcpu-1gb",
        "region":"nyc1",
        "image":"ubuntu-22-04-x64",
        "vpc_uuid":"'$vpc_uuid'",
        "ssh_keys": [ "'$ssh_id_key'"  ],
        "tags":["vpn"]}' \
    "https://api.digitalocean.com/v2/droplets" | jq
```

#### create the droplet by doctl
```bash
doctl compute droplet create \
    --image ubuntu-22-04-x64 \
    --size s-1vcpu-1gb \
    --region nyc1 \
    --vpc-uuid $vpc_uuid \
    --tag-names 'vpn' \
    vpn-server-drooplet
```

####
```bash
# login in your droplet
ssh -i  $connection_ssh_key root@$vpn_droplet_ip

## install the vpn server
## if you need more clients, run the scripts again
wget https://git.io/vpn -O openvpn-install.sh && bash openvpn-install.sh


# see the configuration on
cat /root/$vpn_cliente_name

```


## Clase 25: Instalacion y configuracion del cliente 


####
```

```

## Clase 26: Conclusiones finales del curso 

####
```

```




---

## References

- [GitHub: openvpn-install](https://github.com/santiaguf/openvpn-install)

- [Open VPN](https://openvpn.net/community-downloads/)


- [How do I start with Node.js after I installed it?](https://nodejs.org/en/docs/guides/getting-started-guide/)


- [How To Find Out Nginx Version using command line](https://www.cyberciti.biz/faq/unix-linux-bsd-display-nginx-version/)

- [Digital Ocean Market Place. NodeJS](https://marketplace.digitalocean.com/apps/nodejs?utm_medium=marketplace&utm_source=marketplace&utm_campaign=marketplace&utm_content=no_image)


- [Volumes Block Storage](https://docs.digitalocean.com/products/volumes/)

- [How to Install the DigitalOcean Metrics Agent](https://docs.digitalocean.com/products/monitoring/how-to/install-agent/)

- [How to Enable VPC Networking on Existing Droplets](https://docs.digitalocean.com/products/networking/vpc/how-to/enable/)

- [How to Upload SSH Public Keys to a DigitalOcean Team](https://docs.digitalocean.com/products/droplets/how-to/add-ssh-keys/to-team/)

- [How-to Add SSH Keys to New or Existing Droplets](https://docs.digitalocean.com/products/droplets/how-to/add-ssh-keys/)

- [How to Customize Your Ubuntu Kernel](https://www.howtogeek.com/191/how-to-customize-your-ubuntu-kernel/)