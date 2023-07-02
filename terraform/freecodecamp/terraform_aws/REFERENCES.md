# Learn Terraform (and AWS) by Building a Dev Environment – Full Course for Beginners


## Developming code

### Setup environment
```bash
#
terraform init

#
touch main.tf

terraform plan

terraform apply

# list your created resources
terraform state list

# see the detail state from some specific resource
terraform state show aws_vpc.mtc_vpc


terraform show

terraform destroy -auto-approve

terraform plan

terraform apply -auto-approve

# format all terraform files
terraform fmt


```


- [YouTube Video](https://www.youtube.com/watch?v=iRaai1IBlB0)