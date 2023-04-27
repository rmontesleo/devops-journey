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

```


```bash
ssh-keygetn -t rsa

# key will be named mtcazurekey inside .ssh folder

ssh -i ~/.ssh/mtcazurekey   testadmin@$public_ip

# inside the remote vm type
lsb_release -a

# then exit from the vm

```



## References

- [Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest)
- [Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)

- [Learn Terraform with Azure by Building a Dev Environment – Full Course for Beginners](https://www.youtube.com/watch?v=V53AHWun17s)