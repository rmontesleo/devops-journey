# K8s Notes

---

## Create a cluster with the default profile (minikube)



### Review the profiles, the first time you must see nothing
```bash
minikube profile list
```

### If you want to delete all clusters
```bash
minkube delete
```


### Create a new default profile called "minikube" with 2GB of memory and Docker like driver 
```bash
minikube start --driver=docker --memory=2048
```

### Check the content of your cluster
```bash
kubectl get all
```


### Stop this cluster

```bash
minikube stop
```

### Start the default cluster
```bash
minikube start
```


### Create a deployment of nginx with 3 replicas
```bash
kubectl create deploymen my-nginx-deployment --image=nginx --port=80 --replicas=3
```

### Create the service to expose your deployment. The type is NodePort
```bash
kubectl expose deployment my-nginx-deployment --type=nodePort
```

### And get the port with get services.  Take the port of the right 80:<THE_NGINX_EXPOSED_PORT> of the my-nginx-deployment
```bash
kubectl get services
```


### Remember you can get the expose ip  with minikube ip, 
```bash
minikube ip
```

### create a variable to remember the minikube ip
```bash
export MINIKUBE_IP=$(minikube ip)
```

### Verify the variable is set
```bash
echo $MINIKUBE_IP
```


### Test my-nginx-deployment is working, call using curl . 
```bash
curl $MINIKUBE_IP:<THE_NGINX_EXPOSED_PORT>
```

### Export the deployment to a yaml file
```bash 
kubectl create deployment --image=nginx --port=80 --replicas=3  --dry-run=client -o yaml  my-nginx-deployment   > web-nginx-deployment.yaml
```

### Edit the web-nginx-deployment.yaml file, change the number of replicas to 10 and change the name my-nginx-deployment for  web-nginx-deplyment


### Export the service to a yaml file
```bash
kubectl expose deployment --dry-run=client -o yaml my-nginx-deployment --type=NodePort > web-nginx-service.yaml
```

### Edit the web-nginx-service.yaml file, change the name my-nginx-deployment for  web-nginx-deplyment

### The files will be used later


---

##  K8s Cluster with Virtual Box


### Create a second profile call SecondProfile with 4GB of memory and Virtual Box like driver
```bash
minikube start -p SecondProfile --driver=docker  --memory=2048
```


### chek now how many profiles you get in minikube
```bash
minikube profile list
```


### Check the content of your cluster, you must see nothing
```bash
kubectl get all
```


### import the web-nginx-deployment.yaml file 
```bash
kubectl apply -f web-nginx-deployment.yaml
```

### import the web-nginx-service.yaml file 
```bash
kubectl apply -f web-nginx-service.yaml
```

### check again your resources, and test with curl your service.
```bash

```


### stop the SecondProfile profile
```bash
minikube stop -p SecondProfile
```