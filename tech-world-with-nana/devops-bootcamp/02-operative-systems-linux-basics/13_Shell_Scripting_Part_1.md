### 13 - Shell Scripting Part 1 - Concepts & Syntax
```bash
## edit the file 
vim setup.sh

### 13.1 Variables
#!/bin/bash
echo "Setup and configure server"

file_name=config.yaml

# store outpu of a command in a variable
config_files=$(ls config)

echo "using file $file_name to configure something"
echo "Here are all configuration files: $config_files"


### 13.2 Conditionals
#!/bin/bash
echo "Setup and configure server"

file_name=config.yaml

# validate config is a valid folder
if [ -d "config" ]
then
	echo "reading config directory contents"
	# store outpu of a command in a variable
	config_files=$(ls config)
else
	echo "Config dir not found. Creating one"
	mkdir config
fi

echo "using file $file_name to configure something"
echo "Here are all configuration files: $config_files"

### 13.3 Basic Operator
### Check the file test operators, to test various properties associated with a file

#!/bin/bash
echo "Setup and configure server"

file_name=config.yaml

# validate config is a valid folder
if [ -d "config" ]
then
	echo "reading config directory contents"
	# store outpu of a command in a variable
	config_files=$(ls config)
else
	echo "Config dir not found. Creating one"
	mkdir config
fi


## Check about numeric operatos
## Check about string operators

user_group=xx
if [ $user_group == "nana" ]
then
	echo "Configure the server"
elif [ $user_group == "admin" ]
then
	echo "Administer the server"
else
	echo "NO permission to configure server. wrong user group"	
fi

echo "using file $file_name to configure something"
echo "Here are all configuration files: $config_files"


### 13.4 Passing arguments to the script
### 

#!/bin/bash
echo "Setup and configure server"

file_name=config.yaml

## Positional Parameters: Arguments passed to script are processed in the same order in which they're sent
## Positional parameters are from $1 to $9
config_dir=$1


# validate config is a valid folder
if [ -d "$config_dir" ]
then
	echo "reading config directory contents"
	# store outpu of a command in a variable
	config_files=$(ls "$config_dir")
else
	echo "Config dir not found. Creating one"
	mkdir "$config_dir"
	touch "$config_dir/config.sh"
fi


## Check about numeric operatos
## Check about string operators

echo ""
user_group=$2
echo ""

if [ "$user_group" == "nana" ]
then
	echo "Configure the server"
elif [ "$user_group" == "admin" ]
then
	echo "Administer the server"
else
	echo "NO permission to configure server. wrong user group"	
fi

echo "using file $file_name to configure something"
echo "Here are all configuration files: $config_files"

######

## executing the script
./setup.sh setup-scripts nana



### 13.5 Read User Input
### ------------------------------------------------ 
#!/bin/bash
echo "reading user input"

# read and store the password in the user_pwd variable, other wise in $1 (from $1 to $9)
read -p "Please enter your passowrd: " user_pwd
echo "Thanks for your passowrd $user_pwd"
### ------------------------------------------------


### ------------------------------------------------
#!/bin/bash

# representa all the parameters as a single string
echo "All paameter are: $*"

# represents total number of arguments provided
echo "number of parameters: $# "

echo "user: $1 "
echo "group: $2 "

### ------------------------------------------------

### 13.6 Shell Loops
### Loops enables you to execute a set of commands repeatedly
### There are different types of loops: while, for , until and select


### ------------------------------------------------ 
#!/bin/bash

# representa all the parameters as a single string
echo "All paameter are: $*"

# represents total number of arguments provided
echo "number of parameters: $# "

# For Loop: Operates on lists of items, repeats a set of commands for every item in the list

for param in $*
do
	echo "$param"	
done
### ------------------------------------------------ 


### ------------------------------------------------ 
#!/bin/bash
# representa all the parameters as a single string
echo "All paameter are: $*"

# represents total number of arguments provided
echo "number of parameters: $# "

# For Loop: Operates on lists of items, repeats a set of commands for every item in the list

for param in $*
do
	if [ -d "$param" ]; then
		echo "Executing scripts in the config folder"
		ls -l "$param"	
	fi	
done
 
### ------------------------------------------------


## While Loop: Execute as set of commands repeatedly until some condition is mateched
### ------------------------------------------------ 
#!/bin/bash
# representa all the parameters as a single string
echo "All paameter are: $*"

# represents total number of arguments provided
echo "number of parameters: $# "

# For Loop: Operates on lists of items, repeats a set of commands for every item in the list

for param in $*
do
	if [ -d "$param" ]; then
		echo "Executing scripts in the config folder"
		ls -l "$param"	
	fi	
done

sum=0
while true
do
	read -p "Enter a score" score
	if [ $score == "q" ]
	then 
		break
	fi	
	# To execute and arithmetic operation we will use a double parenthesis
	sum=$(( $sum + $score ))
	echo "total score: $sum"
done
 
### ------------------------------------------------

```

-[Decision Making With If Else and Case Statements](https://linuxhandbook.com/if-else-bash/)

---

