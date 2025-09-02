# Using Infrastructure as Code to Build Reproducible Systems with Terraform on DigitalOcean



## Commands
```bash
terraform init
terraform plan
terraform apply
terraform destroy

terraform plan -var-file=nyc1.tfvars
terraform apply -var-file=nyc1.tfvars
terraform worskpace new nyc1

terraform destroy -var-file=nyc1.tfvars
```




## References

- [Youtube: Using Infrastructure as Code to Build Reproducible Systems with Terraform on DigitalOcean](https://www.youtube.com/watch?v=U5suIJwobiQ)
- [GitHub: Infrastructure as Code Presentation](https://github.com/MasonEgger-Demos/Infrastructure-As-Code-Intro)

- [Digital Ocean Provider](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs)
- [DigitalOcean API (2.0)](https://docs.digitalocean.com/reference/api/kafka-beta-api-reference/#section/Introduction/Requests)

- [DigitalOcean Terraform Provider](https://github.com/digitalocean/terraform-provider-digitalocean)