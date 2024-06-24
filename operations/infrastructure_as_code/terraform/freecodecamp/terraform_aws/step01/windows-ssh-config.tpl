add-content -path c:/<MY_USER_NAME>/.ssh/CONFIG -VALUE @'

Host $(hostname)
  HostName ${hostname}
  User ${user}
  IdentifyFile ${identifyfile}

'@