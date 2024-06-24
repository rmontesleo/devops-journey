# Notes


## Command reference

```bash

# Create a VPC with the cli
linode-cli vpcs create \
--description "An optional description" \
--label vpc-example \
--region us-ord \
--subnets.label subnet-example-front \
--subnets.ipv4 10.0.1.0/24

# Create a VPC with  API
curl https://api.linode.com/v4/vpcs \
-H "Authorization: Bearer $LINODE_TOKEN" \
-H "Content-Type: application/json" \
-X POST -d '{
    "description": "An bash description",
    "label": "vpc-example-bash",
    "region": "us-ord",
    "subnets": [
      {
        "label": "subnet-example-ord",
        "ipv4": "10.0.1.0/24"
      }
    ]
}'

# list your VPC
linode-cli vpcs list

# list the subnets from specific VPC using a vpc id
linode-cli vpcs subnets-list $VPC_ID

# delete a VPC
linode-cli vpcs delete $VPC_ID

# list the linodes vm 
linode-cli linodes list

# delete a linode inside a vpc , using the linode ID
 linode-cli linodes delete $LINODE_VM_ID  

```


## References

### Linode
- [Guides - Create a VPC](https://www.linode.com/docs/products/networking/vpc/guides/create/?tabs=linode-api)

### GitHub
- [Terraform Provider for Linode](https://github.com/linode/terraform-provider-linode)
- [GitHub Learning Pathways](https://resources.github.com/learn/pathways/?utm_source=learning-pathways&utm_medium=Resources&utm_campaign=copilot-banner)

### Terraform
- [Linode](https://registry.terraform.io/namespaces/linode)
- [Linode Provider](https://registry.terraform.io/providers/linode/linode/latest/docs#configuration-reference)
- [linode_vpc_subnet](https://registry.terraform.io/providers/linode/linode/latest/docs/resources/vpc_subnet)

### Pulumi
- [Pulumi: Infrastructure as Code in Any Programming Language](https://www.pulumi.com/)