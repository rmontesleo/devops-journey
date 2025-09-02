### 12 - Introduction to Shell Scripting Part 1
```bash

# Sheband

## create a file setup.
touch setup.sh 

## The shebang tells the script how to interpreter the file, tells where is the program is
## whith shebang you decide what shell to use
## why is it called "shebang" ?
## because of the first 2 characters : #!
## # in musical notation, also called sharp
## ! also called bang
## shebang became a shortening of sharp-bang 
## some examples are
## #!/bin/sh  or #!/bin/bash  or #!/bin/zsh

## Content of setup.sh

#!/bin/bash
echo "Setup and configure server"

## then to execute , (if the file has execution permitions)
./setup.sh

# add execution permition 
sudo chmod u+x setup.sh

# then execute file
./setup.sh

## depending on the shell you could execute
bash setup.sh
sh   setup.sh
zsh  setup.sh 

```
