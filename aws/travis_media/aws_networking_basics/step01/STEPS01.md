
### Terraform commands
```bash
# list all your resources
terraform state list

# show details from aws_vpc.travis-vpc
terraform state show  aws_vpc.travis-vpc
```


### AWS Commands
```bash

# list your VPC
aws ec2 describe-vpcs | jq

# list your subnets
aws ec2 describe-subnets | jq

# list your internet gateways
aws ec2 describe-internet-gateways | jq

# list your route tables
aws ec2 describe-route-tables | jq


```


## References 

- [describe-subnets](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-subnets.html)
- [describe-internet-gateways](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-internet-gateways.html)
- [describe-route-tables](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-route-tables.html)