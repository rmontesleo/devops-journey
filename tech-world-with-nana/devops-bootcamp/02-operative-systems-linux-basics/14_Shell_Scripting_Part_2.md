### 14 - Shell Scripting Part 2 - Concepts & Syntax
```bash

### 14.1 Functions
### Better overview when funcitons are named descriptively 
### Reuse code
### Functions enable you to break down the overall functionality of a script into smaller, logical code blocks
### This code block can then be refrenced anywhere in the script multiple times

### ------------------------------------------------ 
#!/bin/bash

# Function definition
function score_sum {
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
}


# Funciton execution
score_sum

### ------------------------------------------------


### 14.2  Pass Parameters to a Functions
### ------------------------------------------------ 
#!/bin/bash

# Accept parameters in a function
# THe parameters passed in are represented by $1, $2, etc.
function create_file () {
	file_name=$1
	touch $file_name
	echo "file $file_name created"
}

create_file "test.txt"

create_file "myfile.yaml"

create_file "myscript.sh"

### ------------------------------------------------


### 14.3  Boolean values
### ------------------------------------------------ 
#!/bin/bash

# Accept parameters in a function
# THe parameters passed in are represented by $1, $2, etc.
function create_file () {
	file_name=$1
	is_shell_script=$2
	touch $file_name
	echo "file $file_name created"

	if [ "$is_shell_script" = true ]; then 
		chmod u+x $file_name
		echo "Added execute permission"
	fi

}

create_file "test.txt" false

create_file "myfile.yaml" 

create_file "myscript.sh" true

### ------------------------------------------------

### 14.4  Returning Values from Functions
### ------------------------------------------------ 
#!/bin/bash

function sum () {
	total=$(( $1 + $2 ))
	return $total
}

# save execution in a variable
result=$(sum 2 10)
echo "Result of sum 2 and 10 is $result"

sum 5 10
# get the result of previous execution
result=$?
echo "Result of sum 5 and 10 $result"


### ------------------------------------------------ 


# Some use cases
- Backup scripts
- Monitoring scripts
- Server Configuration Scripts

```
