# Building a Minimal, Production Ready Infrastructure on DigitalOcean

## Sources

- main.tf
- variables.tf
- network.tf
- web-servers.tf

## Commands

```bash
# Basic commands
terraform init
terraform plan
terraform apply
terraform destroy

# when you add a new provider or configuration
terraform init -upgrade

# verify your plan with specific tfvars file
terraform plan -var-file=sfo3.tfvars

# create your infrastructure with specific tfvars file
terraform apply -var-file=sfo3.tfvars

# destroy your infrastructure with specific tfvars file
terraform destroy -var-file=sfo3.tfvars
```




## Resources

- [Building a Minimal, Production Ready Infrastructure on DigitalOcean](https://www.youtube.com/watch?v=Q3Dxtkgsh9I)
- [Sample Cloud Architectures Deployable to DigitalOcean](https://github.com/do-community/terraform-sample-digitalocean-architectures)
- [Minimal Index.html file](https://raw.githubusercontent.com/do-community/terraform-sample-digitalocean-architectures/master/01-minimal-web-db-stack/assets/index.html)