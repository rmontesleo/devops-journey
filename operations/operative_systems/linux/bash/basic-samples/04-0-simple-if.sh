#!/bin/bash

name=$1

echo "The value of variable name is $name"

if [ $name == "Polo" ]; then
    echo "Welcome back $name"
fi

if [ -z $name ]; then
    echo "The argument 1 is empty"
fi


echo "End of program..."