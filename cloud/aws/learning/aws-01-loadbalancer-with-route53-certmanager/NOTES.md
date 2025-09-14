
# AWS Load Balancer HTTPS Setup with Route 53 and Certificate Manager & HTTP Redirect to HTTPS

1. Create two EC2 Instances with Ubuntu Latest.

2. Install a web server in each instance, one with Apache Server and the other with Nginx.
    - Verify you have a file inside /var/www/html/index.html ,  this file is required for test load balancer probe.

3. Testin the created instances 
    - with curl http://localhost inside each instance,  
    - then curl http://<THE_PUBLIC_IP_OF_YOUR_EC2_INSTANCE> outside each instance.
    - finally curl http://<THE_PUBLIC_IP_OF_YOUR_EC2_INSTANCE>/index.html for validate the Load balancers probes.

4. Create a target group.         
        - Choose instances, 
        - set a name for the group name: raj-lb-demo-targetgroup 
        - Choose HTTP protocol
        - select the VPC where the instances are created
        - in health checks add /index.html as path, next, 
        - Select the ec2 instances you want to balance, 
        - click on include pending below, 
        - click on create target group

5. Create an Application Load Balancer
    - Set a name: raj-lb-demo-elb
    - Select the required VPC (default or someone created)
    - Select all required Subnets (at least two)
    - Select or Create a new security group for the load balancer that allows HTTP (Port 80) and HTTPS (Port 443).    
    - In Listeners and routing add a new listener
        - Protocol HTTP
        - Port 80
        - Select the Target group
        - Click on add
    - Click on Create Load Balancer
    - See the description and click on DNS name , and copy the URL in browser or do curl with that 
    - In each request, you must see how balance between each instance

6. Register domain

7. Create or select a Hosted zone with the registed domain, in the hosted zone you must see
    - NS : Name Server with the list of entry servers to add where you register the domain.
    - SOA: 

8. Creaet A Record
    - Set record name: for this sample rajloadbalancerdemo 
    - Record Type: A Routes traffic to an IPv4 address and some AWS resources
    - Switch on alias
    - Choose endpoint: Select Alias to Application and Classic Load Balancer
    - Choose the region: Select us-east2 for this sample. Depends where you create the load balancer  
    - Choose load Balancer: The load balancer for the demo
    - Create Record

9. Add a record for www
        - add record name: www.rajloadbalancerdemo
        - select A record
        - select alias
        - select Classic load balancer
        - select your region
        - select your load balancer
        - click on create record 
    

10. Test the domain (Right now only with HTTP) to the full record name, for this sample
    - Test using dig @8.8.8.8 rajloadbalancerdemo.pocpipelinedemo.app
    - Test using curl http://rajloadbalancerdemo.pocpipelinedemo.app
    - Test using dig @8.8.8.8 www.rajloadbalancerdemo.pocpipelinedemo.app
    - Test using curl http://www.rajloadbalancerdemo.pocpipelinedemo.app

11. Go to Certificate Manager
    - Request a certificate with the fully qualified domain name (1 or more can be apply to this certificate)
    - request  rajloadbalancerdemo.pocpipelinedemo.app for this sample
    - request www.rajloadbalancerdemo.pocpipelinedemo.app for this sample
    - Click on request

12. After certificate creation, we need to create a Record for the certificate. This record will be a CNAME. This CNAME Record is for validation
    - Click on Create records in Route 53
    - Validate information, click on create records

13. Go to load Balancers add a Listener for HTTPS to listen on port 443
    - Select protocol HTTPS 
    - Select Port 443
    - Routing actions: Forward to target groups
    - select the created target group
    - select Default SSL/TLS server certificate, choose the certificate you created
    - Click on Add listener button

14. Test the domain with HTTPS
    - Test using curl https//www.rajloadbalancerdemo.pocpipelinedemo.app
    - Test using curl https://rajloadbalancerdemo.pocpipelinedemo.app

15. Edit the Rule for HTTP in the Listener
        - Change from Forwart to Target Groups to Redirect to URL, and add 443 in port an to protocol HTTPS
        - Save changes


16. Test the domain (Right now only with HTTPS), pointing to the full record name
    - curl https://www.rajloadbalancerdemo.pocpipelinedemo.app
    - curl https://rajloadbalancerdemo.pocpipelinedemo.app

--- 


## Some Networking commands
```bash
# get the current ip. Then to configure the submask is /32
curl ifconfig.me
```


## Using Terraform
```bash

## Basic commands
terraform init
terraform plan
terraform apply
terraform apply -auto-approve

##################################################### To use in Ohio region
terraform plan -var-file="02.2_us-east-values.tfvars"

terraform apply -auto-approve -var-file="02.2_us-east-values.tfvars"

# To create infrastructure in Ohiio
TF_LOG=DEBUG TF_LOG_PATH=./tf_us_east.log terraform apply -auto-approve -var-file="02.2_us-east-values.tfvars"

terraform destroy -auto-approve -var-file="02.2_us-east-values.tfvars"

##################################################### To use in Mexico region
terraform plan -var-file="02.1_mx-central-values.tfvars"

terraform apply -auto-approve -var-file="02.1_mx-central-values.tfvars"

# To create infrastructure in Mexico
TF_LOG=DEBUG TF_LOG_PATH=./tf_mx.log terraform apply -auto-approve -var-file="02.1_mx-central-values.tfvars"

terraform destroy -auto-approve -var-file="02.1_mx-central-values.tfvars"

```


### Apply output commands
```bash
# execute the dig_test_main_domain dig 8.8.8.8 ${local.full_domain_name}
$(terraform output -json testing_commands | jq -r '.dig_test_main_domain')

```
