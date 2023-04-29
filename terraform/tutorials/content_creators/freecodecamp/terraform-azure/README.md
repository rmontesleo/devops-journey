#

## Commands
```bash
# format your terraform files
terraform fmt
terraform init
terraform plan

# list all created resources
terraform state list

# show all resource states
terraform show

# show an specific resource state
terraform state show $required_item_name

# show all elements that will be destroy
terraform plan -destroy

# destroy everything created
terraform destroy
terraform apply -destroy

# use the flag if you can avoid the approval step
terraform apply -auto-approve

# when we want only replace some elment and not all infrastructure
terraform apply -replace $required_item_name

# apply some changes like datasources and outputs
terraform apply -refresh-only

# list your outputs
terraform output

# disply and specific output
terraform output public_ip_address

# see some variables
terraform console

# we can set/change some values 
terraform console -var="host_os=linux"

# using an specific variables file
terraform console -var-file="osx.tfvars"

```


## Local commands and remote commands inside the vm
```bash
ssh-keygetn -t rsa

# key will be named mtcazurekey inside .ssh folder

ssh -i ~/.ssh/mtcazurekey   testadmin@$public_ip

# inside the remote vm type
lsb_release -a

# then exit from the vm
exit
```

### Some git commands
```bash
 git pull
 git branch -a
 git fetch --prune
 git branch -a
 git branch -D $name_old_branch_to_delete
```



## References

- [Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
- [Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Data Sources](https://developer.hashicorp.com/terraform/language/data-sources)
- [Output Values](https://developer.hashicorp.com/terraform/language/values/outputs)
- [Conditional Expressions](https://developer.hashicorp.com/terraform/language/expressions/conditionals)
- [Tutorial Library](https://developer.hashicorp.com/tutorials/library)

- [Learn Terraform with Azure by Building a Dev Environment – Full Course for Beginners](https://www.youtube.com/watch?v=V53AHWun17s)