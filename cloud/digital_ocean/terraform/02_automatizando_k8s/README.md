# KUBERNETES EN DIGITAL-OCEAN AUTOMATIZADO con TERRAFORM!


### Prerrequisites. Validate the digital ocean variable for terraform is set in environment
```bash
# get the length of the digital ocean token
echo ${TF_VAR_digitalocean_token}

# get the first 3 characters of this variable
echo ${TF_VAR_digitalocean_token:0:3}

```

### doctl commands
```bash
# Initialize first time the doctl or validate the token is still valid
doctl auth init

# Get information about k8s cluster in Digital ocean
doctl kubernetes options sizes
```



### Terraform commands
```bash
# create your terraform project
terraform init


terraform plan

terraform apply

# when you add a new provider or configuration
terraform init -upgrade

terraform destroy
```



### k8s 
```bash
kubectl --kubeconfig=kubeconfig.yaml get nodes
kubectl --kubeconfig=kubeconfig.yaml -n kube-system  get ns
kubectl --kubeconfig=kubeconfig.yaml -n kube-system  get pods -o wide
```


---

## Resources

### Pelado Nerd
- [Pelado Nerd: KUBERNETES EN DIGITAL-OCEAN AUTOMATIZADO con TERRAFORM!](https://www.youtube.com/watch?v=i2LJAQVKYeY)
- [Codigo GitHub Pelado Nerd](https://github.com/pablokbs/peladonerd/tree/master/terraform/2)


### Terraform

- [digitalocean_kubernetes_cluster](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_cluster)
- [Kubernetes Provider](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs)


### Digital Ocean
- [doctl Command Line Interface (CLI)](https://docs.digitalocean.com/reference/doctl/)
- [doctl kubernetes](https://docs.digitalocean.com/reference/doctl/reference/kubernetes/)
- [doctl kubernetes options sizes](https://docs.digitalocean.com/reference/doctl/reference/kubernetes/options/sizes/)
- [Select Node Size and Count](https://docs.digitalocean.com/products/kubernetes/concepts/choosing-a-plan/#select-node-size-and-count)
- [Select Machine Type](https://docs.digitalocean.com/products/kubernetes/concepts/choosing-a-plan/#select-machine-type)

- [DigitalOcean API (2.0)](https://docs.digitalocean.com/reference/api/kafka-beta-api-reference/)



### Various Topics

- [Bash Substring](https://www.javatpoint.com/bash-substring)
- [Find Length of String in Bash](https://linuxhint.com/length_of_string_bash/)