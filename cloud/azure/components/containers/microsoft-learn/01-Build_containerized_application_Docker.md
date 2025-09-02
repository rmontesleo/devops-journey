# Build a containerized web application with Docker


## Sample 01

###
```bash
#
resource_group_01=mygroup

#
az group create --name $resource_group_01  --location westus

#
registry_name_01=demo202209221408

#
az acr create --name $registry_name_01 \
--resource-group $resource_group_01 \
--sku standard \
--admin-enabled true

#
az acr credential show --name $registry_name_01 --resource-group $resource_group_01
```

### 
```json
 {
  "passwords": [
    {
      "name": "password",
      "value": "<SOME_PASSWORD>"
    },
    {
      "name": "password2",
      "value": "<ANOTHER_PASSOWRD>"
    }
  ],
  "username": "<THE_NAME_DEFINE_IN_VARIABLE_REGISTRY_NAME_01>"
}
```

###
```bash
#
docker login "${registry_name_01}.azurecr.io"

#
docker tag reservationssystem-demo "${registry_name_01}.azurecr.io/reservationssystem-demo:v2"

#
docker push "${registry_name_01}.azurecr.io/reservationssystem-demo:v2"
```

###
```bash
az acr repository list --help

az acr repository list --name ${registry_name_01} --resource-group  ${resource_group_01}

az acr repository list --name ${registry_name_01} 

```

###
```json
[
  "reservationssystem-demo"
]
```

###
```bash
#
az acr repository show --repository  reservationssystem-demo --name ${registry_name_01} --resource-group  ${resource_group_01}

#
az acr repository show --repository  reservationssystem-demo --name ${registry_name_01}
```

```bash
dns_label_01="mydnsnamedemo202209221408"

az container create \
--resource-group  ${resource_group_01} \
--name myinstance \
--image demo202209221408.azurecr.io/reservationssystem-demo:v2 \
--dns-name-label ${dns_label_01}  \
--registry-username ${user} \
--registry-password ${password} 


#
fqdn= $( az container show --resource-group  ${resource_group_01} --name myinstance --query ipAddress.fqdn )

echo ${fqdn}

```

```bash
curl "http://${dns_label_01}.westus.azurecontainer.io/api/reservations/20"
```

---

## Second part

###
```bash

# registry 2 name
registry_name_02="demoregistry20220922registry"

#
docker images

#
docker tag reservationssystem-demo:latest "${registry_name_02}.azurecr.io/reservationsystem:latest"

#
docker image ls

#
docker login "${registry_name_02}.azurecr.io"

#
docker push  "${registry_name_02}.azurecr.io/reservationsystem:latest"

```

###
```bash

dns_label_02="<THE_UNIQUE_DNS_LABEL>"

curl "http://${dns_label_02}.southcentralus.azurecontainer.io/api/reservations/20"
```


---

## Resources

- [Build a containerized web application with Docker](https://learn.microsoft.com/en-us/training/modules/intro-to-containers/?WT.mc_id=cloudskillschallenge_be5bc0a2-a274-4f0e-8e0f-5e7de6c045f0)

-[Registries - Check Name Availability](https://learn.microsoft.com/en-us/rest/api/containerregistry/registries/check-name-availability?tabs=HTTP#code-try-0)