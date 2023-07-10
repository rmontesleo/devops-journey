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

