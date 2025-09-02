#!/bin/bash

echo "Crearte a linode with Jenkins (607401)

curl -H "Content-Type: application/json" \
-H "Authorization: Bearer $TOKEN" \
-X POST -d '{
    "image": "linode/debian11",
    "region": "us-southeast",
    "type": "g6-standard-1",
    "label": "jenkins-us-southeast",
    "tags": [
        "devops",
        "jenkins"
    ],
    "root_pass": "${root_password}",
    "authorized_users": [
        "${authorized_user}"
    ],
    "booted": true,
    "backups_enabled": false,
    "private_ip": false,
    "stackscript_id": 607401,
    "stackscript_data": {}
}' https://api.linode.com/v4/linode/instances