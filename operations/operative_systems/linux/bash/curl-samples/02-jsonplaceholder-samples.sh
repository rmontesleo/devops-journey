#!/bin/bash

endpoint="https://jsonplaceholder.typicode.com/users"

### Save the response in a variable
all_users=$(curl -X GET $endpoint)
echo 

echo "row response"
echo $all_users
echo

echo "jq response"
echo $all_users | jq
echo

echo "length"
size=$( echo $all_users | jq '. | length' )
echo "length is $size"

limit=$(( size -1 ))

for index in $(seq 0 $limit)
do
    # print current index
    echo $index

    # get current user by index
    current=$( echo $all_users | jq ".[${index}] " )

    # print current user
    echo $current
    echo

    # print only the field website
    echo ${current} | jq ".website"

    # print address.city
    echo ${current} | jq ".address.city"

    # get directly some atribute (company.name)
    echo $all_users | jq ".[${index}].company.name"

done


