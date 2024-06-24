

## Coding
```bash
# Upload the local folder html5up-solid-sate to the bucket defined in the variable $YOUR_CLOUD_RESUME_BUCKET

YOUR_CLOUD_RESUME_BUCKET="<HERE_SET_YOUR_BUCKET_NAME>"
aws s3 sync html5up-solid-state/ s3://$YOUR_CLOUD_RESUME_BUCKET
```

## Steps

### Create the bucket in version 1
- Create the bucket S3 with a unique name
- In properties-> Static website hosting 
    - Static Web Hosting -> Enable
    - Hosting Type -> Host a static website
    - Index Document -> index.html
- In permissions -> Block public access (bucket settings) -> Edit
    - Unchecked Block all public access
    - Save Changes
    - Confirm
- In permissions -> Bucket Policy -> Edit
 #### Where "Resource": "arn:aws:s3:::SET_THE_NAME_OF_YOUR_BUCKET/*"
 ```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Statement1",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::polo-cloud-resume-challenge/*"
        }
    ]
}
```






## Resources

### Resume challenge 
- [What is the Cloud Resume Challenge?](https://dev.to/aws-builders/what-is-the-cloud-resume-challenge-ma5)
- [Cloud Resume Challenge](https://cloudresumechallenge.dev/)
- [The Cloud Resume Challenge - AWS](https://cloudresumechallenge.dev/docs/the-challenge/aws/)



### AWS S3
- [Hosting a static website using Amazon S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html)
- [Use high-level (s3) commands with the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-services-s3-commands.html)
- [Subir Aplicacion de React a AWS S3 - Hosting de Archivos Estaticos](https://www.youtube.com/watch?v=7YD5l4f6Rv0)


### AWS CloudFront
- [Steps for creating a distribution](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-creating.html)

### AWS Route53
- [Amazon Route 53Pricing for Domain Registration ](https://d32ze2gidvkk54.cloudfront.net/Amazon_Route_53_Domain_Registration_Pricing_20140731.pdf)

### For HTML 
- [makes spiffy HTML5 site templates](https://html5up.net/)
- [Bootstrap Examples](https://getbootstrap.com/docs/5.3/examples/)