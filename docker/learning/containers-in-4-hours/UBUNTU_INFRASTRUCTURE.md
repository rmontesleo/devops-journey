# Build Infrastructure Options for Ubuntu

## Create Ubuntu Virtual Machine with Docker pre installed

### Linode CLI
```bash


linode-cli linodes create \
--image 'linode/ubuntu24.04' \
--private_ip false \
--region us-southeast \
--stackscript_data '{"user_name": "developer","disable_root":"No","token_password":"","subdomain":"","domain":"","soa_email_address":""}' \
--stackscript_id 607433 \
--type g6-standard-2 \
--label demo-ubuntu24-docker \
--root_pass $ROOT_PASSWORD \
--authorized_users $AUTHORIZED_USERS \
--disk_encryption enabled
```

### curl
```bash
curl -H "Content-Type: application/json" \
-H "Authorization: Bearer $LINODE_TOKEN" \
-X POST -d '{
    "image": "linode/ubuntu24.04",
    "private_ip": false,
    "region": "us-southeast",
    "stackscript_data": {
        "user_name": "developer",
        "disable_root": "No",
        "token_password": "",
        "subdomain": "",
        "domain": "",
        "soa_email_address": ""
    },
    "stackscript_id": 607433,
    "type": "g6-standard-2",
    "label": "demo-ubuntu24-docker",
    "root_pass": "'$ROOT_PASSWORD'",
    "authorized_users": [
        "'$AUTHORIZED_USERS'"
    ],
    "disk_encryption": "enabled"
}' https://api.linode.com/v4/linode/instances
```

### Terraform
```bash
# TODO: pass RootPass ans AuthorizedUsers arguments by variable
# TODO: find the attribute for stackscript_id

resource "linode_instance" "web" {
  label = "demo-ubuntu24-docker"
  image = "linode/ubuntu24.04"
  region = "us-southeast"
  type = "g6-standard-2"
  authorized_users = [""]
  root_pass = ""
  private_ip = false
}
```

### Python
```python
# Todo pass RootPass ans AuthorizedUsers arguments by variable

client = LinodeClient(token=os.getenv('LINODE_TOKEN'))
new_linode = client.linode.instance_create(
    ltype="g6-standard-2",
    region="us-southeast",
    image="linode/ubuntu24.04",
    label="demo-ubuntu24-docker",
    root_pass="",
    authorized_users=[""],
    stackscript_id=607433
)
```


### Go

```bash
# Todo pass RootPass ans AuthorizedUsers arguments by variable

linodeClient.CreateInstance(
    context.Background(),
    linodego.InstanceCreateOptions{
        Type: "g6-standard-2",
        Region: "us-southeast",
        Label: "demo-ubuntu24-docker",
        Image: "linode/ubuntu24.04",
        RootPass: "",
        AuthorizedUsers: []string{""},
        StackScriptID: 607433,
    },
)
```


