# Why You NEED To Learn Terraform | Practical Tutorial


```bash

terraform init
terraform plan
terraform apply

terraform console -var="instance_name=demo_instance"

#



#
terraform apply -auto-approve


# 
terraform output

my_output=$( terraform output -json  )

echo $my_output | jq

terraform output instance_public_ip

terraform output -raw instance_public_ip

```



## References

- [Why You NEED To Learn Terraform | Practical Tutorial](https://www.youtube.com/watch?v=nvNqfgojocs)
- [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Launch, list, and terminate Amazon EC2 instances](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-instances.html#listing-instances)
- [describe-images](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-images.html)
- [describe-instances](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html)
- [Query Data with Outputs](https://developer.hashicorp.com/terraform/tutorials/docker-get-started/docker-outputs)


## Solving issues

- [How do I install a software package from the Extras Library on an EC2 instance running Amazon Linux 2?](https://repost.aws/knowledge-center/ec2-install-extras-library-software)
- [Cannot install Nginx on AWS EC2 AMI2 - Topic :topic: is not found](https://superuser.com/questions/1520246/cannot-install-nginx-on-aws-ec2-ami2-topic-topic-is-not-found)
- [How to install nginx 1.9.15 on amazon linux disto](https://stackoverflow.com/questions/37082406/how-to-install-nginx-1-9-15-on-amazon-linux-disto)
- [Error getting to install aws linux-extras](https://repost.aws/questions/QUcnXSrFjeRvyddoe8lFwPcQ/error-getting-to-install-aws-linux-extras)
- [How do I turn on the EPEL repository for my Amazon EC2 instance that runs CentOS, RHEL, or Amazon Linux?](https://repost.aws/knowledge-center/ec2-enable-epel)