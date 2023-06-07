# Launch, List, and Terminate Amazon EC2 Instances

### Steps
```bash

# Rember data
echo -e "Log in URL: $console \n Username: $username \n Password: $password"

# list images  AMI that contain ubuntu
aws ec2 describe-images --no-cli-pager --region $REGION  --owners self amazon --filters "Name=description,Values=*ubuntu2004*" --query 'Images[*].[ImageId]' --output text

# create a key pair
aws ec2 create-key-pair --key-name key-$username-$randomNum --query 'KeyMaterial' --output text > key-$username-$randomNum-keypair.pem

# Create an EC2 isntance with a volume of 30GB, type t2.micro(1vCPU, 1GB RAM)
aws ec2 run-instances --no-cli-pager --image-id ami-072d6c9fae3253f26 --count 1 --instance-type t2.micro --key-name key-$username-$randomNum --block-device-mappings 'DeviceName=/dev/sda1,Ebs={VolumeSize=30}'

# describe your instances
aws ec2 describe-instances --query "Reservations[*].Instances[*].{Instance:InstanceId,Subnet:SubnetId,State:State.Name}" --output json


# get the running instance id
aws ec2 describe-instances --query "Reservations[*].Instances[*].{InstanceId:InstanceId}" --output json | jq -r .[][].InstanceId

# get the instance id and pass the id to terminate the instance
aws ec2 describe-instances --query "Reservations[*].Instances[*].{InstanceId:InstanceId}" --output json | jq -r .[][].InstanceId | xargs aws ec2 terminate-instances --instance-ids

# list all your instances and stateaws ec2 describe-instances --query "Reservations[*].Instances[*].{Instance:InstanceId,Subnet:SubnetId,State:State.Name}" --output json
aws ec2 describe-instances --query "Reservations[*].Instances[*].{Instance:InstanceId,Subnet:SubnetId,State:State.Name}" --output json


```

## References


- [Laboratory: Launch, List, and Terminate Amazon EC2 Instances](https://learning.oreilly.com/scenarios/launch-list-and/9781098147372/)


- [What is Amazon EC2?](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html)
- [What is Amazon EC2?](https://aws.amazon.com/pm/ec2/)
- [Launching, listing, and terminating Amazon EC2 instances](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-ec2-instances.html)


- [describe-instances](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-instances.html#options)
- [Block device mappings](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/block-device-mapping-concepts.html)
- [terminate-instances](https://docs.aws.amazon.com/cli/latest/reference/ec2/terminate-instances.html)
