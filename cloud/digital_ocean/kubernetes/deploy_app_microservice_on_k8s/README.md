# How to Deploy Your Application or Microservice on Kubernetes


## Prerrequisites

- Container Registry


## Coding

```bash
cd example-k8s-worloads
go run api/main.go

```

### deployments on k8s
```bash
# for the image use the Digest value instead to the tag value. This is for to be more specific about the required image
kubectl create deployment example-api --image=$full_digest_image_name --dry-run=client -o yaml > deploy.yaml

kubectl get nodes
kubectl get pods

kubectl apply -f deploy.yaml
kubectl get deploy -o wide

kubectl get pods -o wide
kubectl describe pod $some_pod_fullname
kubectl logs $some_pod_fullname

kubectl apply -f utility-deploy.yaml
kubectl get pods -o wide
kubectl exec $utility_podname -it -- /bin/sh
```

### inside the utility pod
```bash
curl $some_pod_private_ip:4000
curl $some_pod_private_ip:4000 | jq .
curl $some_pod_private_ip:4000/comment

```

### return again in the deployment
```bash
# modify the number of replicas in the yaml file and apply again
kubectl apply -f deploy.yaml

# or apply 
kubectl scale deployment example-api --replicas 10

# get the replicasets in the cluster
kubectl get rs

# go to deploy.yaml file and change the version image of the container and change the number of replicas to 3 and apply again
kubectl apply -f deploy.yaml

kubectl get pods
kubectl describe pod $new_podname
```

### go again to the utility pod
```bash
curl $some_pod_private_ip:4000 | jq .
```

### see the rollout history
```bash
kubectl rollout history deploy/exampl-api

## rollback to the previous deployment
kubectl rollout undo deploy/example-api

## rollback to some specific version
kubectl rollout undo deploy/example-api --to-revision=$number_of_required_revision

# verify the pods
kubectl get pods

# see inside of the new pods
kubectl describe pod $name_of_new_rollout_pod

```

### delete resources
```bash
kubectl delete pod $some_podname

kubectl delete deployment utilities

kubectl delete deployment example-api

```





---

## Presented By
Kim Schlesinger[Twitter: @kimschles] 

---

## References

- [How to Deploy Your Application or Microservice on Kubernetes](https://www.youtube.com/watch?v=SfM-82abTkQ)
- [Utilities](https://github.com/sudermanjr/utilities)

- [Deployments](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/)
- [Certified Kubernetes Application Developer (CKAD) Prep Course](https://github.com/bmuschko/ckad-prep)
- [DigitalOcean eBook: Kubernetes for Full-Stack Developers](https://www.digitalocean.com/community/books/digitalocean-ebook-kubernetes-for-full-stack-developers)

- [CERTIFIED KUBERNETES ADMINISTRATOR (CKA)](https://www.cncf.io/certification/cka/)
- [CERTIFIED KUBERNETES APPLICATION DEVELOPER (CKAD)](https://www.cncf.io/certification/ckad/)