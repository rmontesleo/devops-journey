### 1) See the images of the virtual machines
```bash
### Return information of most common virtual machine images
az vm image list
az vm image list --help

### get the information on a table format
az vm image list --output table

### get the offer of images related with java
az vm image list --output table --all --offer Java   --output table

### get the offer of images related with ubuntu
az vm image list --output table --all --offer Ubuntu --output table

# List all images with Ubuntu 20.04
az vm image list --output table --all  --publisher Canonical  --sku 20_04   --output table

# List all images with Ubuntu 22.04
az vm image list --output table --all  --publisher Canonical  --sku 22_04   --output table
```

---

### 2) See the sizes list of the vm
```bash
az vm list-sizes --location eastus
az vm list-sizes --location eastus --output tsv
az vm list-sizes --location eastus --output table

##
az vm list-sizes --location eastus-2
az vm list-sizes --location eastus2 --output tsv
az vm list-sizes --location eastus2 --output table
```


## References

### Azure 
- [Find Azure Marketplace image information using the Azure CLI](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/cli-ps-findimage#list-popular-images)