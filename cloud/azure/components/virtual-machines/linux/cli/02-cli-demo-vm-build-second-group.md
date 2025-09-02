# Basic administration of Azure Virtual Machines Par 02


Create virtual machines in westus2 inside the resource group call lnx-demo-02-vm-rg. Also use more linux variables


## 1) Create the resource group and the virtual machine


### 1.0) Verify your resource groups in Azure


### 1.1) Create the resource group lnx-demo-02-vm-rg if not exist
```bash

az group list --output table

location_02="westus2"
resource_group_02="lnx-demo-02-vm-rg"

az group create --location $location_02 --resource-group $resource_group_02
```

### 1.2) Create the linux-ubuntults-03-vm
```bash

vm_name_03="linux-ubuntults-03-vm"
azure_ssh_key="$HOME/.ssh/azure/vm/ubuntu-lts-key"


az vm create \
--resource-group $resource_group_02 \
--location $location_02 \
--name $vm_name_03 \
--image UbuntuLTS \
--public-ip-sku Standard \
--admin-username azuredeveloper \
--generate-ssh-keys \
--ssh-key-values $azure_ssh_key \
--verbose
```

### 
```bash
az vm list --output table
```


---

### 2) Get help
```bash
az vm --help
az vm create --help
az vm create --help | less
```

---

## 3) Connect to the virtual machine

### 3.1) Connect to linux-ubuntults-03-vm with your ssh key
```bash

vm03_g2=$( az vm show --resource-group $resource_group_02 --name $vm_name_03 --show-details )
vm03_g2_ip=$( echo $vm03_g2 | jq -r '.publicIps')  

ssh -i "$azure_ssh_key.private" azuredeveloper@$vm03_g2_ip
```

---

## 4) Creat linux-ubuntults-04-vm

### 4.1) Create a virtual machine vm02 with a different size of the default
```bash

vm_name_04="linux-ubuntults-04-vm"

az vm create \
--resource-group  $resource_group_02 \
--location $location_02 \
--name $vm_name_04 \
--image UbuntuLTS \
--public-ip-sku Standard \
--admin-username azuredeveloper \
--generate-ssh-keys \
--ssh-key-values $azure_ssh_key \
--size "Standard_DS2_v2" \
--verbose
```

### 4.2) Get info about your virtual machine
```bash

az vm list --output table

vm04_g2=$( az vm show --resource-group $resource_group_02 --name $vm_name_04 --show-details )
vm04_g2_ip=$( echo $vm04_g2 | jq -r '.publicIps'  )
```

### 4.3) Connect to linux-ubuntults-04-vm
```bash
ssh -i  "$azure_ssh_key.private"  azuredeveloper@$vm04_g2_ip
```

## 4.4) see the list of your virtual machines
```bash
az vm list 
```

## 4.5) see in table format
```bash
az vm list --output table
```
