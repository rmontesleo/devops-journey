# AWS Fundamentals


## 01: First Block



### NIST Cloud Definition
- IaaS:
- PaaS:
- SaaS:



### Cloud Definitions
- Private Cloud:
- Public-hosted Private Clouds:
- Hybrid CLoud:
- Extra-Modern Private Cloud:



### AWS Shared Responsability Model
- AWS:
- Customer

### The AWS Account

### AWS Global Infrastructure
- Online Regions
- Availability Zones
- Edge locations / Points of Presence


### AWS Regions

### AWS CLoud Services
- Region
- Availabiilty Zone
- Global Services
- Edge Location Services

### Availability ZOnes in Operation

### Failover Posibilities

---

## 02: Second Block


### AWS Edge Locations

### Without/With CloudFront

### CloudFront Operation

### Delivering Content to End Users

### Ptotecting the Application Perimeter
- AWS Shield Standard: Protects against DDOS attacks
- AWS Shield Advanced: Enhanced visibililty and economic protection
- AWS WAF : Web app protection with custom or managed rules

### WAF Protection

### WAF Design

### Core AWS COmpute Services
### EC2 Instance 

```
Instance Type

c4d.4xlarge

c: Instance Family
4: Generation
d: Feature
4xlarge: Instance Size
```

### On-demand EC2 Instances
- On-demand instances are defined by a default vCPU quota

### Dedicated Hosts

### Dedicated Instance

### Launch Templates
1. Amazon Machine Instance (AMI)
2. EC2 instance compatible with the selected AMI
3. Key pair to connect to instance
4. Security group that allow access to the instance.
5. EBS voumes to attach.
6. Tags (key-value pairs)

### AMI Components
- Boot Volume
- Launch Permissions
- Volumes to attach
- Default Location
- Operationg system

---

## 03:  Block


### Security Groups
### Security Group Design
### Container Options at AWS
### Task Definition Logic
### AWS Fargate
### AWS Lambda

```text
Test using a prompt in Grok or any other AI Tool
Create an AWS Lambda Function in Java that checks the Test Bucket for only PDF and delete every other file.

```

### AWS Lambda Triggers
- S3 bucket: An object is uploaded to a bucket
- DynamoDB Table: An entry is made in a DynamoDB table.

### EC2 Instances: Pricing Options
- On Demand
- Reserved Instances
- Sport Requests

### Saving Plans

### Cost Explorer

### AWS Cost ans Usage Reports

### AWS Budgets

### Data Storage Options at AWS

### EBS Feature

### Amazon S3 Object Storage

### Lifecycle Rules

### Amazon Macie

### S3 Glacier Storage

### Elastic File System



---


## Concept to check 
- Review how AWS Outpost works:
- Encryption AES-256 (Advanced Encryption Standard with a 256-bit key)
- EBS
- Service Quotas
- Route 53 Service
- AWS Application Migration Service
- Amazon Elastic Container Service

### Core network Services

### What's a VPC?

### VPC's Span AZs

### AWS Gateways

### VPC Flow Logs

### Core AWS Security Services

### Identity and Access Management

### IAM Authorization

### IAM Groups

### Multi-factor authentication

### Role Execution

### AWS CloudWatch

### Netrics

### Alarms

### AWS CloudTrail (what are you doing in your account)

### Core Database Services

### RDS Database Instances

### Amazon Autora

### Amazon Aurora: Multi-region

### DynamoDB

---

## TODO's:  some tasks to do after the workshop
- Replicate the `Failover Possibilites` infrastructure propose in the PDF Slide
- See jow Cloud Front works, try to do a demo  with some of the origin types
	- Amason S3
	- Elastic Load Balancer
	- API Gateway
	- VPC Origin
- See how to implement the infrastrcuture shown in `WAF Design` PDF slide
- See how to implement the infrastructure shown in `Security Gtoup Design` PDF Slide
- See how to implement the infrastructure shown in `Failover Possibilities` PDF Slide
- See how to implement the infrastructure shown in `Two-tier Workload` PDF Slide
- See how to implement the infrastructure shown in `VPC Flow Logs` PDF Slide
- See how to implement the infrastructure shown in `DynamoDB` PDF Slide
- Review again the slides, and check the proposal architectures and try to implement with cli, terraform.
- Evaluate the cost, difficulty of replicate the infrastructre propose in `Amazon Aurora: Multi-region`.  Write a analizys about when to use it and the use cases.
- Do the practices described in the PDF slides

---

## Resources
- [AWS Fundamentals](https://learning.oreilly.com/live-events/aws-fundamentals/0642572005880/0642572196073/)
- [PDF Slides](https://on24static.akamaized.net/event/49/93/37/2/rt/1/documents/resourceList1755009731581/awsfundamentalsfinal1755009731581.pdf)
- [AWS Labs](https://on24static.akamaized.net/event/49/93/37/2/rt/1/documents/resourceList1755009745998/labsforawsfundamentals1755009745998.pdf)
- [AWS Free Tier](https://aws.amazon.com/free/)
- [AWS Well-Architected Labs](https://www.wellarchitectedlabs.com)
- [AWS Startup](https://aws.amazon.com/startups)
- [CloudFront Pricing](https://aws.amazon.com/cloudfront/pricing/)

