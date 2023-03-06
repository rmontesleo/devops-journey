# Task Tracker sample




### Create your environment variables file
```bash

touch variables

vim variables
```


### Set your Environment variables
```bash

# Repository name
digital_ocean_registry_name="<TYPE_YOUR_REGISTRY_NAME>"

# Concat the digital ocean registry and your repository
digital_ocean_registry_endpoint="registry.digitalocean.com/$digital_ocean_registry_name"

# digital ocean region
digital_ocean_region="<TYPE_YOUR_REGION>"

#docker registry
docker_registry_name="<TYPE_YOUR_DOCKER_REGISTRY_NAME>"

# Image and version 
task_tracker_image="<IMAGE_NAME>:<IMAGE_VERSION>"

```




### Prepare settings to Digital Ocean and Push your image in your registry.
```bash

# set the values in variables file
source variables



# get help of the doctl command line
doctcl --help

# setup your environment
doctl auth init

# get help about registry
doctl registry --help


# login in your registry
doctl registry login


# get all your registries
doctl registy get


# create your registry
doctl registry create  $digital_ocean_registry_name --region $digital_ocean_region


# Pull the image from docker hub
docker pull $docker_registry_name/$task_tracker_image

# Tag the image for Digital Ocean Registry
docker tag $docker_registry_name/$task_tracker_image $digital_ocean_registry_endpoint/$task_tracker_image

#verify your images
docker images


# Push the image
docker push $digital_ocean_registry_endpoint/$task_tracker_image


# get again all your registries
doctl registy get


# List your repositories
doctl registry  repository  list-v2


```


## References


- [Container Registry Quickstart](https://docs.digitalocean.com/products/container-registry/quickstart/)

- [How to Use Your Private DigitalOcean Container Registry with Docker and Kubernetes](https://docs.digitalocean.com/products/container-registry/how-to/use-registry-docker-kubernetes/)