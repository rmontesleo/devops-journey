# Creating SSH Keys

---

## On client


### Execute the ssh-keygen to create your key
```bash
ssh-keygen
```

### You will be ask wher you want to put your key
```text
Enter fil in with to save the key (/home/<USER_NAME>/.ssh/id_rsa) :
```

### Press enter if you want to use the default option or type another. Some samples
```bash
# sample the default key
/home/<USER_NAME>/.ssh/id_rsa

# sample if you want to save a key for other site
/home/<USER_NAME>/.ssh/id_rsa_some_site
```

### It generate two files the private key and the public key
```bash
# private key
id_rsa

# public key
id_rsa.pub
```

### Copy the value of the public key, this value you will use it on the server (client)
```bash
cat /home/<USER_NAME>/.ssh/id_rsa.pub
```

---

## On the server

### Login to your remote server, in this time you will be prompt for the password
```bash
ssh <YOUR_REMOTE_USER_NAME>@<REMOTE_IP_OR_HOSTNAME>
```

### if not exists , create the directory  ~/.ssh
```bash
mkdir ~/.ssh
```

### create the file for authorized key and past the content of your public key
```bash
vim ~/.ssh/authorized_keys
```

### if you want to add another key you can
```bash
echo <NEW_PUBLIC_KEY_CONTENT> >> ~/.ssh/authorized_keys
```

### Restart the sshd service
```bash
sudo systemctl restart sshd
```

### Optional step, disable the login with password
```bash
# edith the file
sudo vim /etc/ssh/sshd_config

# find the propertyPasswordAuthentication yes  , and change by PasswordAuthentication no
```

---

## Connect from client without use the password. Before use the ssh key you need to steps


### Step 2. Start the ss-agent
```bash
eval `ssh-agent -s`
```

### Step 2: add the private key to the agent
```bash
ssh-add ~/.ssh/<YOUR_PRIVATE_KEY_TO_USE>
```

### Step 3: connect directly using you key without password
```bash
ssh <YOUR_REMOTE_USER_NAME>@<REMOTE_IP_OR_HOSTNAME>
```



## References

- [Traversy Media : Linux Server Setup & MERN Deployment](https://www.youtube.com/watch?v=7aRjGIhwyQM)

- [How To Set Up SSH Keys on Rocky Linux 8](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-rocky-linux-8)