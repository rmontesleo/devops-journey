# ARM Template References


## Quick Sample
```bash
myLocation=eastus
az group create --name az204-arm-rg --location $myLocation
az group list --output table

az  deployment group create \
--resource-group az204-arm-rg \
--template-file azuredeploy.json \
--parameters azuredeploy.parameters.json

storageName="az204storagearm20230036"

# get details
az storage account show --resource-group az204-arm-rg --name $storageName
storage=$(az storage account show --resource-group az204-arm-rg --name $storageName)

# use query to get details
az storage account show --resource-group az204-arm-rg --name $storageName --query "accessTier"
az storage account show --resource-group az204-arm-rg --name $storageName --query "accessTier" -o tsv

# Delete the resource group and the storage account
az group delete --name az204-arm-rg --no-wait

```



## References

- [Create and deploy Azure Resource Manager template](https://learn.microsoft.com/en-us/training/modules/create-deploy-azure-resource-manager-templates/)

- [ARM template functions](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/template-functions)

- [Parameters in ARM templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/parameters)

- [Variables in ARM templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/variables)

- [User-defined functions in ARM template](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/user-defined-functions)

- [Resource declaration in ARM templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/resource-declaration)

- [Outputs in ARM templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/outputs?tabs=azure-powershell)

- [Define the order for deploying resources in ARM templates](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/resource-dependency)

- [Azure Resource Manager template specs](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/template-specs?tabs=azure-powershell)