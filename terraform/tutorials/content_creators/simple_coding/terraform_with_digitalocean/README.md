

## Commands

### Basic commands
```bash
#basic
terraform init
terraform plan
terraform init  
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
```



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

- [Terraform : DigitalOcean Provider](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs)

- [digitalocean_droplet](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/droplet)