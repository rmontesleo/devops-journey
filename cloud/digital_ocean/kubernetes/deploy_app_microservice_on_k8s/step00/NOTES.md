

```bash

terraform workspace list

terraform workspace new nyc1
terraform workspace select nyc1
terraform workspace show
terraform plan    -var-file=nyc1.tfvars
terraform apply   -var-file=nyc1.tfvars
terraform destroy -var-file=nyc1.tfvars

terraform workspace select default
terraform workspace show
terraform workspace delete nyc1
```