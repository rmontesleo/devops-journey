# Kubernetes de Novato a Pro

### set the KUBECONFIG variable and fitst steps
```bash
export KUBECONFIG=$FULL_PATH/$KUBECONFIG_DOWNLOADED_FILE

kubectl get nodes

kubectl get nodes -o wide 

kubectl --help

# get the different contexts in .kubeconfig
kubectl config get-contexts

```


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

kubectl apply -f 02-pod.yaml

kubectl get pod nginx

kubectl get pod nginx -o yaml

kubectl delete pod nginx
```

### Deployment on Manifest
```bash

kubectl apply -f 03-deployment.yaml

kubectl get pods

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
```bash

# Statefulset is like a volume in Docker. A directory or disk attach to some pod. Its required for Databases.
kubectl apply -f 05-statefulset-digital-ocean.yaml

kubectl get pods -o wide

kubectl describe pod $some_pode_name

# persistent volume claim
kubectl get pvc

kubectl describe pvc $some_pvc_name

kubectl get statefulsets

kubectl delete sts $some_sts_name

kubectl get some_pvc_name

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
vim 06-randompod.yaml
kubectl apply -f 06-randompod.yaml

vim 07-hello-deployment-svc-clusterIP.yaml
kubectl apply -f 07-hello-deployment-svc-clusterIP.yaml

kubectl get all -o wide

# shows the IPs of each pod, that match with the label hello . This label is defined in the service.
kubectl describe svc hello

kubectl get pods -o wide


kubectl delete pod $some_pode_name
kubectl get pods -o wide
kubectl describe svc hello

kubectl exec -it ubuntu -- bash
```

### inside the pod
```bash
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
curl http://$public_node_ip_node01:3000
curl http://$public_node_ip_node02:3000
curl http://$public_node_ip_node03:3000

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

# from localhost
curl http://$load_balancer_ip:8080
curl http://$load_balancer_ip:8080
curl http://$load_balancer_ip:8080

```

### Ingress
### TODO: Check again this part on the video
```bash

vim 10-hello-v1-v2-deployment-svc.yaml
# each service create a node port service
kubectl apply -f 10-hello-v1-v2-deployment-svc.yaml

# find to serivces v1 and v2, and 6 pods (3 for each version)
kubectl get all -o wide

# the ingress service create a acces of the service using the path
# for this sammple is required that nginx is installed on Digital Ocean
vim 11-hello-ingress.yaml


kubectl get ns

kubectl -n ingress-nginx get pods

kubectl apply -f 11-hello-ingress.yaml

kubectl get ing

kubectl -n ingress-nginx get svc

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


