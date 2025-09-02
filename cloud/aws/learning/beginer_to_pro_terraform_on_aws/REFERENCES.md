# Complete Terraform Course - From BEGINNER to PRO! (Learn Infrastructure as Code)


## Part 2: Demo

### List of IAM Policies

- AmazonRDSFullAccess
- AmazonEC2FullAccess
- AmazonS3FullAccess
- AmazonDynamoDBFullAccess
- AmazonRoute53FullAccess

### Configure your aws account
```bash
aws configure

terraform init
terraform plan
terraform apply -auto-approve
terraform destroy -auto-approve
```

### check your repository
```bash
#
tree

tree -a .
```

## Part 3: Basic Terraform Usage


#### step 1: create backend
```bash
# step 1.1: Create local backend
cd aws-backend
terraform init
terraform plan
terraform apply -auto-approve

# step 1.2 Creare AWS backend (uncomment the s3 backend block)
# upload the terraform state into the s3 bucket
terraform init

```

### TODO:
- Walk through web app TF coding
    - backend + provider config
    - EC2 instance
    - S3 Bucket
    - VPC
        - Subnet
    - Security groups + rules
    - Application load balancer
        - ALB target groupt + attachment
    - Route 53 zone + record
    - RDS instance    

### step 2: Create the infrastructure
```bash
cd web-app
terraform init
terraform plan
terraform apply -auto-approve
```


## Part 4: Variables and Outputs

### Setting Input Variables (In order of precedence // lowest -> hightst)

- Manual entry during plan/apply
- Default value in declaration block
- TF_VAR_<name> environment variables
- terraform.tfvars file
- *.auto.tfvars file
- Command line -var or -var-file

### Primitive
- string
- number
- bool

### Complex
- list(<TYPE>)
- set(<TYPE>)
- map(<TYPE>)
- object( { <ATTR_NAME> = <TYPE>, ... } )
- tupple( [<TYPE>,...] )

### TODO:
- Example varaibles and outputs
    - tfvars file(s)
- Use variables within web app config
    - `-var` cli option (for db password)    


### execute with files and variables
```bash

#
terraform apply -var="db_user=myuser" -var="db_password=SOMETHINSUPERSECURE"

terraform apply -var="db_password=SOMETHINSUPERSECURE"

```


## Part 5: Additonal Language Features

### Expressions

- Tempalte strings
- Operators ( !, - , *, /, %, >, ==, etc ...)
- For ( [ for o in var.list : o.id] )
- Splat ( var.list[*].id )
- Dynamic Blocks
- Contraints (Type & Version)

### Functions
- Numeric
- String
- Collection
- Encoding
- Filesystem
- Date & Time
- Hash & Crypto
- IP Network
- Type Convrsion 

### Meta-Argument

- count
- for_each
- lifecycle
        lifecycle {
            create_before_destroy = true
        }
        - create_before_destroy
        - ignore_changes
        - prevent_destroy

### Provisioner
- file
- local-exec
- remote-exec
- ventdor
   - chef
   - puppet
   - Ansible


## Part 5: Modules

- Root Module
- Child Module
- local Path
- Terraform Registry

---

## References
- [Complete Terraform Course - From BEGINNER to PRO! (Learn Infrastructure as Code)](https://www.youtube.com/watch?v=7xngnjfIlK4)
- [devops-directive-terraform-course](https://github.com/sidpalas/devops-directive-terraform-course)
- [Complete Terraform Course [DevOps Directive] - Bonus Content!](https://sidpalas.gumroad.com/l/hieekq)
- [What is Amazon Relational Database Service (Amazon RDS)?](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html)
- [Read/write capacity mode](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.ReadWriteCapacityMode.html)
- [BillingModeSummary](https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_BillingModeSummary.html)
- [Identity and access management in Amazon S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-access-control.html?icmpid=docs_amazons3_console)
- [How Amazon S3 authorizes a request for a bucket operation](https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-control-auth-workflow-bucket-operation.html)