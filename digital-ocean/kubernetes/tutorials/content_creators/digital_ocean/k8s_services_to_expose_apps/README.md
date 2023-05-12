# Practical Kubernetes Networking: How to Use Kubernetes Services to Expose Your App


---

## Coding

### checking the cluster with example web-siet
```bash
#
kubectl get nodes

#
kubectl get pods -A

kubectl get pods

kubectl create -f kube-manifest/deployment.yaml

kubectl get deploy

kubectl get pods -o wide

kubectl apply -f kube-manifest/utils.yaml

# go inside utility pod
kubectl exec -it $utility_podname -- /bin/bash

```


### inside the utility pod
```bash
## inside teh pod
curl http://$webapp_private_ip:3000

exit
```

### working now with the deployment
```bash
kubectl get pods --show-labels

# this create load balancer service
kubectl apply -f kube-manifest/service.yaml

```

### using the api sample project (switching to other project directory)
```bash
# run the go project on localhost

# curl the api
curl http://localhost:4000/api/v1/users

kubectl create -f kube-manifest/deploy.yaml

kubectl get deploy

kubectl get pods

kubectl get pods -o wide | grep api
kubectl get pods -o wide | grep utilities

# go inside the utilities pod
kubectl exec -it $utility_podname -- /bin/bash

```

### inside the utilities pod
```bash
curl $api_private_ip_01:4000/api/v1/users | jq .
curl $api_private_ip_02:4000/api/v1/users | jq .
curl $api_private_ip_03:4000/api/v1/users | jq .

exit
```


### appliying the cluster ip servide
```bash
kubectl apply -f manifest/service.yaml
kubectl get svc -o wide

# go inside the utilities pod
kubectl exec -it $utility_podname -- /bin/bash
```

### inside the utilities pod
```bash
curl http://$api_private_ip_01:4000/api/v1/users | jq .

curl http://example-service-clusterip/api/v1/users | jq .


# generic form of service discovery syntax
curl http://service-name.namespace.svc.cluster.local

# for this sample and to invoke the api
curl http://example-service-clusterip.default.svc.cluster.local/api/v1/users

curl http://example-service-clusterip/api/v1/users | jq .

exit
```


### a way to find the service
```bash


```




---

## References

- [Youtube Practical Kubernetes Networking: How to Use Kubernetes Services to Expose Your App](https://www.youtube.com/watch?v=SoByggox15g)
- [Example Kubernetes Workloads](https://github.com/do-community/example-k8s-workloads)
- [DO Practical Kubernetes Networking: How to Use Kubernetes Services to Expose Your App](https://www.digitalocean.com/community/tech-talks/how-to-use-kubernetes-services-to-expose-your-app)
- [Tutorials](https://www.digitalocean.com/community/tutorials?q=%5Btech-talks%5D&hits_per_page=12)

- [Tech Talk results](https://www.digitalocean.com/community/tutorials?subtype=tech-talks&q=tech+talks+%5BKubernetes%5D&hits_per_page=12)

- [Service](https://kubernetes.io/docs/concepts/services-networking/service/)
- [Connecting Applications with Services](https://kubernetes.io/docs/tutorials/services/connect-applications-service/)

- [Kim Schlesinger](https://github.com/kimschles)
- [Welcome to 100 Days Of Kubernetes!](https://100daysofkubernetes.io/overview.html)