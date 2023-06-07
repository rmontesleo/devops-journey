# Getting Started with Amazon EC2 : Step 4. Launching a Linux Instance Using the AWS CLI


## Laboratory

###
```bash

# get your credentials
echo "Log in URL: $console" \
"Username: $username" \
"Password: $password"

# Execute this command to get the key created and uploaded to AWS
aws ec2 create-key-pair --key-name my-lab04-keypair --key-type rsa --key-format pem --query "KeyMaterial" --output text > my-lab04-keypair.pem

echo "Key pair was successfully created"

ls -latr


# Creating a VPC (A virtual private cloud is a private network that will help segregate and construct a portion of the AWS Cloud for our purposes)
echo "Creating a VPC"
VPC_ID=`aws ec2 create-vpc --cidr-block 10.0.0.0/16 --query Vpc.VpcId --output text`
echo "Successfully created a VPC: $VPC_ID"


# Create a Subnet (A subnet is a logical grouping of IP addresses. We usually assign a set of IP addresses in that subnet to resources like instances)
echo "Creating a subnet"
SUBNET_ID=`aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 10.0.1.0/24 --query Subnet.SubnetId --output text`
echo "Successfully created a subnet: $SUBNET_ID"

# Create a Internet Gateway (An internet gateway permits our resources in the VPC to talk to external resources on the internet)
echo "Configuring an internet gateway"
INTERNET_GATEWAY_ID=`aws ec2 create-internet-gateway --query InternetGateway.InternetGatewayId --output text`
echo "Successfully created an internet gateway: $INTERNET_GATEWAY_ID"

echo "Attaching this internet gateway to our VPC"
aws ec2 attach-internet-gateway --vpc-id $VPC_ID --internet-gateway-id $INTERNET_GATEWAY_ID


# Creating a Route 
# We have created the VPC, subnet, and internet gateway; the next thing on our list is a route. 
# A route enables network traffic flow between our instances in the subnet to the internet via an internet gateway. 
# Multiple routes make up a route table. Each subnet is associated with a set of routes. 

echo "Configuring route table"
ROUTE_TABLE_ID=`aws ec2 create-route-table --vpc-id $VPC_ID --query RouteTable.RouteTableId --output text`
echo "Successfully created route table: $ROUTE_TABLE_ID"

echo "Adding a route"
aws ec2 create-route --route-table-id $ROUTE_TABLE_ID --destination-cidr-block 0.0.0.0/0 --gateway-id $INTERNET_GATEWAY_ID
echo "Successfully added a route"

echo "Associate the route table with the subnet"
aws ec2 associate-route-table --subnet-id $SUBNET_ID --route-table-id $ROUTE_TABLE_ID
echo "Successfully associated the route table with the subnet"


# Create a Security Group (add a couple of rules so the incoming and outgoing traffic is controlled as per a policy)
echo "Creating a new security group"
SECURITY_GROUP_NAME=$username-security-group
SECURITY_GROUP=`aws ec2 create-security-group --vpc-id $VPC_ID  --group-name $SECURITY_GROUP_NAME --description "My $SECURITY_GROUP_NAME security group" --region us-east-1 --output text`

echo "New security group $SECURITY_GROUP was created successfully"


# A security group allows or disallows all network traffic to and from the instance. 
# It consists of a set of rules that dictate what ports are open and what protocols (e.g., SSH, TCP, Telnet) are permitted

echo "Adding a TCP rule for SSH connectivity for remote access"
aws ec2 authorize-security-group-ingress --group-id $SECURITY_GROUP --protocol tcp  --port 22 --cidr 0.0.0.0/0 --region us-east-1
echo "The SSH connectivity for remote access is enabled"


echo "Creating a new EC2 instance..."
KEY_NAME=my-lab04-keypair
echo "Key is $KEY_NAME"
INSTANCE_ID=`aws ec2 run-instances --image-id ami-09d3b3274b6c5d4aa --instance-type t2.micro --key-name $KEY_NAME --security-group-ids $SECURITY_GROUP --subnet-id $SUBNET_ID --associate-public-ip-address --count 1 --query 'Instances[0].InstanceId' --output text --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=my-ec2-instance}]'`

echo "Instance with ID $INSTANCE_ID was created successfully"

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

### 2_create_instance
```bash
echo "Script to create an instance."

echo "*** MAKE SURE THE 1_create_resources.sh SCRIPT WAS RUN BEFORE EXECUTING THIS SCRIPT ***"

KEY_NAME=$username-key

echo "Creating a brand new EC2 instance "

INSTANCE_ID=`aws ec2 run-instances --image-id ami-09d3b3274b6c5d4aa --instance-type t2.micro --key-name $KEY_NAME --security-group-ids $SECURITY_GROUP --subnet-id $SUBNET_ID --associate-public-ip-address --count 1 --query 'Instances[0].InstanceId' --output text --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=my-ec2-instance}]'`

echo "Instance with ID $INSTANCE_ID was created successfully"

echo "Your instance will be available shortly"
```



## Resources

- [Launching a Linux Instance Using the AWS CLI](https://learning.oreilly.com/scenarios/getting-started-with/9781098136048/)
- [What is Azure Application Gateway?](https://learn.microsoft.com/en-us/azure/application-gateway/overview)
