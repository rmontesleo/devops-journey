
# AWS Load Balancer HTTPS Setup with Route 53 and Certificate Manager & HTTP Redirect to HTTPS

1. Create two EC2 Instances with Ubuntu Latest.
2. Install a web server in each instance, one with Apache Server and the other with Nginx
    - Verify you have a file inside /var/www/html/index.html ,  this file is required for test probe
3. Test with curl http://localhost inside each instance,  then curl http://<THE_PUBLIC_IP_OF_YOUR_EC2_INSTANCE> outside each instance.
4. Create an Application Load Balancer
    - Set a name
    - Select the required VPC
    - Select all required Subnets (at least two)
    - Select or Create a new security group for the load balancer that allows HTTP (Port 80) and HTTPS (Port 443).
    - Select or Create a target group 
5. Register domain
6. Creaet A Record
    - Select Classic Application Load Balancer
    - Select the region
    - Select the load Balancer
7. Test the domain (Right now only with HTTP)
8. Go to Certificate Manager
    - Request a certificate with the fully qualified domain name (1 or more can be apply to this certificate)
9. After creation, create a Record for the certificate. This record will be a CNAME. This CNANAM Record is for validation
10. In load Balancers add a Listener for HTTPS
        - select the target group
        - select the certificate for the working group
11. Test the domain with HTTPS
12. Edit the Rule for HTTP
        - Change from Forwart to Target Groups to Redirect to URL, and add 443 to protocol HTTPS
        - Save changes
13. Add a record for www
        - add record name
        - select A record
        - select alias
        - select Classic load balancer
        - select your region
        - select your load balancer



## Using Terraform
```bash
terraform init

terraform plan

terraform apply

terraform apply -auto-approve

TF_LOG=DEBUG TF_LOG_PATH=./tf.log terraform apply -auto-approve
```