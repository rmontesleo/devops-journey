

## Quick Sample

```bash
az group create --name az204-vm-rg --location eastus

az vm create \
--resource-group az204-vm-rg \
--name az204vm \
--image UbuntuLTS \
--generate-ssh-keys \
--admin-username azureuser \
--public-ip-sku Standard

az vm list --output table

az vm open-port --port 80 --resource-group az204-vm-rg --name az204vm

vm_ip=$( az vm show --resource-group az204-vm-rg  --name az204vm  --show-details --query "publicIps" -o tsv )

echo $vm_ip

ssh azureuser@$vm_ip

az group delete --name az204-vm-rg --no-wait

```



## Virtual Machines References

- [Provision virtual machines in Azure](https://learn.microsoft.com/en-us/training/modules/provision-virtual-machines-azure/)

- [Products available by region](https://azure.microsoft.com/en-us/explore/global-infrastructure/products-by-region/)

- [Windows Virtual Machines Pricing](https://azure.microsoft.com/en-us/pricing/details/virtual-machines/windows/#Windows)

- [Linux Virtual Machines Pricing](https://azure.microsoft.com/en-us/pricing/details/virtual-machines/linux/#Linux)

- [What are Virtual Machine Scale Sets?](https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/overview)

- [Availability sets overview](https://learn.microsoft.com/en-us/azure/virtual-machines/availability-set-overview)

- [What are Azure regions and availability zones?](https://learn.microsoft.com/en-us/azure/reliability/availability-zones-overview)

- [Find Azure Marketplace image information using the Azure CLI](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/cli-ps-findimage#list-popular-images)

- [Increase regional vCPU quotas](https://learn.microsoft.com/en-us/azure/quotas/regional-quota-requests)

- [The standard for customising cloud instances](https://cloud-init.io/)




