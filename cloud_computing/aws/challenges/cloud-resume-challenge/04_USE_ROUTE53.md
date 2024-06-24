

- Go to Route53 see your hosted zones
- Buy in Route53 a domain or in other site
- return to cloudfront and click on edit settings


- find for `Alternate domain name (CNAME) - optional` click on add item and type your domain name
- then select a SSL certificate or request for a new one
- in the request certificate page choose request a public certificate, then next
- Add your domain name using * to use/protect subomains. Example *.example.com 
- leave the default options DNS Validations and Key algorithm RSA 2048
- Add tags for your project example Project with Cloud Resume Challenge
- Click on request and wait for validation


- [#9 - Using the Amazon Certificate Manager to Issue an SSL Certification](https://www.youtube.com/watch?v=Ge-dkZgqLKg)
- [Working with records](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/rrsets-working-with.html?ref_=pe_1764230_134333060)
- [Validating domain ownership](https://docs.aws.amazon.com/acm/latest/userguide/domain-ownership-validation.html)
- [Requesting a public certificate](https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html)