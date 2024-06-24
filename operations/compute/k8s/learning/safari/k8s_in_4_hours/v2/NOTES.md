

## Session

### First Hour
```bash
# Execute the following commands to clone repo, install minikube, and check your cluster
git clone https://github.com/sandervanvugt/kubernetes
cd kubernetes
ls
./minikube-docker-setup.sh

# this in linux. Check how to increase the memory to start minikube
minikube start --vm-driver=docker --memory=3G

# this in WSL
minikube start --vm-driver=docker --memory=3G --cni=calico

minikube status
kubectl get all

kubectl create deploy myapp --image=nginx --replicas=3
kubectl get all

```

### Second Hour
```bash
kubectl --help | less
kubectl create --help | less
kubectl create deployment --help | less
kubectl completion --help | less

# enable completion in linux
source <(kubectl completion bash)

kubectl get all

kubectl get pods

SELECTED_POD_NAME="<SET_THE_NAME_OF_THE_POD>"
kubectl get pod $SELECTED_POD_NAME
kubectl get pod $SELECTED_POD_NAME -o yaml | less
kubectl explain pod.spec | less
kubectl explain deploy.spec | less
kubectl api-resources | less
kubectl explain persistentvolume.spec | less

kubectl get all
kubectl delete pod $SELECTED_POD_NAME

kubectl run --help | less
kubectl run nginx --image=nginx
kubectl get all
kubectl delete pod nginx

kubectl get nodes
kubectl get pods -o wide

kubectl get all --show-lables
kubectl get all --selector app=myapp

kubectl get pods $SELECTED_POD_NAME -o yaml | less
kubectl describe pods $SELECTED_POD_NAME  | less

kubectl create deploy mynginx --image=nginx --dry-run=client -o yaml
kubectl create deploy mynginx --image=nginx --dry-run=client -o yaml > mynginx.yaml

kubectl explain deploy.spec.template.spec | less

kubectl apply -f mynginx.yaml


```


### 3th Hour
```bash
# ask for all namespaces -A
kubectl get all -A
kubectl get pods -A

# create a namespace
kubectl create ns secret
kubectl get ns

kubectl run mypod --image=nginx -n secret
kubectl run mypod --image=nginx 

kubectl get pods -n secret
kubectl get pods
kubectl get pods -A

# commands for troubleshooting
kubectl create deploy mydb --image=mariadb --replicas=3
kubectl get all
kubectl get all --selector app=mydb
kubectl describe pod $SOME_POD
kubectl logs $SOME_POD

kubectl set -h | less
kubectl set env -h | less
kubectl set env deploy/mydb MARIADB_ROOT_PASSWORD=password
kubectl get all --selector app=mydb
kubectl describe $OTHER_POD
kubectl logs $OTHER_POD

kubectl get deploy mydb -o yaml > mydb.yaml

# go inside the pod
kubectl exec -it $SOME_DB_POD -- bash

# Explaining the services
kubectl create deploy nginxsvc --image=nginx
kubectl scale  deploy nginxsvc --replicas=3
kubectl get all --selector app=nginxsvc
# to get the service IP
kubectl get all --selector app=nginxsvc -o wide

kubectl describe svc nginxsvc
curl $SOME_POD_IP
minikube ssh
# Inise the pod do again a curl to $SOME_POD_IP


kubectl get svc
# change the ClusterIP by NodePort
kubectl edit svc nginxsvc
# this time a port is available for the service
kubectl get svc

minikube ip
#curl the pod again the the minikube ip and the port assigned service
curl $MINIKUBE_CLUSTER_IP:$ASSIGNED_PORT

```

### 4th Hour
```bash

kubectl delete svc nginxsvc
kubectl expose deployment nginxsvc --port=80 --dry-run=client -o yaml > nginxsvc.yaml

# edit the nginxsvc.yaml and add type: NodePort

kubectl explain svc.spec | less
kubectl apply -f nginxsvc.yaml
kubectl get all --selector app=nginxsvc

kubectl explain pod.spec.volumes

# volumes
kubectl apply -f morevolumes.yaml
kubectl get pods morevol
kubectl describe pods morevol

kubectl exec -it morevol -c centos1 -- touch /cdentos1/test
kubectl exec -it morevol -c centos1 -- touch /centos1/test
kubectl exec -it morevol -c centos2 -- ls -l /centos2

kubectl get pods morevol -o yaml | less
kubectl explain pods.spec.securityContext | less

# configmap
kubectl create deployment mynewdb --image=mysql --replicas=3
kubectl get all --selector app=mynewdb

kubectl create cm mynewdbvars --from-literal=MYSQL_ROOT_PASSWORD=password
kubectl describe cm mynewdbvars
kubectl set env --from=configmap/mynewdbvars deploy/mynewdb
kubectl get all
kubectl get deploy myndwdbvars -o yaml
kubectl get all --selector app=mynewdb


# secrests
kubectl create secret generic -h | less
kubectl create secret generic mypw --from-literal=password=secret
kubectl describe secrets mypw
kubectl get secrets mypws -o yaml
echo $THE_ENCODED_PASSWORD | base64 -d

kubectl create secret docker-registry -h | less
kubectl create secret docker-resistry dockercreds --from-file=.dockerconfigjson=$HOME/.docker/config.json
kubectl describe secrets dockercreds
kubectl get secrets dockercreds -o yaml

# service account
kubectl explain sa

# add 
#imagePullSecret: 
#- name: dockercreds
kubectl edit sa default

kubectl run testapp --image=nginx



# check minikube addons
minikube addons list

# enable ingress on minikube
minikube addons enable ingress

# check pods
kubectl get pods -A
kubectl create ingress --help
kubectl create ingress nginxsvc --rule="nginxsvc.info/=nginxsvc:80"

# add the minikube ip and map with nginxsvc.info
sudo vim /etc/hosts

kubectl get ingress
curl nginx.svc.info

# find for the ingress-nginx-controller pod
kubectl get pods -A

# find for all the services, find for ingress-nginx-controller
kubectl get svc -A

# get by the ingress
kubectl get ing

kubectl describe ingress



```


## Resources

### Prepare 
- [The roxs dev](https://reto.295devops.com/)
- [Linux Fundamentals](https://learning.oreilly.com/course/linux-fundamentals/9780135560396/)
- [Containers in 4 Hours](https://learning.oreilly.com/live-events/containers-in-4-hours/0636920239529/)
- [Getting Started with Containers](https://learning.oreilly.com/course/getting-started-with/9780137649648/)


### Course Material
- [GitHub Repo](https://github.com/sandervanvugt/kubernetes)
- [Slides](https://on24static.akamaized.net/event/44/15/91/2/rt/1/documents/resourceList1704757710771/kubernetes.pdf)
- [Paste bin. January 17 2024](https://pastebin.com/KuJA5ZvN)
- [Paste bin. September 12 2023](https://pastebin.com/L9Kae9Yy)

### Follow Up

- [Building Microservices with Containers, Kubernetes, and Istio](https://learning.oreilly.com/live-events/building-microservices-with-containers-kubernetes-and-istio/0636920408468/)
- [Automating Kubernetes with GitOps](https://learning.oreilly.com/course/automating-kubernetes-with/9780138230258/)
- [Kubernetes Security](https://learning.oreilly.com/live-events/kubernetes-security/0636920289104/)
- [Kubernetes Troubleshootin](https://learning.oreilly.com/live-events/kubernetes-troubleshooting/0790145044098/)
- [GitOps for Kubernetes](https://learning.oreilly.com/live-events/gitops-for-kubernetes/0636920078987/)
- [Certified Kubernetes Application Developer (CKAD)](https://learning.oreilly.com/course/certified-kubernetes-application/9780136677628/)

