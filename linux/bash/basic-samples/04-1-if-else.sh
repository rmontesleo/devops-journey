#!/bin/bash

name=$1

echo "The value of variable name is $name"


if [ -z $name ]; then
    echo "The argument 1 is empty"
else
    echo "The value of the argument is $name"        
fi



if [ -z $name ]; then
    echo "The name is not set"
elif [ $name == "Polo" ]; then 
    echo "Welcome back $name"
else
    echo "Another user with name $name"        
fi


echo "End of program..."
