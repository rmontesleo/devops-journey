#!/bin/bash

# Execute the code with some of the following options
# bash 05-4-while-options-args.sh -a Leo
# bash 05-4-while-options-args.sh -b 123
# bash 05-4-while-options-args.sh -a Leo -b 123

while getopts "a:b:" PARAMETER
do
    case "${PARAMETER}" in
        a)
            user_name=$OPTARG
            echo "username is $user_name"
            ;;
        b)            
            password=$OPTARG
            echo "Password is $password"
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
done

echo "Username is $user_name and password is $password "