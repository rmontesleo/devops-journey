# Getting Started with Amazon EC2 : Step 5. Connecting to a Linux Instance from an SSH Terminal


## Laboraroty

```bash
# get credentials
echo "Log in URL: $console" \
"Username: $username" \
"Password: $password"

# create the infrastructure
source ./1_create_resources.sh 

# create the instnace
source ./2_create_instance.sh


# check the key pair permissions
echo $KEY_NAME
chmod 400 $KEY_NAME.pem

# fetch public ip
echo "Getting public IP address of our instance"
PUBLIC_IP_ADDRESS=`aws ec2 describe-instances --output text --query 'Reservations[*].Instances[*].{Address:PublicIpAddress}' --filters 'Name=tag:Name,Values=my-ec2-instance'`
echo "Successfully fetched the IP address of our instance: $PUBLIC_IP_ADDRESS"


echo "Connecting to the instance"
ssh -i $KEY_NAME.pem ec2-user@$PUBLIC_IP_ADDRESS


```


### 1_create_resources.sh
```bash

echo "Script to create required resources for the lab: key pair, VPC, internet gateway, subnet, security group, etc."

echo "-------------------------------------------------"
echo "Provisioning the lab resources..."

KEY_NAME=$username-key

echo "Creating a $KEY_NAME key "

`aws ec2 create-key-pair --key-name $KEY_NAME --key-type rsa --key-format pem --region us-east-1  --query "KeyMaterial" --output text > $KEY_NAME.pem`

echo "Successfully created the $KEY_NAME key"

echo "Changing the permissions on the key"

chmod 400 $KEY_NAME.pem

echo "Successfully changed the permissions on $KEY_NAME.pem key"

echo "Creating a VPC"

VPC_ID=`aws ec2 create-vpc --cidr-block 10.0.0.0/16 --query Vpc.VpcId --region us-east-1 --output text`

echo "Successfully created the VPC: $VPC_ID"

echo "Creating a subnet"

SUBNET_ID=`aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 10.0.1.0/24 --query Subnet.SubnetId --output text --region us-east-1`

echo "Successfully fetches a subnet: $SUBNET_ID"

echo "Configuring an internet gateway"

INTERNET_GATEWAY_ID=`aws ec2 create-internet-gateway --query InternetGateway.InternetGatewayId --output text`

echo "Successfully created an internet gateway: $INTERNET_GATEWAY_ID"

echo "Attaching our internet gateway to our VPC"

aws ec2 attach-internet-gateway --vpc-id $VPC_ID --internet-gateway-id $INTERNET_GATEWAY_ID

echo "Configuring route table"

ROUTE_TABLE_ID=`aws ec2 create-route-table --vpc-id $VPC_ID --query RouteTable.RouteTableId --output text`

echo "Successfully created route table: $ROUTE_TABLE_ID"

echo "Adding a route"

aws ec2 create-route --route-table-id $ROUTE_TABLE_ID --destination-cidr-block 0.0.0.0/0 --gateway-id $INTERNET_GATEWAY_ID

echo "Successfully added a route"

echo "Associate route table with the subnet"
aws ec2 associate-route-table --subnet-id $SUBNET_ID --route-table-id $ROUTE_TABLE_ID

echo "Successfully associated the route table with the subnet"

echo "Creating a new security group"

SECURITY_GROUP_NAME=$username-security-group

SECURITY_GROUP=`aws ec2 create-security-group --vpc-id $VPC_ID  --group-name $SECURITY_GROUP_NAME --description "My $SECURYT_GROUP_NAME security group" --region us-east-1 --output text`

echo "New security group $SECURITY_GROUP created successfully"

echo "Adding two TCP rules for SSH connectivity for remote access"

aws ec2 authorize-security-group-ingress --group-id $SECURITY_GROUP --protocol tcp  --port 22 --cidr 0.0.0.0/0 --region us-east-1

aws ec2 authorize-security-group-ingress --group-id $SECURITY_GROUP --protocol tcp  --port 80 --cidr 0.0.0.0/0 --region us-east-1

echo "All resources required for the lab were provisioned. Your labs are ready"

echo "-------------------------------------------------"

echo "Resources created for this lab are: "
echo "      VPC:                $VPC_ID"
echo "      KEY:                $KEY_NAME"
echo "      Subnet:             $SUBNET_ID"
echo "      Key:                $KEY_NAME"
echo "      Security Group:     $SECURITY_GROUP"

```


### 2_create_instance.sh
```bash
echo "Script to create an instance."

echo "*** MAKE SURE THE 1_create_resources.sh SCRIPT WAS RUN BEFORE EXECUTING THIS SCRIPT ***"

echo "Creating a brand new EC2 instance "

INSTANCE_ID=`aws ec2 run-instances --image-id ami-09d3b3274b6c5d4aa --instance-type t2.micro --key-name $KEY_NAME --security-group-ids $SECURITY_GROUP --subnet-id $SUBNET_ID --associate-public-ip-address --count 1 --query 'Instances[0].InstanceId' --output text --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=my-ec2-instance}]'`

echo "Instance with ID $INSTANCE_ID was created successfully"

echo "Your instance will be available shortly - use the 3_connect_instance.sh script to connect to this instance over SSH"

```


### 3_connect_instance.sh
```bash
echo "Script to connect to an existing instance"

echo "*** MAKE SURE THE '1_create_resources.sh' and '2_create_instance.sh' SCRIPTS WERE RUN BEFORE EXECUTING THIS SCRIPT ***"

KEY_NAME=$username-key

echo "Getting Public ID address of our instance"

PUBLIC_IP_ADDRESS=`aws ec2 describe-instances --output text --query 'Reservations[*].Instances[*].{Address:PublicIpAddress}' --filters 'Name=tag:Name,Values=my-ec2-instance'`

echo "Successfully fetched the IP Address of our instance: $PUBLIC_IP_ADDRESS"

echo "Connecting to the instance"

ssh -i "$KEY_NAME.pem" ec2-user@$PUBLIC_IP_ADDRESS
```


### 4_clean
```bash
#!/bin/bash

# TODO

echo "Cleaning up resources"

echo "Deleting subnet $SUBNET_ID"
`aws ec2 delete-subnet --subnet-id $SUBNET_ID`

echo "Deleting Internet Gateway: $INTERNET_GATEWAY_ID"
aws ec2 delete-internet-gateway --internet-gateway-id $INTERNET_GATEWAY_ID

echo "Deleting Security Group: $SECURITY_GROUP_ID"
aws ec2 delete-security-group --group-id $SECURITY_GROUP_ID

echo "Deleting Route Table: $ROUTE_TABLE_ID"
aws ec2 delete-route-table --route-table-id $ROUTE_TABLE_ID

echo "Deleting VPC : $VPC_ID"
aws ec2 delete-vpc --vpc-id $VPC_ID
```


## Resources

- [Connecting to a Linux Instance from an SSH Terminal](https://learning.oreilly.com/scenarios/getting-started-with/9781098136024/)
- [Manage users on your Linux instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/managing-users.html#ami-default-user-names)
- []()
