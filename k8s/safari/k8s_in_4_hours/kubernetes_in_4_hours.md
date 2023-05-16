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

#some notes
kubectl explain pod.spec | less

# to run an application
kubectl create deploy mynginx --image=nginx --replicas=3

kubectl get all
kubectl get pods

# get resources from an specific deployment (app)
kubectl get all --selector app=mynginx

#
kubectl describe pod mynginx-${some_rs_name}-${some_pod_id}

```

###
```bash
kubectl describe pod $some_pod_id | less

kubectl get pods -o yaml $some_pod_id
kubectl get pod  $some_pod_id -o yaml
kubectl get pod  $some_pod_id -o json

# dont write the manifest from scratch, generate with 

kubectl create deploy mynginx-demo --image=nginx --dry-run=client -o yaml > mynginx-demo.yaml

vim mynginx-demo.yaml
```

### original deployment yaml 
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: mynginx-demo
  name: mynginx-demo
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mynginx-demo
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: mynginx-demo
    spec:
      containers:
      - image: nginx
        name: nginx
        resources: {}
status: {}
```


### Add stage production and add version 1.15
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: mynginx-demo
  name: mynginx-demo
spec:
  replicas: 3
  selector:
    matchLabels:
      app: mynginx-demo
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: mynginx-demo
        stage: production
    spec:
      containers:
      - image: nginx:1.15
        name: nginx
        resources: {}
status: {}
```

###
```bash
kubectl apply -f mydeploy.yaml
kukbectl get all --selector app=mynginx-demo -o wide

# edit again the yaml file
vim mynginx-demo.yaml
```

### upgrade the version of nginx to 1.21 and replicas to 6
```bash
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: mynginx-demo
  name: mynginx-demo
spec:
  replicas: 6
  selector:
    matchLabels:
      app: mynginx-demo
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: mynginx-demo
        stage: production
    spec:
      containers:
      - image: nginx:1.21
        name: nginx
        resources: {}
status: {}

```

###
```bash
kubectl apply -f mydeploy.yaml
kukbectl get all --selector app=mynginx-demo -o wide

kubectl describe replicaset.apps/mynginx-demo-${first_replica_id}
kubectl describe replicaset.apps/mynginx-demo-${second_replica_id}
kubectl describe replicaset.apps/mynginx-demo-${last_replica_id}
```
### namespaces
```bash
kubectl get ns

# show pods in all namespaces
kubectl get pods -A

# show pods in an specific namespace
kubectl get all -n kube-system

```

### troubleshooting
```bash
#
kubectl create deploy mydb --image=mariadb --replicas=3
kubectl get all --selector app=mydb

kubectl describe pod ${mariadb_pod_id}
```


### To know what happend
```yaml
 State:          Waiting
      Reason:       CrashLoopBackOff
    Last State:     Terminated
      Reason:       Error
      Exit Code:    1
      Started:      Thu, 02 Mar 2023 10:25:49 -0600
      Finished:     Thu, 02 Mar 2023 10:25:49 -0600
    Ready:          False
    Restart Count:  4
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-gd6st (ro)
```

### To know why happend
```bash
kubectl logs ${mariadb_pod_id}
```

### logs
```yaml
2023-03-02 16:30:13+00:00 [Note] [Entrypoint]: Entrypoint script for MariaDB Server 1:10.11.2+maria~ubu2204 started.
2023-03-02 16:30:14+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
2023-03-02 16:30:14+00:00 [Note] [Entrypoint]: Entrypoint script for MariaDB Server 1:10.11.2+maria~ubu2204 started.
2023-03-02 16:30:14+00:00 [ERROR] [Entrypoint]: Database is uninitialized and password option is not specified
        You need to specify one of MARIADB_ROOT_PASSWORD, MARIADB_ROOT_PASSWORD_HASH, MARIADB_ALLOW_EMPTY_ROOT_PASSWORD and MARIADB_RANDOM_ROOT_PASSWORD
```

### set environment variable, and start to rolling updates
```bash
kubectl set env deploy/mydb MARIADB_ROOT_PASSWORD=secret
kubectl get all --selector app=mydb
```

###
```bash
kubectl run  gittool --image=sandervanvugt/gitops
kubectl get pod gittool
kubectl describe  pod gittool 
```

### part of the pod description. Exit code means the pod ends correctly ... but require some interactivity to continue alive
```yaml
 State:          Waiting
      Reason:       CrashLoopBackOff
    Last State:     Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Thu, 02 Mar 2023 10:40:52 -0600
      Finished:     Thu, 02 Mar 2023 10:40:52 -0600
    Ready:          False
    Restart Count:  3
```


```bash
kubectl delete pod gittool

kubectl run gittools --image=sandervanvugt/gitops -- sleep infinity

kubectl get pod gittools
kubectl describe pod gittools

# verify why can not resolve github.com
kubectl exec -it gittools -- git clone https://github.com/sandervanvugt/kubernetes

# fail execute bash
kubectl exec -it gittools -- bash

# try with sh
kubectl exec -it gittools -- sh

```

### inside the pod using sh
```bash
cat /etc/os-release
exit
```

### finish the pod
```bash
kubectl delete pod gittools

# delete some deployments
kubectl delete deploy easyapp mydb myginx myginxxx

```


### services
```bash
kubectl create deploy nginxsvc --image=nginx

kubectl scale  deploy nginxsvc --replicas=3

kubectl get svc

# by default the service is created like ClusterIP
kubectl expose deployment nginxsvc --port=80

# get info about the service
kubectl describe svc nginxsvc
```

### this works for minikube only
```bash
### this is only for minikube
minikube ssh

# this curl is inside of minikube
curl $private_ip_of_pod
```


### 
```bash
kubectl edit svc nginxsvc
```

### Change from ClusterIP to NodePort
```yaml
  ports:
  - port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: nginxsvc
  sessionAffinity: None
  type: NodePort
```

###
```bash

# now thw service is NodePort and get the opened port
kubectl get svc nginxsvc

# get the minikube ip
service_ip=$(minikube ip)

#
curl http://$service_ip:$service_port
```

### volumes
```bash
kubectl explain pod.spec.volumes

# check the volumer sample in kubernetes/morevolumes.yaml
vim morevolumes.yaml

kubectl apply -f morevolumes.yaml

# create some file on volume
kubectl exec -it morevol -c centos1 -- touch /centos1/test
kubectl exec -it morevol -c centos1 -- touch /centos1/hola.txt
kubectl exec -it morevol -c centos1 -- touch /centos1/hola2.txt


kubectl exec -it morevol -c centos1 -- ls /centos1
kubectl exec -it morevol -c centos2 -- ls /centos2/

```

### ConfigMaps and Secrets
```bash

kubectl create deployment mynewdb --image=mariadb --replicas=3 
kubectl get all --selector app=mynewdb -o wide
kubectl logs $some_mynewdb_pod_id

# create a config map
kubectl create cm mynewdbvar --from-literal=MARIADB_ROOT_PASSWORD=password12345

# review the variables and configurations in the config map
kubectl describe cm  mynewdbvar

# apply the configmap in the deployment
kubectl set env --from=configmap/mynewdbvar deploy/mynewdb

```

###
```bash
kubectl get pods $some_pod_id -o yaml | less
```


kubernetes in 4 hours
git ops
microservices and istio
kubernetes in 3 weeks (march 10th)



---

## Resources

### OReilly
- [OReilly Live Events](https://learning.oreilly.com/live-events/kubernetes-in-4-hours/0636920056367/0636920082120/)
- [sandervanvugt:kubernetes](https://github.com/sandervanvugt/kubernetes)

- [Getting Started with Kubernetes, 3rd Edition](https://learning.oreilly.com/videos/getting-started-with/9780138057626/)

### Kubernetes

- [Samples](kubernetes.io/docs)


### Minikube
- [minikube start](https://minikube.sigs.k8s.io/docs/start/)

### GCP
- [Kubernetes Engine API](https://cloud.google.com/kubernetes-engine/docs/reference/rest/?apix=true)

### Azure
- [](https://learn.microsoft.com/en-us/azure/aks/use-multiple-node-pools)

### Containerd
- [Containerd](https://containerd.io/)


## Solving Issues

- [Using the Google Cloud Platform SDK CLI to List all Active Resources Under a Given Project](https://stackoverflow.com/questions/58102443/using-the-google-cloud-platform-sdk-cli-to-list-all-active-resources-under-a-giv)

- [Using the Google Cloud Platform SDK CLI to List all Active Resources Under a Given Project](https://stackoverflow.com/questions/60517563/how-to-find-list-or-search-resources-across-services-apis-and-projects-in-go)


