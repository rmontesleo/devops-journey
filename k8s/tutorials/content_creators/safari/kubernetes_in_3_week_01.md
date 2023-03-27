# Hands-on Kubernetes Deployment in 3 Weeks (Week 1)


### For each virtual machine ( 1 master and 2 nodes)
- 4 GB RAM
- 2 CPU
- 20 GB disk
- ubuntu server


### Linux requirements for each virtual machine
```bash
free -m

lscpu  | less

df -h
```


### Setup the k8s cluster
```bash

##### Do this in each node  #####
git clone https://github.com/sandervanvugt/kube3weeks
cd kube3weeks
vim setup-container.sh
./setup-container.sh
sudo systemctl status containerd

sudo ./setup-kubetools.sh
#####                       

#### Do this only in master node ####
sudo kubeadm init

# Copy the kubeadmin join instruction, and executed in your workers. Execute with sudo

# this is to start using the cluster
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


kubectl get all -o wide

kubectl apply -f calico.yaml
####


### some commands after installation in master

free -m
source <(kubectl completion bash)
```

### some kubeadm commands
```bash
kubeadm token list
kubeadm token create
kubeadm token create --print-join-command
```


### Star working with K8s
```bash

kubectl create deployment myfirstapp --image=nginx --replicas=3
kubectl get all -o wide

kubectl run lonelypod --image=nginx

sudo systemctl status containerd

sudo systemctl status kubelet

kubectl get pods -n kube-system

kubectl config view

kubectl get nodes

kubectl edit nodes control

kubectl api-resources | less

kubectl explain pod.spec

kubectl run mynginx --image=nginx --dry-run=client -o yaml

kubectl run mynginx --image=nginx --dry-run=client -o yaml > mynginx.yaml

kubectl explain pods.spec

kubectl apply -f mynginx.yaml
kubectl delete -f mynginx.yaml

```


## 4 hour
```bash

#
kubectl apply -f multicontainer.yaml
kubectl get pods

# look up example code from kubernetes.io/docs
kubectl initcontainer.yaml

kubectl get pods

#
kubectl get pods

kubectl get pods -n kube-system

kubectl get ns

kubecrl create ns myns

kubectl get ns

kubectl run mypod --image=nginx -n myns

kubectl get pods
kubectl get pods -n myns
kubectl get pods -A


# change the default namespace
kubectl confgi set-context --current --namespace=myns
kubectl config view
kubectl get pods

# return to default namespace
kubectl config -set-context --current --namespace=default
kubectl config view
kubectl get pods

## troubleshooting
kubectl run mydb --image=mariadb
kubectl get pods
kubectl describe pods mydb
kubectl describe pods mydb | less
kubectl logs mydb

kubectl run -h | less
kubectl run dbsdb --image=mariadb --env MARIADB_ROOT_PASSWORD=password
kubectl get pods

# see the status PENDING
kubectl -f frontend-resources.yml
kubectl get pods
kubectl describe pod frontend
# the request is the minimum requirment resources for a pod
kubectl delete pod frontend

#
kubectl run busy --image=busybox
kubectl get pods
kubectl describe pods busybox

kubectl get pods -o wide


```






---

## References

- [Hands-on Kubernetes Deployment in 3 Weeks](https://learning.oreilly.com/live-events/hands-on-kubernetes-deployment-in-3-weeks/0636920063329/0636920084018/)

- [Kubernetes in 3 Weeks](https://github.com/sandervanvugt/kube3weeks)

- [kubeadm token](https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-token/)

- [files for CKA online course](https://github.com/sandervanvugt/cka)

- [PDF Slides](https://on24static.akamaized.net/event/39/99/70/1/rt/1/documents/resourceList1678198422384/kubernetesin3weeks310231678198421770.pdf)

- [Scenarios](https://on24static.akamaized.net/event/39/99/70/1/rt/1/documents/resourceList1678198441415/katacoda11152116371603020831211666874761993.pdf)

- [Kubernetes Sandbox](https://learning.oreilly.com/scenarios/kubernetes-sandbox/9781492062820/)

- [How to Install Ubuntu 22.04 LTS on VirtualBox in Windows 11](https://www.youtube.com/watch?v=H44W6oBEvtA)

- [Ubuntu Server](https://ubuntu.com/download/server)

- [](https://learning.oreilly.com/scenarios/kubernetes-sandbox/9781492062820/)

- [](https://killercoda.com/playgrounds/scenario/ubuntu)

- [](https://stackoverflow.com/questions/51121136/the-connection-to-the-server-localhost8080-was-refused-did-you-specify-the-ri/52262765#52262765)

- [](https://learning.oreilly.com/videos/getting-started-with/9780138057626/9780138057626-GSK3_03_10_01/)

- [Init Containers](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/)