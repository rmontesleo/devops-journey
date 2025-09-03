# AWS Load Balancer HTTPS Setup with Route 53 and Certificate Manager & HTTP Redirect to HTTPS

1. Create a EC2 Instance with Apache Server
2. Install a web server (Apache or Nginx)
3. Test with curl http://localhots or curl http://<THE_PUBLIC_IP_OF_YOUR_EC2_INSTANCE>
4. Create an Application Load Balancer
    - Set a name
    - Select all Subnets
    - Create a new security group for the load balancer that allows HTTP (Port 80) and HTTPS (Port 443)
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


##
- [AWS Load Balancer HTTPS Setup with Route 53 and Certificate Manager & HTTP Redirect to HTTPS](https://www.youtube.com/watch?v=JQP96EjRM98)
- [How To Install the Apache Web Server on Ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-22-04)