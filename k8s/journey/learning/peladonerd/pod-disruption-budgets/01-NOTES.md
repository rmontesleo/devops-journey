# PDB:  Pod Disruption Bugets on Kubernetes


### Start minikube
```bash
minikube start
```

### Check nodes. By default , only one is created
```bash
kubectl get nodes -o wide
```

### Create two nodes more on minikube
```bash
minikube node add
minikube node add
```

### Check again your nodes
```bash
kubectl get nodes -o wide
```

### Apply the manifest to create your deployment with 15 replicas
```bash
kubectl apply -f manifest/01-deployment.yaml
```

### Check the pods you are created
```bash
kubectl get pods -o wide
```

### Drain the pods on node minikube-m03.  By default all nodes are deleted and then created in other nodes
```bash
kubectl drain  minikube-m03 --ignore-daemonsets
```

### Check the new pods, see in what nodes the were created
```bash
kubectl get pods -o wide
```

### Check your nodes. See the node 3, still exists, but it can not create more pods
```bash
kubectl get nodes -o wide
```

### Increase the current deployment to 30 pods, the pods are created in node 1 and 2. The node 3 can not recieved trafic
```bash
kubectl scale deployment nginx --replicas=30
```

### Release the trafic for node 3.  The node is empty, righ now.   The previous pod still in the nodes 1 and 2. 
```bash
kubectl uncordon minikube-m03
```

### See the pods, check the pods are only in node 1 and 2
```bash
kubectl get pods -o wide
```

### Reduce the pods to 6 pods.  Check in which nodes remains pods
```bash
kubectl scale deployment nginx --replicas=6
```

### Reduce to 0 the pods
```bash
kubectl scale deployment nginx --replicas=0
```

### Create again only 6 pods
```bash
kubectl scale deployment nginx --replicas=6
```

---

### Delete the deployment
kubectl delete -f  manifest/01-deployment.yaml

###  Create the PDB (Pod Disruption Buget)
kubectl apply -f manifest/02-pdb-nginx.yaml

### Create again the deployment
kubectl apply -f manifest/01-deployment.yaml

### drain again the node 3, and see how the pods are deleted and created
```bash
kubectl drain minikube-m03
```



## References

- [DRENANDO NODOS sin afectar tu APP - Pod Disruption Budgets en Kubernetes](https://www.youtube.com/watch?v=2tv1nhJuuJU)