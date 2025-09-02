


```bash
terraform init
terraform fmt --recursive

# see how to execute the line below
terraform plan -out=plan
#terraform plan -var-file=terraform.tfvars -out=plan

# after add a new moudule, execute the terraform init
terraform init

# init with the storage account
terraform init -backend-config="sas_token=$sas_token_vlaue"

```

### Tips

1. Use a provider.tf file
1. Use modules in terraform
1. Format the files using terraform fmt --recursive
1. name of the resources


##

- [GitHub Project](https://github.com/aminespinoza10/coleccion-terraform)