cat << EOF >> ~/.ssh/config

Host $(hostname)
  HostName ${hostname}
  User ${user}
  IdentifyFile ${identifyfile}
EOF