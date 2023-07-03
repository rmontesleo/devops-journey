# Learn Terraform (and AWS) by Building a Dev Environment – Full Course for Beginners


## Developming code

### Step 1: Setup environment and basic commands
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


### Step 2:  Get thed AMI
```bash
in EC2 launch instances copy the image
ami-053b0d53c279acc90

in AMI copy the owner value
099720109477

Copy the AMI name
# full name
ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230516

# use willcard for the example
ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*

```

### Step 3: generate the ssh key
```bash
# generate a key called mtc_key
ssh-keygen -t ed25519
```

### Step 4: Deploy the ssh key and the ec2 instance
```bash

terraform apply -auto-approve

terraform statate list

terraform state show

```


## AWS Commands

```bash

aws account list-regions

aws ec2 describe-availability-zones | jq

#
aws ec2  describe-security-groups | jq

#
aws ec2 describe-key-pairs | jq

# List your EC2 instances
aws ec2 describe-instances | jq


```



## Resoureces
- [YouTube Video](https://www.youtube.com/watch?v=iRaai1IBlB0)

### Terraform
- [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Resource: aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)
- [Resource: aws_key_pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair)

- [Data Source: aws_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)

- [file Function](https://developer.hashicorp.com/terraform/language/functions/file)


### AWS

- [Launch, list, and terminate Amazon EC2 instances](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-instances.html)
- [AWS List Resources](https://docs.aws.amazon.com/cli/latest/reference/ram/list-resources.html)
- [AWS Describe VPC](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-vpcs.html)
- [AWS Describe Availability Zone](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-availability-zones.html)
- [AWS Describe Subnet](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-subnets.html)
- [AWS Describe Security Groups](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-security-groups.html)
- [AWS Describe key pairs](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-key-pairs.html)


