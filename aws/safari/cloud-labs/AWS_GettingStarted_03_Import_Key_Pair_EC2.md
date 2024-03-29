# Getting Started with Amazon EC2 : Step 3. Creating and Importing Key Pairs Using EC2


## Lab

### Initial commands
```bash

# See the console and your credentials
echo "Log in URL: $console" \
"Username: $username" \
"Password: $password"

# The AWS CLI provides a manual for when help is needed
aws cli help

# create your key pair
aws ec2 create-key-pair --key-name my-cli-keypair --query "KeyMaterial" --output text


# Create a new key pair and redirect the key data to a file
aws ec2 create-key-pair --key-name my-cli-keypair2 --query "KeyMaterial" --output text > my-cli-keypair2.pem

# list your files
ls -latr

# creat  a new key pair
aws ec2 create-key-pair --key-name my-cli-keypair3 --key-type rsa --key-format pem --query "KeyMaterial" --output text > my-cli-keypair3.pem

# delete the last key pair
aws ec2 delete-key-pair --key-name my-cli-keypair3


# Create a new key pair and redirect the key data to a file
aws ec2 create-key-pair --key-name my-cli-keypair4 --query "KeyMaterial" --output text > my-cli-keypair4.pem


# print your finger print, this return a json with the info of the key pair
aws ec2 describe-key-pairs --key-name my-cli-keypair4


```

### Key Type
- rsa
- ed25519

### Key Format
- pem : Privacy Enhanced Mail 
- ppk : Putty Private Key



### create_resources.sh
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
echo "-------------------------------------------------"

echo "Creating a VPC"

VPC_ID=`aws ec2 create-vpc --cidr-block 10.0.0.0/16 --query Vpc.VpcId --region us-east-1 --output text`

echo "Successfully created the VPC: $VPC_ID"

echo "Creating a subnet"

SUBNET_ID=`aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 10.0.1.0/24 --query Subnet.SubnetId --output text --region us-east-1`

echo "Successfully fetches a subnet: $SUBNET_ID"

echo "Configuring an internet gateway"

INTENET_GATEWAY_ID=`aws ec2 create-internet-gateway --query InternetGateway.InternetGatewayId --output text`

echo "Successfully created an internet gateway: $INTENET_GATEWAY_ID"
echo "-------------------------------------------------"

echo "Attaching our intrenet gateway to our VPC"

aws ec2 attach-internet-gateway --vpc-id $VPC_ID --internet-gateway-id $INTENET_GATEWAY_ID

echo "Configuring route table"

ROUTE_TABLE_ID=`aws ec2 create-route-table --vpc-id $VPC_ID --query RouteTable.RouteTableId --output text`

echo "Successfully created route table: $ROUTE_TABLE_ID"

echo "Adding a route"

aws ec2 create-route --route-table-id $ROUTE_TABLE_ID --destination-cidr-block 0.0.0.0/0 --gateway-id $INTENET_GATEWAY_ID

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
echo "-------------------------------------------------"
```



## Resources

- [Creating and Importing Key Pairs Using EC2](https://learning.oreilly.com/scenarios/getting-started-with/9781098136017/)