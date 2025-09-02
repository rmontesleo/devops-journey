### 11 - Basic Linux Commands - Pipes & Redirects (CLI - Part 3)
```bash

# see the log file (everything that happends in system)
cat /var/log/syslog

# see the log file and pass the oupt to input for command less
cat /var/log/syslog | less


# see the content in /usr/bin directory
ls /usr/bin

# Send  the output to less command
# space: move the next page
# b    : move the previous page
# down arrow : move down by row
# up   arrow : move up   by row
ls /usr/bin | less

# to paginate the history
history | less

# see the history filtering by sudo with grep
# grep stands for Globally search for Regular Expressions and Print out
# Searches for a particular pattern of characters and display all lines that contain the pattern
history | grep sudo 


# find for changing file permissions, if you find for two or more works with space between them
history | grep "sudo chmod"

# find in history commands executed with sudo and paginate the response
history | grep sudo | less

# display for specific program by example java 
ls /usr/bin | grep java

# display for python files
ls /usr/bin | grep python

# find some patterns in files for example with the word ports
cat config.yaml | grep ports


# > character is the redirect operator
# Takes the output from the previous command and sends it to a file that you give

# write the history with sudo commands to the file sudo-commands.txt
history | grep sudo > sudo-commands.txt

# with >> append the ouput of the command to the file
history | grep rm >> sudo-commands.txt


# Standar Input and Standard Output
# stdin  (0) : Standard Input
# stdout (1) : Standard Output
# stderr (2) : Standard Error

# execute command with out sharing , just one by one
clear;  sleep 4; echo "Hellow World!!"

# Essential Commands in Linux
# Pipes     (|)
# Redirects (>)
# less      
# grep

```
