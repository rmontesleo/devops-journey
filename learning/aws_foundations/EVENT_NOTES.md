# AWS Foundations

## 01: First Segment


### AWS Building Blocks
- General Category of services (24 categories)

### AWS Building Blocks - Course Scope (11 categories)
- Application Integration
- Cloud Financial Management
- Compute
- Containers
- Databases
- Developer Tools
- Machine Learning (ML) and Artificial Intelligence (AI)
- Management and Governance
- Networking and content delivery
- Security
- Storage

## Amazon Resource Name (ARN)
- Globally Unique Identifier

arn:partition:service:region:account-id:resource-id

1. arn: this is a constant
2. partition: aws, aws-cn, aws-us-gov
3. service:ec2,s3,iam
4. regioin: us-east-1,eu-west-1
5. account-id: a number kindof 012345678912
6. resource-id: could be User/Chad, instance/i-XXXXXX,  volume/vol-XXXXXX , something like that


### Introuction: Cloud Basics
- Demo: AWS console login and account exploration
- Remember: NEVER create access keys for the root account
- Remember: Got to AWS Billing, Account and activate the `IAM user and role access to Billing information` section to have access to billing information. Required to have access to cost analysis and budgets and allthat kind of features as non root user.


### Global Infrastructure

### AWS Data Center
### AWS Availability Zone
### AWS Region
- A region is multiple physically separated AZ's
- Everything iin AWS is 100% REST API driven
### AWS Local Zone
### CloudFront PoPs and Regional Edge Caches
- Demo: Explore AZs, Regions, Local Zones

---

## TODO's: Some tasks to do after the training.
- Find in aws cli list the aws regions.
- Use some AI tool and ask about the architecture diagrams, what means, how to construct it. How to build the infrastructure they show
- Find samples to understand better the AWS Local Zone, CloudFront PoPs and Regional Edge Caches concepts.



---

## Resources
- [AWS Foundations](https://learning.oreilly.com/live-events/aws-foundations/0642572177379/0642572195366/)
- [PDF Slides](https://on24static.akamaized.net/event/49/74/94/3/rt/1/documents/resourceList1753794161211/awsfoundations1753794161211.pdf)
- [GitHub AWS-Foundations](https://github.com/brightkeycloud-chad/aws-foundations)
- [AWS Certified Solutions Architect Associate (SAA-C03)](https://learning.oreilly.com/course/aws-certified-solutions/9780138057374/)
- [AWS Certified Solutions Architect - Professional (SAP-C02) Crash Course](https://learning.oreilly.com/live-events/aws-certified-solutions-architect-professional-sap-c02-crash-course/0636920060215/0642572198183/)
- [AWS Glossary](https://docs.aws.amazon.com/glossary/latest/reference/glos-chap.html)
- [AWS Well-Architected](https://aws.amazon.com/architecture/well-architected/)
- [LinkedIn Chad Smith](https://www.linkedin.com/in/chadsmith1973/)
- [Instances](https://instances.vantage.sh)