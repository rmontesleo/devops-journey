# Notes for V0

## Commands

### Setups
Create a values.tfvars file and add the value for the instance password
```bash
linodeInstancePwd = "CHANGE_FOR_THE_PASSWORD_TO_USE"
```

### Terraform 
```bash
terraform init

terraform plan    -var-file values.tfvars
terraform apply   -var-file values.tfvars -auto-approve
terraform destroy -var-file values.tfvars -auto-approve
```



### linode cli
```bash

# Create a linode instance to use like a frontend server with the cli (default VPC)
linode-cli linodes create \
--authorized_users $AUTORIZED_USER \
--backups_enabled false \
--booted true \
--image 'linode/ubuntu22.04' \
--label frontend-server \
--private_ip true \
--region us-east \
--root_pass $ROOT_PASSWORD \
--tags devops \
--type g6-nanode-1

# Create Jenkins instance, using the script with id 607401, with the cli (default VPC)
linode-cli linodes create \
--authorized_users $AUTHOREIZED_USER_SSH_KEY \
--backups_enabled false \
--booted true \
--image linode/debian11 \
--label jenkins-us-east-demo-cli \
--private_ip true \
--region us-east \
--root_pass $ROOT_PASSWORD \
--stackscript_data '{}' \
--stackscript_id 607401 \
--tags devops \
--type g6-nanode-1

# Create a linode instance to use like a frontend server with the cli (Inside an specific VPC)
linode-cli linodes create \
--authorized_users $AUTHOREIZED_USER_SSH_KEY \
--backups_enabled false \
--booted true \
--image linode/debian11 \
--label debian-us-ord \
--private_ip true \
--region us-ord \
--root_pass $ROOT_PASSWORD \
--type g6-nanode-1 \
--interfaces.ip_ranges [] \
--interfaces.ipam_address null \
--interfaces.ipv4.nat_1_1 "any" \
--interfaces.label null \
--interfaces.primary true \
--interfaces.purpose "vpc" \
--interfaces.subnet_id $SUBNET_ID \
--interfaces.ipam_address "" \
--interfaces.label "" \
--interfaces.purpose "public"


```


### linode API calls
```bash

# Create a linode instance to use like a backend server with the api call (default VPC)
curl -H "Content-Type: application/json" \
-H "Authorization: Bearer $LINODE_TOKEN" \
-X POST -d '{
    "authorized_users": [
        "'$AUTORIZED_USER'"
    ],
    "backups_enabled": false,
    "booted": true,
    "image": "linode/ubuntu22.04",
    "label": "backend-server",
    "private_ip": true,
    "region": "us-east",
    "root_pass": "'$ROOT_PASSWORD'",
    "tags": [
        "devops"
    ],
    "type": "g6-nanode-1"
}' https://api.linode.com/v4/linode/instances

# Create Jenikins instance, using the script with id 607401, with the API call (default VPC)
curl -H "Content-Type: application/json" \
-H "Authorization: Bearer $LINODE_TOKEN" \
-X POST -d '{
    "authorized_users": [
        "'$AUTHOREIZED_USER_SSH_KEY'"
    ],
    "backups_enabled": false,
    "booted": true,
    "image": "linode/debian11",
    "label": "jenkins-us-east-demo-api",
    "private_ip": true,
    "region": "us-east",
    "root_pass": "'$ROOT_PASSWORD'",
    "stackscript_data": {},
    "stackscript_id": 607401,
    "tags": [
        "devops"
    ],
    "type": "g6-nanode-1"
}' https://api.linode.com/v4/linode/instances


# (SPECIFIC VPC)
curl -H "Content-Type: application/json" \
-H "Authorization: Bearer $LINODE_TOKEN" \
-X POST -d '{
    "authorized_users": [
        "'$AUTHOREIZED_USER_SSH_KEY'"
    ],
    "backups_enabled": false,
    "booted": true,
    "image": "linode/debian11",
    "label": "debian-us-ord",
    "private_ip": true,
    "region": "us-ord",
    "root_pass": "'$ROOT_PASSWORD'",
    "tags": [],
    "type": "g6-nanode-1",
    "interfaces": [
        {
            "ip_ranges": [],
            "ipam_address": null,
            "ipv4": {
                "nat_1_1": "any"
            },
            "label": null,
            "primary": true,
            "purpose": "vpc",
            "subnet_id": "'$SUBNET_ID'",
            "vpc_id": "'$VPC_ID'"
        },
        {
            "ipam_address": "",
            "label": "",
            "purpose": "public"
        }
    ]
}' https://api.linode.com/v4/linode/instances

```

### linode cli commands
```bash
#list your linode instances
linode-cli linodes list

# see details of some instance in table format
linode-cli linodes view  $LINODE_INSTANCE_ID

# get more details in json format
linode-cli linodes view $LINODE_INSTANCE_ID --json | jq

# get network information of some instance
linode-cli linodes ips-list $LINODE_INSTANCE_ID

# get more network information in json format of some instance
linode-cli linodes ips-list  $LINODE_INSTANCE_ID --json | jq

# delete some instance
linode-cli linodes delete $LINODE_INSTANCE_ID
```



## References

### Linode
- [Guides - Manage Configuration Profiles on a Compute Instance](https://www.linode.com/docs/products/compute/compute-instances/guides/configuration-profiles/)
- [Linode Delete](https://www.linode.com/docs/api/linode-instances/#linode-delete)

### Terraform 
- [linode_sshkey](https://registry.terraform.io/providers/linode/linode/latest/docs/resources/sshkey)
- [linode_instance](https://registry.terraform.io/providers/linode/linode/latest/docs/resources/instance)
- [Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)
- [Managing tfvars Files and Terraform Variable Hierarchy](https://www.env0.com/blog/managing-terraform-variable-hierarchy)
- [How to Use Terraform Variables (Locals, Input, Output, Environment)](https://spacelift.io/blog/how-to-use-terraform-variables)

### Bash
- [Bash: Get the Exit Status Code of the Last Command](https://csatlas.com/bash-last-exit-status/)