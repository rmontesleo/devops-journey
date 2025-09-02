# Resource group samples

## Lock resource groups

```bash
# create the resource group
az group create --location eastus \
--resource-group my-test-rg 

# Create a lock to avoid delete the resource group
az group lock create \
--lock-type CanNotDelete \
--name  lock-demo \
--resource-group my-test-rg

# list all your locks on the resourece group (default format)
az group lock list --resouce-group my-test-rg

# list all your locks on the resourece group (table format)
az group lock list --resource-group my-test-rg --output table

# show details of the lock in the resource group
az group lock show \
--name lock-demo \
--resource-group my-test-rg

# try to delete the resource group, it send an error because , the resource group its locked
az group delete --resource-group my-test-rg

 # delete the lock in the resource group
az group lock delete \
--name lock-demo \
--resource-group my-test-rg

# Delete the resource group now. 
az group delete --resource-group my-test-rg

```
