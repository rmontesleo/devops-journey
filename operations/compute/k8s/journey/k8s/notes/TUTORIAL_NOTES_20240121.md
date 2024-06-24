


```bash
kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1
kubectl expose deployment kubernetes-bootcamp --port=8080 --type=NodePort
kubectl scale deployment kubernetes-bootcamp --replicas=8
```

```bash
kubectl run mypod --image=ubuntu -it  -- /bin/bash
kubectl exec -it mypod -- /bin/bash
```


## Resources
- [Hello Minikube](https://kubernetes.io/docs/tutorials/hello-minikube/)
- [Learn Kubernetes Basics](https://kubernetes.io/docs/tutorials/kubernetes-basics/)

- [How To Deploy Ubuntu Pod in Kubernetes|OpenShift](https://computingforgeeks.com/deploy-ubuntu-pod-in-kubernetes-openshift/)


## Solving Issues
- [How to increase/check default memory Docker has on Linux?](https://kubernetes.io/docs/tutorials/hello-minikube/)
- [kubectl run -i --tty --rm --image ubuntu test-shell bash, and can't get into it.](https://github.com/rancher/rancher/issues/18663)