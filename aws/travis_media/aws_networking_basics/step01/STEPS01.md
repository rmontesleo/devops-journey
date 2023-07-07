
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

### connect the two instances
```bash
sudo scp -i mtc_key  mtc_key  ubuntu@$public_instance_ip:/home/ubuntu
```



## References 

- [Setting up a NAT gateway on AWS using Terraform](https://dev.betterdoc.org/infrastructure/2020/02/04/setting-up-a-nat-gateway-on-aws-using-terraform.html)
- [describe-subnets](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-subnets.html)
- [describe-internet-gateways](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-internet-gateways.html)
- [describe-route-tables](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-route-tables.html)
- [get-transit-gateway-route-table-associations](https://docs.aws.amazon.com/cli/latest/reference/ec2/get-transit-gateway-route-table-associations.html)
- [describe-images](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-images.html)