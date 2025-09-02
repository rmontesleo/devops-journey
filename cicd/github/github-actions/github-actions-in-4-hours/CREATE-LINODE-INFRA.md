# TODO: FIX  ALL SNIPETS AND TEST ON LINOD

```bash
root_pass="CHANGE_TO_YOUR_PASSWORD"
authorized_users="CHANGE_TO_YOUR_USER"

linode-cli linodes create \
  --image linode/almalinux9 \
  --private_ip false \
  --region us-southeast \
  --type g6-standard-2 \
  --label almalinux-us-southeast \
  --root_pass "$root_pass" \
  --authorized_users $authorized_users \
  --disk_encryption enabled
```

```bash
curl -H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-X POST -d '{
    "image": "linode/almalinux9",
    "private_ip": false,
    "region": "us-southeast",
    "type": "g6-standard-2",
    "label": "almalinux-us-southeast",
    "root_pass": "w#",
    "authorized_users": [
        "'$authorized_users'"
    ],
    "disk_encryption": "enabled"
}' https://api.linode.com/v4/linode/instances
```

```python
# TODO: Find the way to passWORD AND AUTORIZE USERS  a variable in python

client = LinodeClient(token=os.getenv('LINODE_TOKEN'))
new_linode = client.linode.instance_create(
    ltype="g6-standard-2",
    region="us-southeast",
    image="linode/almalinux9",
    label="almalinux-us-southeast",
    root_pass="",
    authorized_users=[""]
)
```

## terraform
```bash
# TODO: Find the way to pass and user the value in terraform

resource "linode_instance" "web" {
  label = "almalinux-us-southeast"
  image = "linode/almalinux9"
  region = "us-southeast"
  type = "g6-standard-2"
  authorized_users = [""]
  root_pass = ""
  private_ip = false
}
```




