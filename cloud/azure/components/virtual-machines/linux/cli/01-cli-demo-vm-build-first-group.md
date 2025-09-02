# Basic sample to create an Ubuntu Virtual Machine

Create two virtual machines on eastus inside the resource group called lnx-demo-vm-rg


### List your resources groups in azure
```bash
az group list --output table
```


### Generic Way to create your resource group
```bash
az group create --location <LOCATION_NAME> --resource-group <RESOURCE_GROUP_NAME> 
```

### Create a resource group called lnx-demo-vm-rg if not exists it.
```bash
az group create --location eastus --resource-group lnx-demo-vm-rg 
```

### List your resource groups in json format (default)
```bash
az group list
```

### List your resource groups in table format
```bash
az group list --output table
```

### Create an Ubuntu VM in the lnx-demo-vm-rg .This command generate the public ubuntu-lts-key and the private ubuntu-lts-key.private.  Avoid use the default id_rsa
```bash

azure_ssh_key="$HOME/.ssh/azure/vm/ubuntu-lts-key"

az vm create \
--resource-group lnx-demo-vm-rg \
--image UbuntuLTS \
--name linux-ubuntults-01-vm \
--public-ip-sku Standard \
--admin-username vmadmin \
--generate-ssh-keys \
--ssh-key-values $azure_ssh_key \
--verbose
```

### list your virtual machines
```bash
az vm list --output table
```


### show details of this vm
```bash
az vm show --resource-group lnx-demo-vm-rg --name linux-ubuntults-01-vm --show-details

vm01=$( az vm show --resource-group lnx-demo-vm-rg --name linux-ubuntults-01-vm --show-details )

echo $vm01
echo $vm01 | jq
echo $vm01 | jq -r '.publicIps'
echo $vm01 | jq -r '.hardwareProfile.vmSize'
```

### Connect to the virtual machine
```bash
vm01_ip=$( echo $vm01 | jq -r '.publicIps' )
echo "VM01 IP is: $vm01_ip"

ssh -i "$azure_ssh_key.private"  vmadmin@$vm01_ip
```



### If you want to create a new vm with previous ssh keys, put the full path and keyname to use
```bash
az vm create \
--resource-group lnx-demo-vm-rg \
--image UbuntuLTS \
--name linux-ubuntults-02-vm \
--public-ip-sku Standard \
--admin-username vmadmin02 \
--generate-ssh-keys \
--ssh-key-values $azure_ssh_key \
--verbose
```

### List your virtual machines
```bash
az vm list --output table
```

### show details of this vm
```bash
az vm show --resource-group lnx-demo-vm-rg --name linux-ubuntults-02-vm --show-details

vm02=$(az vm show --resource-group lnx-demo-vm-rg --name linux-ubuntults-02-vm --show-details)
echo $vm02 | jq -r '.publicIps'
echo $vm02 | jq -r '.hardwareProfile.vmSize'

vm02_ip=$(  echo $vm02 | jq -r '.publicIps' )

```

### Connect to the virtual machine
```bash
ssh -i "$azure_ssh_key.private" vmadmin02@$vm02_ip
```

---


### Create the virtual machine number 3 in this group
```bash
az vm create \
--resource-group lnx-demo-vm-rg \
--image UbuntuLTS \
--name linux-ubuntults-03-vm \
--public-ip-sku Standard \
--admin-username vmadmin03 \
--generate-ssh-keys \
--ssh-key-values $azure_ssh_key \
--verbose
```

### List your virtual machines
```bash
az vm list --output table
```

### show details of this vm
```bash
az vm show --resource-group lnx-demo-vm-rg --name linux-ubuntults-03-vm --show-details

vm03=$(az vm show --resource-group lnx-demo-vm-rg --name linux-ubuntults-03-vm --show-details)
echo $vm03 | jq -r '.publicIps'
echo $vm03 | jq -r '.hardwareProfile.vmSize'

vm03_ip=$(  echo $vm03 | jq -r '.publicIps' )

```

### Connect to the virtual machine
```bash
ssh -i "$azure_ssh_key.private" vmadmin03@$vm03_ip
```



---

## References

- [What is the Windows Subsystem for Linux?](https://learn.microsoft.com/en-us/windows/wsl/about)
- [Generate and store SSH keys in the Azure portal(https://learn.microsoft.com/en-us/azure/virtual-machines/ssh-keys-portal)
- [Quick steps: Create and use an SSH public-private key pair for Linux VMs in Azure](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/mac-create-ssh-keys)

---

## Solving Issues

- [Azure Linux VM SSH Error - Permission denied (publickey)](https://trstringer.com/azure-linux-vm-ssh-public-key-denied/)

- [SSH: Permission denied (publickey)](https://learn.microsoft.com/en-us/answers/questions/1115347/ssh-permission-denied-(publickey))

- [Troubleshoot SSH connections to an Azure Linux VM that fails, errors out, or is refused](https://learn.microsoft.com/en-us/troubleshoot/azure/virtual-machines/troubleshoot-ssh-connection#reset-the-ssh-configuration)


- [How to remove double-quotes in jq output for parsing json files in bash?](https://stackoverflow.com/questions/44656515/how-to-remove-double-quotes-in-jq-output-for-parsing-json-files-in-bash)

- [Using jq to extract values from column-oriented JSON and format in CSV](https://unix.stackexchange.com/questions/163845/using-jq-to-extract-values-from-column-oriented-json-and-format-in-csv)