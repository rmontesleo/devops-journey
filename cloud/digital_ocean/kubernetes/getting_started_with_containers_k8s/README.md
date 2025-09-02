# A DigitalOcean Workshop: Get Started with Containers and Kubernetes

## Workshop code

### Building & tag image
```bash
docker build -t do-flask-demo:v0 .
docker images
```

### Run container/test
```bash
docker run -d  -p 5000:5000 --name demo  do-flask-demo:v0
docker ps
docker logs demo
curl http://localhost:5000

# use this in browser if the container is running in WSL2 in Window
# http://127.0.0.1:5000/

docker stop demo
docker rm -f $(docker ps -aq)


```

### Tag and push your docke image to docker registry
```bash

docker_registry_name="rmontesleo"
docker tag do-flask-demo:v0  $docker_registry_name/do-flask-demo:v0
docker images

docker logout
docker login

docker push $docker_registry_name/do-flask-demo:v0

```

### connect with k8s cluster
```bash
export KUBECONFIG=$PWD/kubeconfig.yaml
```



### Operations with the pod
```bash

kubectl version --client

kubectl get nodes -o wide


# Deply  the flask pod
kubectl apply -f flask-pod.yaml

# check that ist up
kubectl get pod

kubectl get all -o wide

# Forward a local port into the cluster so that we can access it
kubectl port-forward pods/flask-pod 5000:5000

# use curl command
curl http://localhost:5000

# Delete the Pod
kubectl delete pod flask-pod

```

### Operations with the Deployment
```bash
# Roll out the Flask Deployment
kubectl  apply -f flask-deployment.yaml

# check wht its up
kubectl get deploy
kubectl get pods

# forward a local port into the cluster we can access it
kubectl port-forward deployment/flask-dep 5000:5000

curl http://localhost:5000

```

### Opeerations with the Services (LoadBalancer)
```bash
# Deploy the Flask LoadBalancer Service
kubectl apply -f flask-service.yaml

# Check that its up
kubectl get svc -o wide

curl $loadbalancer_external_ip


# Get external IP of Nodes (For  NodePort Services)
kubectl get nodes -o wide


```




---

## Host

Frédéric Harper Sr Developer Advocate
@fharper
fred@do.co



## References
- [Webinar](https://www.youtube.com/watch?v=7WOgYfZgSf0)
- [Running Cloud Native Applications on DigitalOcean Kubernetes](https://assets.digitalocean.com/white-papers/running-digitalocean-kubernetes.pdf)
- [Digital Ocean Tutorials](https://www.digitalocean.com/community/tutorials)


- [Pods](https://kubernetes.io/docs/concepts/workloads/pods/)
- [Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)