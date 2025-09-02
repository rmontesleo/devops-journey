#

## 1) See the ip of your virtual machines
```bash
az vm list-ip-addresses 

# list the ip addreses of yout virtual machine in table format
az vm list-ip-addresses --output table

# Get the ip of the vm01
az vm list-ip-addresses --resource-group  lnx-demo-vm-rg  --name linux-ubuntults-01-vm --output table


az vm list-ip-addresses --resource-group  lnx-demo-02-vm-rg --name linux-ubuntults-03-vm --output table


```

### 2) Get information of any virtual machine
```bash
# get information of linux-ubuntults-01-vm in the resource group lnx-demo-vm-rg
az vm show --resource-group  lnx-demo-vm-rg --name linux-ubuntults-01-vm

# get information of linux-ubuntults-01-vm in the resource group  lnx-demo-vm-rg, but only the admin username
az vm show --resource-group  lnx-demo-vm-rg --name linux-ubuntults-01-vm --query "osProfile.adminUsername"

# remove double quotation
az vm show --resource-group  lnx-demo-vm-rg --name linux-ubuntults-01-vm --query "osProfile.adminUsername" | jq -r

# Get the public ip add the param --show-details
az vm show --resource-group  lnx-demo-vm-rg --name linux-ubuntults-01-vm  --show-details --query "publicIps"   | jq -r

# without using jq
az vm show --resource-group  lnx-demo-vm-rg --name linux-ubuntults-01-vm  --show-details --query "publicIps" -o tsv 


# get information of linux-ubuntults-01-vm in the resource group  lnx-demo-vm-rg, but only the admin username in tsv format
az vm show --resource-group  lnx-demo-vm-rg --name linux-ubuntults-01-vm --query "osProfile.adminUsername" -o tsv

# get the admin username of the vm01 and assign the value to the local variable admin_username
admin_username=$(az vm show --resource-group  lnx-demo-vm-rg --name linux-ubuntults-01-vm --query "osProfile.adminUsername" -o tsv)

# display the value of this variable
echo $admin_username
```


---

## 3) stop your virtual machine
```bash
az vm stop  --name linux-ubuntults-02-vm --resource-group  lnx-demo-vm-rg
```

---

## 4) delete your virtual machines
```bash
az vm delete --name linux-ubuntults-02-vm --resource-group  lnx-demo-vm-rg
```

---

## 12 install software on linux-ubuntults-01-vm
```bash
# Connect to the virtual machine (client)
azure_ssh_key="$HOME/.ssh/azure/vm/ubuntu-lts-key"

vm01_ip=$(az vm show --resource-group  lnx-demo-vm-rg --name linux-ubuntults-01-vm  --show-details --query "publicIps" -o tsv )

admin_username=$(az vm show --resource-group  lnx-demo-vm-rg --name linux-ubuntults-01-vm --query "osProfile.adminUsername" -o tsv)


ssh -i "$azure_ssh_key.private" $admin_username@$vm01_ip
```

### inside linux-ubuntults-01-vm
```bash
# update the software in ubuntu (server)
sudo apt-get -y update && sudo apt-get -y upgrade

# install nginx (server)
sudo apt-get -y install nginx

# verify status of nginx service
sudo systemctl status nginx

### test in the virtual machine (server)
curl localhost

exit
```

### 
```bash
# Get help of open-port option (client)
az vm open-port --help | less

### open the port 80 on linux-ubuntults-01-vm (client)
az vm open-port --port 80 --resource-group lnx-demo-vm-rg --name linux-ubuntults-01-vm --verbose

### test on your own machine (client)
curl http://$vm01_ip
```


### To delete resource groups
```bash
az group delete --name lnx-demo-vm-rg --no-wait

az group delete --name lnx-demo-02-vm-rg --no wait
```




## References


## Solve Issues

- [Shell script - remove first and last quote (") from a variable](https://stackoverflow.com/questions/9733338/shell-script-remove-first-and-last-quote-from-a-variable)