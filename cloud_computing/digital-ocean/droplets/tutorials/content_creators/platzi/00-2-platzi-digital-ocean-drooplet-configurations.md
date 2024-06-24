# Platzi


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
```bash
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
ssh -i $connection_ssh_key root@$basic_droplet_ip -p $basic_droplet_port

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
ssh  -i $connection_ssh_key root@$basic_droplet_ip -p $basic_droplet_port

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
ssh -i $connection_ssh_key  root@$basic_droplet_ip -p $basic_droplet_port


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



## Clase 12 Backups y Snapshots: 

####
```bash
 # Backups: the backups are created weekly

 # Snapshot: An exact copy of the droplet, you must turn off the droplet then create the snapshot.

 # We can use the Restore Droplet when we need to use the same configuration and same IP

# We can create droplets with the snapshot we created

# create the droplet using the curl API

curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"first-ubuntu22-respaldo01-droplet",
        "size":"s-1vcpu-512mb-10gb",
        "region":"sfo3",
        "image":"'$image'",
        "vpc_uuid":"'$vpc_uuid'"}' \
    "https://api.digitalocean.com/v2/droplets"


# we can create the droplet using doctl
doctl compute droplet create \
    --image $image \
    --size s-1vcpu-512mb-10gb \
    --region sfo3 \
    --vpc-uuid $vpc_uuid \
    first-ubuntu22-respaldo01-droplet


# we create a second droplet using the snapshot
curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"first-ubuntu22-backup02-improved-memory-droplet",
        "size":"s-1vcpu-1gb",
        "region":"sfo3",
        "image":"'$image'",
        "vpc_uuid":"'$vpc_uuid'"}' \
    "https://api.digitalocean.com/v2/droplets"


# or we crete a second droplet using the snpashot with doctl
doctl compute droplet create \
    --image $image \
    --size s-1vcpu-1gb \
    --region sfo3 \
    --vpc-uuid $vpc_uuid\
    first-ubuntu22-backup02-improved-memory-droplet


## Logint with the new drooplet
ssh  -i $connection_ssh_key root@$basic_droplet_snapshot_ip -p $basic_droplet_port


df -h

cat /proc/meminfo | grep Mem

exit

## login with the second snapshot droplet
ssh  -i $connection_ssh_key root@$basic_droplet_snapshot_ip -p $basic_droplet_port



df -h

cat /proc/meminfo | grep Mem

exit

```

## Clase 13: Kernel: 


####
```text
En el mundo de los droplets y de Linux tenemos un concepto clave a la hora de manejar los sistemas operativos: el Kernel (o núcleo).

El Kernel es el corazón del sistema operativo Linux, es el software que se encuentra entre el sistema operativo (SO) y el hardware del equipo. Veamos por qué es tan importante:

Gestiona toda la conexión entre el software y el hardware: Cuando una aplicación le solicita al sistema operativo el acceso a un hardware, como por ejemplo el disco duro para realizar almacenamiento, el SO le solicita a el Kernel el acceso, y este verifica si el recurso físico se puede facilitar a la aplicación.

El Kernel es el encargado de gestionar la memoria RAM, es decir, cuando un programa requiere más memoria para poder cargar más información, debe solicitar dicha gestión al Kernel quien se encarga de verificar cuánta memoria hay y entregar de acuerdo a la disponibilidad, también se encarga de liberar la memoria RAM.

El Kernel se encarga también de la gestión del procesador, es decir, es quien decide qué operaciones tienen más prioridad de ejecución.

En Digital Ocean tenemos la opción de manipular el Kernel de nuestro Droplet, es decir podemos actualizarlo e incluso modifícarlo, sin embargo se recomienda tener mucha precaución, ya que una actualización o modificación fallida puede dañar el Droplet.
```


## Clase 14: History y Destroy 


####
```bash
# Opcion history en el droplet seleccionado

# Opcion destroy en el mismo panel del droplet seleccionado
```




## Clase 15: Tag, Recovery y Graphs 

####
```text
Los Tags son una forma de agrupar todos los droplets que tenemos, por ejemplo: DataBase, Backend, Firewall, WebServer etc.

Recovery permite iniciar el droplet a partir de una imagen ISO de recuperación para intentar recuperar droplet que no inicia.

Graphs muestra estadísticas de los recursos de nuestro droplets como son: CPU RAM, ancho de banda etc.
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