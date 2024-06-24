# Kubernetes de Novato a Pro

### set the KUBECONFIG variable and fitst steps
```bash
export KUBECONFIG=$FULL_PATH/$KUBECONFIG_DOWNLOADED_FILE


# get the different contexts in .kubeconfig
# Lists your cluster name, user, and namespace
kubectl config get-contexts

# Display addresses of the control plane and cluster services
kubectl cluster-info

# Display the client and server k8s version
kubectl version

# List all nodes created in the cluster
kubectl get nodes

kubectl get nodes -o wide 

kubectl --help

```

### TODO verify if the next topics could be executed with minikube, kind or other local k8s solution
 - Volumes
 - Load Balancer
 - Ingress()



### namespaces
```bash
kubectl get ns

# get all pods of kube-system namespace
kubectl -n kube-system get pods

kubectl -n kube-system get pod -o wide

kubectl -n kube-system delete pod $some_pode_name

kubectl -n kube-system get pods -o wide

```

### Pods on Manifest
```bash
kubectl apply -f 01-pod.yaml

kubectl get pods

kubectl exec -it nginx -- sh

kubectl delete pod nginx 

kubectl get pods

kubectl apply -f 02-pod.yaml

kubectl get pod nginx

kubectl exec -it nginx -- sh

# get all the yaml of the pod
kubectl get pod nginx -o yaml

kubectl describe pod nginx

kubectl delete pod nginx
```

### Deployment on Manifest
```bash

kubectl apply -f 03-deployment.yaml

kubectl get pods

kubectl get pods -o wide

kubectl scale deployment nginx-deployment --replicas=1
kubectl scale deployment nginx-deployment --replicas=3
kubectl scale deployment nginx-deployment --replicas=10
kubectl scale deployment nginx-deployment --replicas=18
kubectl scale deployment nginx-deployment --replicas=3

kubectl delete pod $some_pode_name

kubect get pods

```

### DaemonSet Manifest: Daemonset is deploy on each node of the cluster. This is usefull for monitoring or getting logs
```bash
vim 04-daemonset.yaml

kubectl apply -f 04-daemonset.yaml

kubectl get pods

# you should get one pod for node
kubectl get pods -o wide

kubectl delete pod $some_pode_name

kubectl get pods -o wide

```

### StatefulSet Manifest:
### StatefulSet is a deployment with a volume atteched to it. Usefull for databases.
```bash

# Statefulset is like a volume in Docker. A directory or disk attach to some pod. Its required for Databases.
kubectl apply -f 05-statefulset-digital-ocean.yaml

kubectl get pods -o wide

kubectl describe pod $some_steatefull_pod_name

# persistent volume claim (pvc)
# the pvc is a request from kubernetes to the cloud provider for a volume
kubectl get pvc

kubectl describe pvc $some_pvc_name

kubectl get statefulsets

kubectl describe sts $some_sts_name

kubectl delete sts $some_sts_name

kubectl get $some_pvc_name

kubectl delete pvc $some_pvc_name

```

### Networking
```bash
# Each pod has its own IP
# IP Routing
```

### Services definition
```bash
# Cluster IP: Fixed IP in the node worker. A kind of load balancer for the pods assigned to that service.
# Node Port: Create a Port in each node, to assign network trafict for the pods.
# Load Balancer: Service for the cloud. To redirect the trafic in the cloud
```

### K8s Services: Cluster IP
```bash

# create a basic ubuntu pod
kubectl run ubuntu-demo --image=ubuntu -it -- bash

vim 06-randompod.yaml
kubectl apply -f 06-randompod.yaml

vim 07-hello-deployment-svc-clusterIP.yaml
kubectl apply -f 07-hello-deployment-svc-clusterIP.yaml

kubectl get all -o wide

# shows the IPs of each pod, that match with the label hello . This label is defined in the service.
kubectl describe svc hello

kubectl get pods
kubectl get pods -o wide


kubectl delete pod $some_balanced_pod_name
kubectl get pods -o wide
kubectl describe svc hello

kubectl exec -it ubuntu -- bash
```

### inside the pod
```bash
cat /etc/os-release
apt-get -y update && apt install -y iputils-ping curl
ping hello
```

### verify data with the pods and services
```bash
# we must see teh CLuster IP with the value show in the ping of the pod
kubectl get svc

kubectl exec -it ubuntu -- bash
```

### inside the pod again
```bash
## each time you will see different data from the pod

curl http://hello:8080
curl http://hello:8080
curl http://hello:8080
```

### end the hello service cluster if
```bash
kubectl delete -f 07-hello-deployment-svc-clusterIP.yaml
```


### K8s Services: Node Port
```bash
vim 08-hello-deployment-svc-nodePort.yaml
kubectl apply -f 08-hello-deployment-svc-nodePort.yaml

# get the port of the service/hello
kubectl get all -o wide


# find the public IP of each node
kubectl get nodes -o wide


# from the local host
curl http://$public_node_ip_node01:30000
curl http://$public_node_ip_node02:30000
curl http://$public_node_ip_node03:30000

kubectl delete -f 08-hello-deployment-svc-nodePort.yaml

```

### K8s  Services: Load Balancer
```bash
vim 09-hello-deployment-svc-loadBalancer.yaml

kubectl apply -f 09-hello-deployment-svc-loadBalancer.yaml

# find for the load balancer service, the process takes time , because its crating things in the cloud
kubectl get svc

# see the events
kubectl describe svc hello

# find for the load balancer IP
kubectl get svc
kubectl get svc -o wide


# from localhost
curl http://$load_balancer_ip:8080
curl http://$load_balancer_ip:8080
curl http://$load_balancer_ip:8080

```

### Ingress
### TODO: Check again this part on the video
### FIX : the ingress load balancer
```bash

vim 10-hello-v1-v2-deployment-svc.yaml
# each service create a node port service
kubectl apply -f 10-hello-v1-v2-deployment-svc.yaml

# find to serivces v1 and v2, and 6 pods (3 for each version)
kubectl get all -o wide

# the ingress service create a acces of the service using the path
# for this sammple is required that nginx is installed on Digital Ocean

# Go to k8s cluster, in market place and find to install  NGINX Ingress COntroller app. Minimum a Cluster with 2 nodes is required

vim 11-hello-ingress.yaml


kubectl get ns

kubectl get pods --all-namespaces -l app.kubernetes.io/name=ingress-nginx

kubectl -n ingress-nginx get pods

kubectl -n ingress-nginx get pods -o wide

kubectl apply -f 11-hello-ingress.yaml

# show the resources of typ ingress
kubectl get ing

# get the public ip from LoadBalance
kubectl -n ingress-nginx get svc

#
kubectl get svc -n ingress-nginx

curl http://$public_load_balancer_ip/

curl http://$public_load_balancer_ip/v1

curl http://$public_load_balancer_ip/v2

```

### Config Map
```bash

vim 12-configmap.yaml
vim 13-pod-configmap.yaml

kubectl apply -f 12-configmap.yaml
kubeclt apply -f 13-pod-configmap.yaml

kubectl get all -o wide
kubectl get pods -o wide

kubectl exec -i nginx -- sh

```

### inside the pod
```bash
env

ls /config/
```

### clean resources
```bash
kubectl delete -f 12-configmap.yaml
kubeclt delete -f 13-pod-configmap.yaml

```

### Secrets
```bash

vim 14-secrets.yaml
vim 15-pod-secret.yaml

kubectl apply -f 14-secrets.yaml
kubectl apply -f 15-pod-secret.yaml

kubectl exec -it nginx -- sh
```

### in the pod
```bash
env
```

### 
```bash
kubectl delete -f 14-secrets.yaml
kubectl delete -f 15-pod-secret.yaml
```

### Kustomization
### TODO: See again this section
```bash

```


### Stern
### TODO: See again this section
```bash

```






---

### Install minikube
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```


### Install Kubecolor
```bash
wget https://github.com/hidetatz/kubecolor/releases/download/v0.0.25/kubecolor_0.0.25_Linux_x86_64.tar.gz
tar -xzvf kubecolor_0.0.25_Linux_x86_64.tar.gz
sudo mv kubecolor /usr/local/bin/kubecolor
```

### Install K9s
```bash
wget https://github.com/derailed/k9s/releases/download/v0.26.7/k9s_Linux_x86_64.tar.gz
tar -xzvf k9s_Linux_x86_64.tar.gz
sudo mv  k9s /usr/local/bin
```




---

## References

- [Kubectl plugins available](https://krew.sigs.k8s.io/plugins/)
- [kubecolor](https://github.com/hidetatz/kubecolor)
- [kubecolor releases](https://github.com/hidetatz/kubecolor/releases)
- [stern](https://github.com/stern/stern)
- [stern releases](https://github.com/stern/stern/releases)


### Linux
- [](https://linuxconfig.org/ping-command-not-found-on-ubuntu-20-04-focal-fossa-linux)
- [](https://www.cyberciti.biz/faq/how-to-install-curl-command-on-a-ubuntu-linux/)


### Kubernetes

- [Install and Set Up kubectl on Linux](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
- [DaemonSet](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/#create-a-daemonset)

- [Fire up an interactive bash Pod within a Kubernetes cluster](https://gc-taylor.com/blog/2016/10/31/fire-up-an-interactive-bash-pod-within-a-kubernetes-cluster)


### Minikube
- [](https://minikube.sigs.k8s.io/docs/handbook/accessing/)
- [](https://minikube.sigs.k8s.io/docs/tutorials/multi_node/)

### Azure
- [](https://learn.microsoft.com/en-us/azure/aks/concepts-storage)
- [](https://learn.microsoft.com/en-us/azure/aks/azure-csi-disk-storage-provision)
- [](https://arunksingh16.medium.com/azure-storageclass-in-azure-kubernetes-service-aks-5167c4e7682)


### Digital Ocean
- [](https://docs.digitalocean.com/tutorials/)
- [] (https://docs.digitalocean.com/products/billing/billing-alerts/)
- [](https://www.digitalocean.com/community/tutorials?q=kubernetes&hits_per_page=12)
- [](https://docs.digitalocean.com/tutorials/enable-push-to-deploy/)
- [NGINX Ingress Controller](https://marketplace.digitalocean.com/apps/nginx-ingress-controller)


### Linode

- [Understanding Kubernetes](https://www.linode.com/content/kubernetes-guide-pdf/)
- [](https://www.linode.com/community/questions/19381/does-linodes-platform-enable-setting-a-billing-alert)
- [](https://www.linode.com/docs/guides/deploy-volumes-with-the-linode-block-storage-csi-driver/)


### Microservices
- [] (https://medium.com/globant/load-balance-microservices-using-kubernetes-minikube-88b78dae4796)


### Docker Hub

- [digitalocean/do-agent](https://hub.docker.com/r/digitalocean/do-agent/tags)