# Terraforming Kubernetes on Linode | New Course Preview


## Coding

### First steps
```bash
kubectl version --short
kubectl version --short --client

terraform init
terraform plan
terraform apply

export KUBECONFIG=${PWD}/.kube/kubeconfig.yaml

kubectl get nodes -o wide

```

### Working with Terraform Console
```bash
terraform console

# see the value of local items
> local.root_dir
> local.k8s_config_dir
> local.k8s_config_file

# see the value of variables
>  var.linode_token

# see the value of resources
>  linode_lke_cluster.terraform_k8s

```

### Working with deployment
```bash
kubectl apply -f k8s.yaml

kubectl get all -o wide

kubectl  scale deploy  cfe-nginx-deployment  --replicas=10
kubectl  scale deploy  cfe-nginx-deployment  --replicas=1
kubectl  scale deploy  cfe-nginx-deployment  --replicas=3

```

### tear down the demo
```bash

kubectl delete -f k8s.yaml

terraform plan -destroy

terraform destroy

```




## Resources

- [Terraforming Kubernetes on Linode | New Course Preview](https://www.youtube.com/watch?v=d-l-4nVuu10)
- [Rapid-fire Terraforming Kubernetes](https://github.com/codingforentrepreneurs/terraforming-kubernetes-rapid)