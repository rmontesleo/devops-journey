
## Basic commands with helm
```bash
# to show available repos of helm
helm repo list

# to add a new helm repo. the bitnami
helm repo add bitnami https://charts.bitnami.com/bitnami

# to seach all charts in repo bitnami
helm search repo bitnami

# to search wordpress inside bitnami repository
helm search repo bitnami/wordpress

# to get details about the chart
helm inspect chart bitnami/wordpress

# to get info about what values can you change
helm inspect values bitnami/wordpress


## to install wordpress. It geneate a random name
helm install bitnami/wordpress --generate-name

# install with specific name for a release
helm install  my-demo-wordpress bitnami/wordpress

# create a file with values
helm inspect values bitnami/wordpress > config.yaml
# install this config.yaml file
helm install -f config.yaml bitnami/wordpress --generate-name



# list the installed chars
helm list

# get all elmentes from my-demo-wordpress
kubectl get all --selector  app.kubernetes.io/instance=my-demo-wordpress

# get the service
kubectl get svc --namespace default -w my-demo-wordpress

# get the IP
export SERVICE_IP=$(kubectl get svc --namespace default my-demo-wordpress --template "{{ range (index .status.loadBalancer.ingress 0) }}{{ . }}{{ end }}")

# get the password for wordpress
echo Password: $(kubectl get secret --namespace default my-demo-wordpress -o jsonpath="{.data.wordpress-password}" | base64 -d)


# uninstall a chart by name
helm uninstall my-demo-wordpress


```