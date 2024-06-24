#!/bin/bash

# Execute the code with some of the following options
# bash 05-4-while-options-args.sh -u Leo
# bash 05-4-while-options-args.sh -p 123
# bash 05-4-while-options-args.sh -u Leo -p 123

while getopts "u:p:" PARAMETER
do
    case "${PARAMETER}" in
        u)
            user_name=$OPTARG
            echo "username is $user_name"
            ;;
        p)            
            password=$OPTARG
            echo "Password is $password"
            ;;
        *)
            echo "Invalid option"
            ;;
    esac
done

echo "Username is $user_name and password is $password "