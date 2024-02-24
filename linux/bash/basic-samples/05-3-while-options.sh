#!/bin/bash

# Execute the code with some of the following options
# bash 05-3-while-options.sh -a
# bash 05-3-while-options.sh -b
# bash 05-3-while-options.sh  -a -b
# bash 05-3-while-options.sh -c

while getopts "ab" PARAMETER
do
    case "${PARAMETER}" in
        a) 
            echo "Parameter is a"
            ;;
        b)
            echo "Parameter is b"
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
done