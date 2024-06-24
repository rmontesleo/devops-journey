# AWS Networking Basics For Programmers | Hands On


## Quick notes
```text
10.0.0.0/24
10.0.0.0/16
10.0.0.0/8

0.0.0.0 -> (8).(8).(8).(8) = 32 bits

/24 last number        -- 10.0.0.1 -> 10.0.0.254
/16 last two numbers   -- 10.0.0.1 -> 10.0.255.254
/8  last three numbers -- 10.0.0.1 -> 10.255.255.254

```


## Quick Steps to build the project


1. Create a VPC 
  - called `my-new-travis-vpc`
  - CIDR is 10.0.0.0/16

2. Create two Subnets

  - Choose your VPC `my-new-travis-vpc`
  - Name `PublicSubnet` with CIDR 10.0.0.0/24
  - availability Zone us-east-1a

  - Choose your VPC `my-new-travis-vpc`
  - Name `PrivateSubnet` with CIDR 10.0.1.0/24
  - availability Zone us-east-1a


3. Create a public EC2 instance
  - name the instance `my-public-instance`
  - choose a t2.micro
  - choose a key pair or create `my-key-pair`
  - edit options on Network settings
  - choose the VPC `my-new-travis-vpc`
  - choose the public subnet `PublicSubnet`
  - Select enable Auto-assign public IP
  - Create the security group `SGPublic`

4. Internet Gateway
    - Called `my-internet-gateway`
    - After create the Internet Gateway, attach it to the VPC

5. Create the route tables
    - Called `PublicRouteTable`
    - Associate the route table with the VPC  `my-new-travis-vpc`
    
    - Called `PrivateRouteTable`
    - Associate the route table with the VPC  `my-new-travis-vpc`

6. Create a Subnet Association for Public Route Table and Public Subnet
    - Select `PublicRouteTable`
    - Edit subnet association
    - select the `PublicSubnet`

7. Create a Subnet Association for Private Route Table and Private Subnet
    - Select `PrivateRouteTable`
    - Edit subnet association
    - select the `PrivateSubnet`


8. Create a  PublicRoute
    - Select `PublicRouteTable`
    - Choose Routes and click on Edit Routes
    - Destination will be 0.0.0.0/0
    - Target choose the Internet Gateway
    - Save changes


9. Create a private EC2 instance
  - name the instance `my-private-instance`
  - choose a t2.micro
  - choose a key pair or create `my-key-pair`
  - edit options on Network settings
  - choose the VPC `my-new-travis-vpc`
  - choose the public subnet `PrivateSubnet`
  - Disable the ip assignment
  - Create the security group `SGPrivate`
  - Click on Launch instances

10. Upload the key pair (the pem file) to the public instance.

```bash
sudo scp -i my-key-pair.pem  my-key-pair.pem  ec2-user@$public_instance_ip:/home/ec2-user
```

11. From you public instance do ssh to connect with private instance

```bash
# verify the permissions for your key
chmod 400 my-key-pair

#
ssh -i my-key-pair.pem ec2-user@$private_instance_ip

# in the private instance try to update packages
sudo yum update -y
```

12. Create a Nat Gateway
  - Call `my-nat-gateway`
  - Select the public subnet `PublicSubnet`
  - Connectivity type is Public
  - Choose Allocate Elastic IP
  - Click on Create NAT gateway


13. Create a  PrivatecRoute
    - Select `PrivateRouteTable`
    - Choose Routes and click on Edit Routes
    - Destination will be 0.0.0.0/0
    - Target choose the Nat Gateway
    - Save changes


## CLI calls
```bash


```



## REFERENCES
- [AWS Networking Basics For Programmers | Hands On](https://www.youtube.com/watch?v=2doSoMN2xvI)
- [Subnet Calculator](https://www.calculator.net/ip-subnet-calculator.html)

## SOLVING ISSUES

- [ssh "permissions are too open"](https://stackoverflow.com/questions/9270734/ssh-permissions-are-too-open)