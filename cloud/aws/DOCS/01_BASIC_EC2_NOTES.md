#

## Basic Commands for configure elements
```bash
# Get Help from cli
aws help

# Configure the CLI
aws configure

# List availability zones from default settins
aws ec2 describe-availability-zones \
--filters "Name=zone-type,Values=availability-zone" | jq

# The previous one is almost the same as
aws ec2 describe-availability-zones

# List availability zones in us-east-1
aws ec2 describe-availability-zones --region us-east-1 | jq

```

## Commands for EC2 Instances and AMI 
```bash
# List your VM
aws ec2 describe instances

# List Images from us-east-1, Free tier, From Amazon, Description Conntains Ubuntu, Values contains 24
aws ec2 describe-images --region us-east-1 \
--filters "Name=free-tier-eligible,Values=true" "Name=owner-alias,Values=amazon" "Name=description,Values=*Ubuntu*" "Name=name,Values=*24*"  | jq

```

### Commands for VPC
```bash
# List all vpc using the default settings
aws ec2 describe-vpcs | jq

# List vpc from specific region, in this case us-east-1
aws ec2 describe-vpcs --region us-east-1 | jq

# Create a VPC, for tag specifications use single quotes
aws ec2 create-vpc \
--cidr-block 10.2.0.0/16 \
--tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=MyVpcOnMx}]' | jq

# Get a VPC by vpc-id equals to $vpc_id
aws ec2 describe-vpcs --vpc-ids $vpc_id | jq

# Delete a VPC with vpc value set on $vpc_id
aws ec2 delete-vpc --vpc-id $vpc_id | jq

```


## References

### Configuration
- [Configuring settings for the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)
- [brew aws cli](https://formulae.brew.sh/formula/awscli)
- [Manage access keys for IAM users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#securing_access-keys)
- [AWS Regions](https://docs.aws.amazon.com/global-infrastructure/latest/regions/aws-regions.html)

### EC2
- [Using Amazon EC2 in the AWS CLI](https://docs.aws.amazon.com/cli/v1/userguide/cli-services-ec2.html)
- [Launching, listing, and deleting Amazon EC2 instances in the AWS CLI](https://docs.aws.amazon.com/cli/v1/userguide/cli-services-ec2-instances.html)
- [describe-images](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-images.html)
- [create-vpc](https://docs.aws.amazon.com/cli/latest/reference/ec2/create-vpc.html)
- [delete-vpc](https://docs.aws.amazon.com/cli/latest/reference/ec2/delete-vpc.html)