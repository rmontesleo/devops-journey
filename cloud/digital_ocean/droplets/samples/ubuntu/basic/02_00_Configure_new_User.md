# Configure User


## Basic user configuration

### Initial Setup
```bash
# create a variables file
touch variables

# edit your file
vim variables
```

### Content of the file
```bash
newUser="developer"
```
### set variable to environment
```bash
source variables
```

### Create your user
```bash
# Create the user
adduser $newUser

# add the user to sudo'er group
usermod -aG sudo $newUser

# sync the root user ssh key  with the $newUser
rsync --archive --chown=$newUser:$newUser ~/.ssh /home/$newUser
```

---
