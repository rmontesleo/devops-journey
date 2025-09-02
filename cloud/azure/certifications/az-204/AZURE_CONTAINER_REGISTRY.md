# Azure container Registries



## Quick Sample

```bash
location="eastus"
rg_name="az204-acr-rg"
acr_name="demo20230307acr"

az group create --name $rg_name --location $location

az group list --output table

# Create the container Registry
az acr create --resource-group $rg_name \
--name $acr_name \
--sku Basic

# list your Container Registries
az acr list --output table

# get details of your ACR
az acr show --name $acr_name --output table


# Create the docker file
echo FROM mcr.microsoft.com/hello-world > Dockerfile

# Run the az acr build command, which builds the image and, after the image is successfully built, pushes it to your registry.
az acr build --image sample/hello-world:v1 \
--registry $acr_name \
--file Dockerfile .

# Use the az acr repository list command to list the repositories in your registry
az acr repository list --name $acr_name --output table

# Use the az acr repository show-tags command to list the tags on the sample/hello-world repository
az acr repository show-tags --name $acr_name \
--repository sample/hello-world --output table


# Run the sample/hello-world:v1 container image from your container registry by using the az acr run command. The following example uses $Registry to specify the registry where you run the command.
az acr run --registry $acr_name \
--cmd '$Registry/sample/hello-world:v1' /dev/null


# delete all resource group
az group delete --name $rg_name --no-wait

```


## References

- [Manage container images in Azure Container Registry](https://learn.microsoft.com/en-us/training/modules/publish-container-image-to-azure-container-registry/)

- [Push and pull Helm charts to an Azure container registry](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-helm-repos)
- [Open Container Initiative](https://github.com/opencontainers/image-spec/blob/main/spec.md)
- [Automate container image builds and maintenance with ACR Tasks](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-tasks-overview)
- [Service tier features and limits](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-skus#service-tier-features-and-limits)
- [az acr build](https://learn.microsoft.com/en-us/cli/azure/acr?view=azure-cli-latest#az-acr-build)
- [ACR Tasks reference: YAML](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-tasks-reference-yaml)

- [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)