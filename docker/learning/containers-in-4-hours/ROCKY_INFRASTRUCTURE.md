# Build Infrastructure for Rocky Linux

## Create Rocky 9 Virtual Machine, then install Podman

### Linode CLI
```bash

linode-cli linodes create \
  --image linode/rocky9 \
  --private_ip false \
  --region us-southeast \
  --type g6-standard-2 \
  --label rocky-podman-demo \
  --root_pass $ROO_PASSWORD \
  --authorized_users $AUTHORIZED_USERS \
  --disk_encryption enabled

```

### curl
```bash

curl -H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-X POST -d '{
    "image": "linode/rocky9",
    "private_ip": false,
    "region": "us-southeast",
    "type": "g6-standard-2",
    "label": "rocky-podman-demo",
    "root_pass": "'$ROO_PASSWORD'",
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
  label = "rocky-podman-demo"
  image = "linode/rocky9"
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
    image="linode/rocky9",
    label="rocky-podman-demo",
    root_pass="",
    authorized_users=[""]
)

```


### Go

```golang
# Todo pass RootPass ans AuthorizedUsers arguments by variable

linodeClient.CreateInstance(
    context.Background(),
    linodego.InstanceCreateOptions{
        Type: "g6-standard-2",
        Region: "us-southeast",
        Label: "rocky-podman-demo",
        Image: "linode/rocky9",
        RootPass: "",
        AuthorizedUsers: []string{""},
    },
)

```


