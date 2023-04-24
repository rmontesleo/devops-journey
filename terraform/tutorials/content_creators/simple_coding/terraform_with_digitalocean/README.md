# Terraform with DigitalOcean for the impatient


## Commands

### Basic commands
```bash
#basic
terraform init
terraform plan
terraform init  

# format the terraform files
terraform fmt

```

### commands from Part 4
```bash
# get ubuntu images
curl -X GET   -H "Content-Type: application/json"   -H "Authorization: Bearer $DIGITALOCEAN_TOKEN"   "https://api.digitalocean.com/v2/images?page=1&per_page=500" | jq ".images[].slug" | grep ubuntu

# get all regions
curl -X GET   -H "Content-Type: application/json"   -H "Authorization: Bearer $DIGITALOCEAN_TOKEN"   "https://api.digitalocean.com/v2/regions?page=1&per_page=500" | jq ".regions[].slug"

# find all sizes
curl -X GET   -H "Content-Type: application/json"   -H "Authorization: Bearer $DIGITALOCEAN_TOKEN"   "https://api.digitalocean.com/v2/sizes?page=1&per_page=500"  | jq ".sizes[] | { name: .slug, price: .price_monthly } "
```

### commands from part 5
```bash
terraform destroy
```

### commands from part 6
```bash
# find in a droplet the log 
tail -f /var/log/cloud-init.log

curl http://localhost:8080
```

### From part 9, see how to add the load balancer with domains and records
```bash

```

### Part 10. Secure Traffic

### Part 11. Enhance Security


### Part 12. Create a DB Cluster



### All curl calls
```bash
# curl images
curl -X GET   -H "Content-Type: application/json"   -H "Authorization: Bearer $DIGITALOCEAN_TOKEN"   "https://api.digitalocean.com/v2/images?page=1&per_page=1" | jq
curl -X GET   -H "Content-Type: application/json"   -H "Authorization: Bearer $DIGITALOCEAN_TOKEN"   "https://api.digitalocean.com/v2/images?page=1&per_page=3" | jq
curl -X GET   -H "Content-Type: application/json"   -H "Authorization: Bearer $DIGITALOCEAN_TOKEN"   "https://api.digitalocean.com/v2/images?page=1&per_page=200" | jq ""
curl -X GET   -H "Content-Type: application/json"   -H "Authorization: Bearer $DIGITALOCEAN_TOKEN"   "https://api.digitalocean.com/v2/images?page=1&per_page=500" | jq ".images[].slug"
curl -X GET   -H "Content-Type: application/json"   -H "Authorization: Bearer $DIGITALOCEAN_TOKEN"   "https://api.digitalocean.com/v2/images?page=1&per_page=500" | jq ".images[].slug" | grep ubuntu


# regions
curl -X GET   -H "Content-Type: application/json"   -H "Authorization: Bearer $DIGITALOCEAN_TOKEN"   "https://api.digitalocean.com/v2/regions?page=1&per_page=500" | jq ".regions[].slug"


# sizes
curl -X GET   -H "Content-Type: application/json"   -H "Authorization: Bearer $DIGITALOCEAN_TOKEN"   "https://api.digitalocean.com/v2/sizes?page=1&per_page=500"  | jq
curl -X GET   -H "Content-Type: application/json"   -H "Authorization: Bearer $DIGITALOCEAN_TOKEN"   "https://api.digitalocean.com/v2/sizes?page=1&per_page=500"  | jq ".sizes[] | { name: .slug, price: .price_monthly } "
```



## References

- [YouTube PlayList](https://www.youtube.com/playlist?list=PL9evZl_m5wqsc7C38L9grx-djts2bqT_b) 
- [GitHub](https://github.com/simple-coding-2020?tab=repositories)

- [Terraform : DigitalOcean Provider](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs)
    - [digitalocean_droplet](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/droplet)

- [DigitalOcean API (2.0)](https://docs.digitalocean.com/reference/api/kafka-beta-api-reference/)


- [Product Docs Home](https://docs.digitalocean.com/products/)

- [Managed Databases](https://docs.digitalocean.com/products/databases/)
- [MySQL](https://docs.digitalocean.com/products/databases/mysql/)
- [MySQL Reference](https://docs.digitalocean.com/products/databases/mysql/reference/)

- [API Reference Databases](https://docs.digitalocean.com/reference/api/api-reference/#tag/Databases)        