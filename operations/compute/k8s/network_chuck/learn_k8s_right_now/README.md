# NETWORK CHUCK

```bash

vim kubeconfig.yaml

export KUBECONFIG=kubeconfig.yaml

kubectl get nodes

kubectl cluster-info 

kubectl run networkchuckcoffe --image=thenetworkchuck/nccoffee:pourover --port=80

kubectl describe pods

kubectl delete pods networkchuckcoffe

kubectl apply -f  nccoffeedeployment.yaml

kubeclt get deplolyments

kubectl get pods

# edit with the name of the deployment (update to  6 replicsa)
kubectl edit  deployment networkchuckcoffee-deployment

# scale by command line
kubectl scale --replicas=10  deployment networkchuckcoffee-deployment

kubectl get pods -o wide 

kubectl apply -f coffee-service.yaml

kubectl get services

curl $load_balancer_ip

kubectl get services coffee-service

kubectl describe services coffee-service

kubectl edit  deployment networkchuckcoffee-deployment

kubectl get pods


```

### nccoffeedeployment.yaml
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: networkchuckcoffee-deployment
  labels:
    app: nccofee
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nccofee
  template:
    metadata:
      labels:
        app: nccofee
    spec:
      containers:
      - name: nccofee
        image: thenetworkchuck/nccoffee:pourover
        imagePullPolicy: Always
        ports:
        - containerPort: 80
```

### coffee-service.yaml
```yaml
apiVersion: v1
kind: Service
metadata:
  name: coffee-service
  labels:
  	app: coffee-service
spec:
  type: LoadBalancer  
  ports:
  - name: http
    port: 80
    protocol: TCP    
    targetPort: 80
  selector:
    app: nccofee
  sessionAffinity: None  

```

## References 

- [you need to learn Kubernetes RIGHT NOW!!](https://www.youtube.com/watch?v=7bA0gTroJjw)
- [thenetworkchuck](https://hub.docker.com/u/thenetworkchuck)
- [Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
- [Service](https://kubernetes.io/docs/concepts/services-networking/service/)

- [Compute - Linode Kubernetes Engine](https://www.linode.com/docs/products/compute/kubernetes/)
- [linode-cli](https://github.com/linode/linode-cli)

- [alias for kubectl](https://www.google.com/search?q=alias+for+kubectl&oq=alias+for+kubectl&aqs=chrome..69i57j0i512l2j0i22i30l2j0i22i30i625l3j0i22i30j0i22i30i625.3893j0j7&sourceid=chrome&ie=UTF-8)

- [Get Started](https://www.linode.com/docs/guides/platform/get-started/)

- [](https://www.linode.com/digitalocean-vs-linode/)