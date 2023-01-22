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

## Clase 7: Activar 2FA en Digital Ocean

####
```
TODO: Pendent how to enable 2F authentication with all options.
```




## Clase 8 : Panel de Control, Projects y Access

#### Reset your password from Droplet console in the portal.
```

- 1 :Reset the droplet with the option Reset root password, you will recive a new password in your email.

- 2 : Go to the option Droplet Console and put the password you get by email and change for a new one

- 3: Validate the password in the Droplet Console

```

#### change the port to avoid attacks in 22 port
```bash

cd /etc/ssh

vim sshd_config
```
#### find the line #Port 22 uncomented and use a new port. Try a non standard port
```
Port <NO_STANDARD_PORT_4_DIGITS>
```

#### the reload ssh service then exit
```
systemctl reload sshd

exit
```

#### enter again in your droplet
```
# by the fault the port 22 is rejected
ssh -i $connection_ssh_key root@basic_droplet_ip


# use your new port
ssh -i $connection_ssh_key root@basic_droplet_ip -p $basic_droplet_port

```



## Clase 9: Volumes y Power

#### steps to mount your volume


```bash
# login
ssh root@1$basic_droplet_ip -p $basic_droplet_port

# format the volume the first time
sudo mkfs.ext4 /dev/disk/by-id/scsi-0DO_Volume_mifirst-volume


# Create a mount point for your volume:
mkdir -p /mnt/mifirst_volume

# Mount your volume at the newly-created mount point:
mount -o discard,defaults,noatime /dev/disk/by-id/scsi-0DO_Volume_mifirst-volume /mnt/mifirst_volume

# Change fstab so the volume will be mounted after a reboot
echo '/dev/disk/by-id/scsi-0DO_Volume_mifirst-volume /mnt/mifirst_volume ext4 defaults,nofail,discard 0 0' | sudo tee -a /etc/fstab

# verify the volume
df -h

```

#### unmount the voluem
```text

1. Turn off the droplet
2. Detache the volume from the droplet
3. Start again the droplet
4. Add a new volume to the droplet, but now choose the previous one instead of create a new one.
5. Follow the instructions to mount the existing volume.
```

#### instructions to mount the volume
```bash

ssh root@1$basic_droplet_ip -p $basic_droplet_port

# verify the volume is not mounted yet
df -h

# Create a mount point for your volume:
mkdir -p /mnt/mifirst_volume


#Mount your volume at the newly-created mount point:
mount -o discard,defaults,noatime /dev/disk/by-id/scsi-0DO_Volume_mifirst-volume /mnt/mifirst_volume

# Change fstab so the volume will be mounted after a reboot
 echo '/dev/disk/by-id/scsi-0DO_Volume_mifirst-volume /mnt/mifirst_volume ext4 defaults,nofail,discard 0 0' | sudo tee -a /etc/fstab

# verify the partition table
df -h


```




## Clase 10: Resize (Escalamiento vertical)

####
```bash
#1. Go to droplet, Choose the droplet, Resize, Turn off the droplet and resize

#2. turn on the droplet

#loging again to the droplet
ssh root@$basic_droplet_ip -p $basic_droplet_port

# inside the droplet, see info about the memory
cat /proc/meminfo

# turn off the droplet and scale down the droplet to original configuration and turn on the droplet again.

#loging again to the droplet
ssh root@$basic_droplet_ip -p $basic_droplet_port

# get only the info about the memory
cat /proc/meminfo  | grep Mem


```



## Clase 11: Networking y Firewall

####
```bash

# Networking: IPs flotantes, balanceadores de carga, firewall, etc. Esta opción nos permitirá configurar todos los temas relacionados con la red.

# Una red privada nos servirá para por ejemplo conectar dos droplet a través de esta dirección sin necesidad de que sean accedidas desde internet.

# Firewall: Es un software del SO que permite manejar y administrar todas las reglas de conexiones entrantes y salientes de nuestro droplet.

# Panel de control, Droplet, the droplet , Networking, turn off the droplet

# ---------------

# 1. Copy your private ip

# login to the droplet
ssh root@$basic_droplet_ip -p $basic_droplet_port

#
apt install net-tools

#
ifconfig

# get information about the network configuration
lshw -class network

# then find for virtio1.serial, copy the value. This giveus the mac addres of the private network interface 

# edit the network interface droplet
vim /etc/netplan/50-cloud-init.yaml


```

### verify or add the following template to the configuration
```yaml
eth1:
            addresses:
            - <PRIVATE_IP>/<NETWORK_SUBMASK>
            match:
                macaddress: <MAC_ADDRESS_VALUE>
            set-name: eth1
```


#### verify the yaml is ok
```bash
# if ok, nothing appear in the console
netplan apply --debug

# reboot the system to take the changes
reboot

# wait to droplet is available again
# login to the droplet
ssh root@$basic_droplet_ip -p $basic_droplet_port


## verify the network interfaces
## eth0 gives the public ip
## eth1 gives the private ip

ifconfig

```


#### find for floating or reserved IPs
```
# Go to Reserved IP configuration

# Go to firewall configuration

# Go to custom configuration and change port 22 by the new port in your droplet

# then delete the ICMP (Internet Control Message Protocol) to avoid ping to the droplet.  The droplet can not execute the ping command also other machines can not ping our droplet


```



## Clase 12: 

####
```

```





####
```

```

## Clase : 


## Clase : 


## Clase : 

####
```

```

## Clase : 


## Clase : 

## Clase : 

## Clase : 


## Clase : 

####
```

```


## Clase : 

####
```

```


## Clase : 

####
```

```


## Clase : 

## Clase : 

## Clase : 

## Clase : 

## Clase : 

####
```

```




---

## References

- [How do I start with Node.js after I installed it?](https://nodejs.org/en/docs/guides/getting-started-guide/)


- [How To Find Out Nginx Version using command line](https://www.cyberciti.biz/faq/unix-linux-bsd-display-nginx-version/)

- [Digital Ocean Market Place. NodeJS](https://marketplace.digitalocean.com/apps/nodejs?utm_medium=marketplace&utm_source=marketplace&utm_campaign=marketplace&utm_content=no_image)


- [Volumes Block Storage](https://docs.digitalocean.com/products/volumes/)