# Hands-on Kubernetes Deployment in 3 Weeks (Week 2)



## Hour 1

### Replicas
```bash

# 
kubectl create deploy mynginx --image=nginx --replicas=3
kubectl get all
kubectl delete pod $some_pod_name
kubectl scale deploy mynginx --replicas=4
kubectl get all
kubectl scale deploy mynginx --replicas=0

#
kubectl edit deploy mynginx
```

###  
```yaml
strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
```

###
```bash
kubectl create deploy oldnginx --image=nginx:1.14 --replicas=3
kubectl get all --selector app=oldnginx
kubectl scale deploy oldnginx --replicas=10
kubectl set image deploy oldnginx nginx=nginx:latest
kubectl rollout status deployment oldnginx
kubectl rollout status deployment oldnginx
kubectl rollout history deployment oldnginx
kubectl get all --selector app=oldnginx -o wide
kubectl edit deployment oldnginx
kubectl get deployment oldnginx -o yaml

```

### labels
```bash
kubectl create deploy lnginx --image=nginx --replicas=3
kubectl get all --show-labels
kubectl get all --selector app=lnginx
kubectl delete pod $some_lnginx_podname
```


### DaemonSet
```bash
# there is no way to create a daemonset in imperative form, you must to use a declarative way

# cleaup some deployments
kubectl delete deploy lnginx mynginx oldnginx

kubectl create deploy daemondemo --image=nginx --dry-run=client -o yaml > demondemo.yaml

vim demondemo.yaml
```

###  Original
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: daemondemo
  name: daemondemo
spec:
  replicas: 1
  selector:
    matchLabels:
      app: daemondemo
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: daemondemo
    spec:
      containers:
      - image: nginx
        name: nginx
        resources: {}
status: {}
```

###  Modified
```yaml
apiVersion: apps/v1
kind: DaemonSet
metadata:
  creationTimestamp: null
  labels:
    app: daemondemo
  name: daemondemo
spec:  
  selector:
    matchLabels:
      app: daemondemo  
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: daemondemo
    spec:
      containers:
      - image: nginx
        name: nginx
        resources: {}
```

###
```bash
kubectl apply -f demondemo.yaml
kubectl get daemonset
kubectl get daemonset -o wide
kubectl get all --selector app=daemondemo
kubectl get all --selector app=daemondemo -o wide
kubectl edit node  minikube
kubectl edit node  minikube-m02
```

###
```bash
kubectl create deployment nginxsvc --image=nginx
kubectl scale  deployment nginxsvc --replicas=3
kubectl get all -o wide --selector app=nginxsvc
kubectl expose deployment nginxsvc --port=80
kubectl get all -o wide --selector app=nginxsvc
kubectl describe svc nginxsvc
kubectl get endpoints
kubctl edit svc nginxsvc

```



---

## Hour 2

###
```bash

```

---


## Hour 3

###
```bash

```

---


## Hour 4

###
```bash



```

---

## REFERENCES


- [Hands-on Kubernetes Deployment in 3 Weeks](https://learning.oreilly.com/live-events/hands-on-kubernetes-deployment-in-3-weeks/0636920063329/0636920084018/)

- [Kubernetes in 3 Weeks](https://github.com/sandervanvugt/kube3weeks)

- [Katacoda Scenarios](https://on24static.akamaized.net/event/39/99/70/2/rt/1/documents/resourceList1678199514351/katacoda11152116371603020831211666874761993.pdf)

- [PDF Slides](https://on24static.akamaized.net/event/39/99/70/2/rt/1/documents/resourceList1678199483509/kubernetesin3weeks310231678199482966.pdf)