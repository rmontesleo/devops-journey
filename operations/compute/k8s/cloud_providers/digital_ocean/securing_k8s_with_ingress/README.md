# Securing Kubernetes Ingress With Let’s Encrypt

---

## Coding


### starting
```bash

kubectl get nodes -o wide

# get all pods of every namespace
kubectl get pods -A 


# see the helm repos install in local machine
helm repo list

# install ingress chart
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

# update the chart
helm repo update ingress-nginx

```

### working with the cluster
```bash
kubectl create ns ingress-nginx
kubectl get ns

# get the missing line, and validate
helm install ingress-nginx ingress-nginx/ingress-nginx -n ingress-nginx -f nginx-values.yaml

# get all resources from namspace ingress-nginx
kubectl get all -n ingress-nginx

```



---

## Resources

- [Securing Kubernetes Ingress With Let’s Encrypt](https://www.youtube.com/watch?v=MpovOI5eK58)
- [Day-2 Operations-ready DigitalOcean Kubernetes (DOKS) for Developers](https://github.com/digitalocean/Kubernetes-Starter-Kit-Developers)
- [ArtifactHUB](https://artifacthub.io/)
- [ingress-nginx](https://artifacthub.io/packages/helm/ingress-nginx/ingress-nginx)
- [Ingress NGINX Controller](https://github.com/kubernetes/ingress-nginx)
- [Values file for nginx](https://github.com/kubernetes/ingress-nginx/blob/main/charts/ingress-nginx/values.yaml)


- [Containers and Kubernetes](https://www.youtube.com/playlist?list=PLseEp7p6Ewianx91YyPkdf1G12aAU7ugp)
- [Installing Helm](https://helm.sh/docs/intro/install/)