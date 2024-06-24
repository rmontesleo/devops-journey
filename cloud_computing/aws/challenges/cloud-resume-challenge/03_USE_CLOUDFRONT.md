


### Setup cloud front
- After create the bucket go to CloudFront
- Create a distribution
- In origin domain choose your S3 bucket from cloud resume , the field name will be filled with the same name of the origin.
- In `origin access` choose Origin access control settings (recomended)
- In `Origin access control` choose one of the list or create a new one.
- After the distribution is created, you must update the bucket policy with a new one that distribution will provide you.
- In Viewer option select HTTPS only
- Choose enable Security protections on Web Application Firewall
- Default root object - optional set the value index.html or the required file
- leave the the rest of default settings
- After create the Distribution, copy the policy and update in your S3 Bucket




### Command list
```bash
# get distribution values
aws cloudfront  get-distribution --id $DISTRIBUTION_ID | jq

# get distribution configuration
aws cloudfront  get-distribution-config --id $DISTRIBUTION_ID | jq

# delete the distribution
aws cloudfront delete-distribution --id $DISTRIBUTION_ID --if-match $TAG_HEADER
```

### Resources

- [Create an Amazon CloudFront Distribution and Website | Step-by-Step AWS CDN Tutorial for Beginners](https://www.youtube.com/watch?v=GUfAQUjA3a0)
- [Working with distributions](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-working-with.html?icmpid=docs_cf_help_panel)
- [Bucket policy examples](https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-bucket-policies.html?icmpid=docs_amazons3_console)
- [delete-distribution](https://docs.aws.amazon.com/cli/latest/reference/cloudfront/delete-distribution.html)
- [Getting started with a simple CloudFront distribution](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/GettingStarted.SimpleDistribution.html)