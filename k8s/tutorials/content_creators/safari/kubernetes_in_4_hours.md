#

##


## Setup


### Connect with your cluster in GCP
```bash
gcloud container clusters get-credentials $gcp_k8s_cluster_name --region $your_region --project $your_gcp_project
```

### Run minikube in a linux vm or WSL
```bash

# Simply way to start your minikube cluste
minikube start --vm-driver=docker

# if you have enougth resources on a virtual machin
minikube start --vm-driver=docker --memory=6g --cpus=4 


# if you want to add some nodes to your minikube cluster
minikube start  --vm-driver=docker --nodes 4 

# memory allow in wsl
minikube start  --vm-driver=docker --memory=3g  --nodes 4 



minikube status
```
---

## Working

###
```bash
kubectl get all
```

### for minikube launch dashboar
```bash
minikube dashboard
```

### Segment 2
```bash

#
kubectl get all -o wide

#
kubectl get nodes -o wide

kubectl -h

kubectl -h | less

kubectl completion -h

kubectl completion -h | less

kubectl create deployment -h | less

# copied from the help command output
kubectl create deployment my-dep --image=nginx --replicas=3
kubectl get all
kubectl delete deployment my-dep

# activate autocomplation in kubernetes
source <(kubectl completion bash)

kubectl create deployment my-deployment --image=nginx --replicas=3

kubectl get pods my-deployment-$some_pod_id
kubectl get pods my-deployment-$some_pod_id -o yaml
kubectl get pods my-deployment-$some_pod_id -o yaml | less

kubectl run nginx --image=nginx
kubectl get all 
kubectl delete pod nginx
kubectl get all

# Get the resources of the cluster you are conecter right now
kubectl api-resources | less


# create a deployment with image nginx:1.14
kubectl create deploy twonginx --image=nginx:1.14 --replicas=3

# get all elements filtering by deployment name
kubectl get all --selector app=twonginx

#
kubectl set -h | less
kubectl set image -h | less


# update the image of this deployment
kubectl set image deployments twonginx  nginx=nginx:1.9.1

# you will see how the previos deployment is removed and the new one is created
kubectl get all --selector app=twonginx -o wide

```

### Segment 3
```bash

kubectl explain pod.spec | less
```





---

## Resources

### OReilly
- [OReilly Live Events](https://learning.oreilly.com/live-events/kubernetes-in-4-hours/0636920056367/0636920082120/)
- [sandervanvugt:kubernetes](https://github.com/sandervanvugt/kubernetes)

### Minikube
- [minikube start](https://minikube.sigs.k8s.io/docs/start/)

### GCP
- [Kubernetes Engine API](https://cloud.google.com/kubernetes-engine/docs/reference/rest/?apix=true)

### Azure
- [](https://learn.microsoft.com/en-us/azure/aks/use-multiple-node-pools)

### Containerd
- [Containerd](https://containerd.io/)

