

```bash
terraform plan -var-file="values.tfvars"

terraform apply -auto-approve -var-file="values.tfvars"

terraform destroy -auto-approve -var-file="values.tfvars"
```


## Resources

### Linode
- [NodeBalancers - Get Started](https://www.linode.com/docs/products/networking/nodebalancers/get-started/)
- [Guides - Create a NodeBalancer](https://www.linode.com/docs/products/networking/nodebalancers/guides/create/)
- [Guides - Configuration Options for NodeBalancers](https://www.linode.com/docs/products/networking/nodebalancers/guides/configure/)
- [Networking - NodeBalancers](https://www.linode.com/docs/products/networking/nodebalancers/)
- [Guides - Introduction to Load Balancing](https://www.linode.com/docs/products/networking/nodebalancers/guides/load-balancing/)
- [Introduction to High Availability](https://www.linode.com/docs/guides/introduction-to-high-availability/)
- [Host a Website with High Availability](https://www.linode.com/docs/guides/host-a-website-with-high-availability/)


### Terraform
- [base64encode Function](https://developer.hashicorp.com/terraform/language/functions/base64encode)
- [linode_nodebalancer](https://registry.terraform.io/providers/linode/linode/latest/docs/resources/nodebalancer)
- [linode_nodebalancer_config](https://registry.terraform.io/providers/linode/linode/latest/docs/resources/nodebalancer_config)
- [linode_nodebalancer_node](https://registry.terraform.io/providers/linode/linode/latest/docs/resources/nodebalancer_node)
- [element Function](https://developer.hashicorp.com/terraform/language/functions/element)
- [Local Values](https://developer.hashicorp.com/terraform/language/values/locals)

### GitLab
- [locals](https://gitlab.com/twn-devsecops-bootcamp/latest/infra-automation/-/blob/main/main.tf?ref_type=heads)


### Youtube
- [Getting Started With NodeBalancers | How To Prepare For High Server Traffic](https://www.youtube.com/watch?v=JlXgl_rtM_s)
- [Linode NodeBalancers Explained | Manage Scale with Transparent Load Distribution](https://www.youtube.com/watch?v=U6xxgydIG9w)
- [Load Balancing on an LKE Kubernetes Cluster](https://www.youtube.com/watch?v=odPmyT5DONg)
