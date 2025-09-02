#!/bin/bash

source environment_variables

#######################################################################################################
# Valid loging to JFrog Container Registry but insecure
# docker login -u$JFROG_USERNAME $JFROG_CONTAINER_REGISTRY -p$JFROG_TOKEN
# Login with user and provide a password through STDIN by reading from a file or environment variable
# cat ./token_file | docker login -u$JFROG_USERNAME $JFROG_CONTAINER_REGISTRY --password-stdin
echo  $JFROG_TOKEN | docker login -u$JFROG_USERNAME $JFROG_CONTAINER_REGISTRY --password-stdin
#######################################################################################################

#######################################################################################################
# Verify registry repository in JFrog platfomr
container_registry_repository="spring-demo-docker-appimages"
#######################################################################################################

#######################################################################################################
# Downlad demo image from Docker Hub
docker pull rmontesleo/bashgpt:demo
image_id=$(docker images -q bashgpt:demo)

# Set values for the image to be pushed
docker_image_name="bash-gpt-demo"
docker_image_tag="latest"
#######################################################################################################


# Tag Image
docker tag $imgage_id $JFROG_CONTAINER_REGISTRY/$container_registry_repository/$docker_image_name:$docker_image_tag

# Push Image
docker push $JFROG_CONTAINER_REGISTRY/$container_registry_repository/$docker_image_name:$docker_image_tag

# remove local image
docker rmi $JFROG_CONTAINER_REGISTRY/$container_registry_repository/$docker_image_name:$docker_image_tag

# List images to verify
docker images

# Pull image to verify
docker pull $JFROG_CONTAINER_REGISTRY/$container_registry_repository/$docker_image_name:$docker_image_tag

docker images  

docker logout $JFROG_CONTAINER_REGISTRY