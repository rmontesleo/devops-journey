# Como crear cluster Kubernetes en AWS con Terraform [Tutorial]


## TODO: Verify how to fix the elements to deploy.  The apply is failing

## Coding

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply


# connect with eks
aws eks update-kubeconfig --region us-east-1 --name youtube-eks --alias youtube-eks --profile default

kubectl describe configmap aws-auth -n kube-system


terraform destroy

```


## Resosurces 

- [Como crear cluster Kubernetes en AWS con Terraform [Tutorial]](https://www.youtube.com/watch?v=wF31kva8wPk)