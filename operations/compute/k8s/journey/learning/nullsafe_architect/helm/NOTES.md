
# TODO: Some steps configuring the chart are missing


```bash

#find in all repositories a wordpress chart
helm search hub wordpress

# get the required values to install  wordpress
helm show values bitnami/wordpress

# add the repo bitnami and install worpress from this repo
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install my-release bitnami/wordpress

# create a helm chart and setting variables 
helm install miwordpress bitnami/wordpress --set wordpressUsername=chanchito --set wordpressPassword=feliz

# create install.yml file
vim install.yml

# Add the following content
##########################
wordpressUsername: hola
wordpressPassword: mundo
#########################

# Execute the installation of wordpress using a yml with the required values
helm install my-second-wordpress -f install.yml bitnami/wordpress

# delete the
helm delete my-second-wordpress

# create a new chart called miappping
helm create miappping

# go to the char
cd miappping

# see the content
ls

# cleanup the values.yaml file
echo "" > values.yaml

# add the folllowing values 
######################################################
frontReplicaCount: 2
backReplicaCount: 2

appTitle: Mi super app
######################################################

# change in templates folder.  All files here willl be deployed
cd templates
# clean up some files
echo "" > NOTES.txt
echo "" > _helpers.tpl
echo "" > deployment.yaml

# delete the service files

# configure the deployment.yaml


# indicarle donde empaqueta la applicacion
helm package miappping .

# indexar la carpeta
cd ..
helm repo index .



```


## References

- [Helm, el gestor de paquetes para Kubernetes](https://www.youtube.com/watch?v=5-Qcig2_8xo)