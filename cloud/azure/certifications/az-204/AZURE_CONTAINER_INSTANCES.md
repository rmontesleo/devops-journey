# Azure Container Instances


## Quick Sample

###
```bash

location="eastus"
rg_name="az204-aci-rg"
container_name="mycontainer"

az group create --name $rg_name --location $location

az group list --output table

# 1. Create a DNS name to expose your container to the Internet. Your DNS name must be unique, run this command from Cloud Shell to create a variable that holds a unique name.
DNS_NAME_LABEL=aci-example-$RANDOM

echo $DNS_NAME_LABEL

# 2. Run the following az container create command to start a container instance

# In the commands above, $DNS_NAME_LABEL specifies your DNS name. The image name, mcr.microsoft.com/azuredocs/aci-helloworld, refers to a Docker image that runs a basic Node.js web application.

az container create --resource-group $rg_name \
--name $container_name \
--image mcr.microsoft.com/azuredocs/aci-helloworld \
--port 80 \
--dns-name-label $DNS_NAME_LABEL \
--location $location


# Get instance details
instance=$(az container show --resource-group $rg_name --name $container_name )

# display instance with jq
echo $instance | jq

# get ip
instance_ip=$( echo $instance | jq -r ".ipAddress.ip" )

curl http://$instance_ip

# get fqdn
instance_fqdn=$( echo $instance | jq  -r ".ipAddress.fqdn" )

curl http://$instance_fqdn

# list your container instances
az container list --resource-group $rg_name --output table

# az container show to check its status
az container show --resource-group $rg_name \
--name $container_name \
--query "{FQDN:ipAddress.fqdn,ProvisioningState:provisioningState}" \
--out table

# get fqdn
fqdn=$( az container show --resource-group $rg_name --name $container_name --query "ipAddress.fqdn" --output tsv )

curl http://$fqdn

# get ip
ip=$( az container show --resource-group $rg_name --name $container_name --query "ipAddress.ip" --output tsv )


curl http://$ip


# cleanup resources
az group delete --name $rg_name --no-wait

```

## Restart policy
```bash
az container create \
--resource-group myResourceGroup \
--name mycontainer \
--image mycontainerimage \
--restart-policy OnFailure
```

## Set environment variables in container instances

### Define variables in command line
```bash
az container create \
--resource-group myResourceGroup \
--name mycontainer2 \
--image mcr.microsoft.com/azuredocs/aci-wordcount:latest 
--restart-policy OnFailure \
--environment-variables 'NumWords'='5' 'MinLength'='8'\
```

### define a yaml file
### Set a secure environment variable by specifying the `secureValue` property instead of the regular value for the variable's type
```yaml
apiVersion: 2018-10-01
location: eastus
name: securetest
properties:
  containers:
  - name: mycontainer
    properties:
      environmentVariables:
        - name: 'NOTSECRET'
          value: 'my-exposed-value'
        - name: 'SECRET'
          secureValue: 'my-secret-value'
      image: nginx
      ports: []
      resources:
        requests:
          cpu: 1.0
          memoryInGB: 1.5
  osType: Linux
  restartPolicy: Always
tags: null
type: Microsoft.ContainerInstance/containerGroups
```

```bash
az container create --resource-group myResourceGroup \
--file secure-env.yaml
```


## Mount an Azure file share in Azure Container Instances
## Check again this topic

```bash
az container create \
--resource-group $ACI_PERS_RESOURCE_GROUP \
--name hellofiles \
--image mcr.microsoft.com/azuredocs/aci-hellofiles \
--dns-name-label aci-demo \
--ports 80 \
--azure-file-volume-account-name $ACI_PERS_STORAGE_ACCOUNT_NAME \
--azure-file-volume-account-key $STORAGE_KEY \
--azure-file-volume-share-name $ACI_PERS_SHARE_NAME \
--azure-file-volume-mount-path /aci/logs/
```



## REFERENCES

- [Run container images in Azure Container Instances](https://learn.microsoft.com/en-us/training/modules/create-run-container-images-azure-container-instances/)
- [Azure Kubernetes Service (AKS)](https://learn.microsoft.com/en-us/azure/aks/)
- []()
- []()