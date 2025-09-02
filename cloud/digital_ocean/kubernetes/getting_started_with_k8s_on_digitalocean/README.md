# Getting Started With Kubernetes on DigitalOcean

## Commands

### Create you docker image
```bash
# inside app folder run
docker build -t do-demo-python-k8s:v0 .
docker images
docker ps -a

# test your container
docker run -d --name demo01 -p 8080:8080 do-demo-python-k8s:v0
docker run -d --name demo02 -p 8081:8080 do-demo-python-k8s:v0

docker stop demo01 demo02
docker rm   demo01 demo02
```


### Registry on digital ocean usgin doctl
```bash

# first you must be login use
doctl auth init

# login in your registry
doctl registy login

docker images

docker tag do-demo-python-k8s:v0 registry.digitalocean.com/k8s-demo/do-demo-python-k8s:v0
            
docker push registry.digitalocean.com/k8s-demo/do-demo-python-k8s:v0

# get your registry
doctl registry get

# see your repositories in your registry
doctl registry repository list-v2

# see detail of your repository
doctl registry repository list-tags  do-demo-python-k8s

```

### doctl an kubernetes. Creating the cluster
```bash

# get help for cli and kubernetes option
doctl --help | less
doctl kubernetes --help | less
doctl kubernetes cluster --help | less
doctl kubernetes cluster create --help | less

# The minimun required command, it uses the default options
doctl kubernetes cluster create demo-k8s-cluster-default


# For more specific find some options
doctl kubernetes options

#
doctl kubernetes options regions

#
doctl kubernetes options sizes

#
doctl kubernetes options versions


# one option is with different values 
doctl kubernetes cluster create demo-k8s-cluster --region sfo3  --version 1.25.8-do.0 --node-pool "name=demo-k8s-nodepool;size=s-2vcpu-2gb;count=2;auto-scale=false"

# you can list your cluster
doctl kubernetes cluster list

# get detail by name or cluster id
doctl kubernetes cluster get demo-k8s-cluster

```

### Connecting with the cluster
```bash

kubectl version --client

# show all the configured clusters you have configured
kubectl config get-contexts

# Switch to another context
kubectl config use-context $k8s_cluster_context_name

kubectl get nodes -o wide
kubectl gete pod
kubectl get pods -A

```

### deploy the manifest, move to the k8s folder
```bash 

# one way to create the deployment with command create
kubectl create -f deployment.yaml
```

### verify what happening inside the pods
```bash

# this time we will see an issue, the status ImagePullBackOff and ErrImagePull
kubectl get pods -o wide

kubectl describe pod $full_pod_name

kubectl logs $full_pod_name


kubectl get deploy

kubectl delete -f deployment.yaml

# another way is with apply
kubectl apply -f deployment.yaml

kubectl get pods -o wide
kubectl get all -o wide

```

### expose the deployment
```bash
kubectl get svc -o wide

kubectl apply -f cluster-ip-service.yaml
kubectl get service
kubectl delete -f cluster-ip-service.yaml

kubectl apply -f load-balancer-service.yaml
kubectl get service

# find the external ip from the load balancer
kubectl get svc -o wide

curl http://$loadbalancer_ip:8080

```

---

## Using Minikube

### some options to start a cluster
```bash

docker tag  do-demo-python-k8s:v0  rmontesleo/do-demo-python-k8s:v0    
docker images     
docker push rmontesleo/do-demo-python-k8s:v0


minikube start
minikube start --nodes $number_of_nodes
minikube start --nodes $number_of_nodes --profile $profile_name
minikube profile list


```


---

### Hosts

Kim Schlesinger
@kimschles

Mason Egger
@masonegger

---

## Resources 

- [Webinar: Getting Started With Kubernetes on DigitalOcean](https://www.youtube.com/watch?v=cJKdo-glRD0)
- [Getting Started With Kubernetes on DigitalOcean](https://www.digitalocean.com/community/tech-talks/getting-started-with-kubernetes-on-digitalocean)

- [doctl](https://docs.digitalocean.com/reference/doctl/)
- [doctl kubernetes](https://docs.digitalocean.com/reference/doctl/reference/kubernetes/)
- [doctl registry kubernetes-manifest](https://docs.digitalocean.com/reference/doctl/reference/registry/kubernetes-manifest/)

- [DigitalOcean Kubernetes](https://docs.digitalocean.com/products/kubernetes/)
- [DigitalOcean eBook: Kubernetes for Full-Stack Developers](https://www.digitalocean.com/community/books/digitalocean-ebook-kubernetes-for-full-stack-developers)
- [PDF Book](https://assets.digitalocean.com/books/kubernetes-for-full-stack-developers.pdf)


- [Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
- [Service](https://kubernetes.io/docs/concepts/services-networking/service/)
- [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)

- [Configure Access to Multiple Clusters](https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/)
- [Kubectl Get Current Context](https://linuxhint.com/kubectl-get-current-context/)


- [Starts a local Kubernetes cluster](https://minikube.sigs.k8s.io/docs/commands/start/)
- [How To Use minikube for Local Kubernetes Development and Testing](https://www.digitalocean.com/community/tutorials/how-to-use-minikube-for-local-kubernetes-development-and-testing)