#!/bin/bash


### Gete all users
curl -X GET https://jsonplaceholder.typicode.com/users

### Save the response in a variable
all_users=$(curl -X GET https://jsonplaceholder.typicode.com/users)

### print all users
echo  ""
echo "All users $all_users"

### first user
echo  ""
first_user=$( echo $all_users | jq '.[0]' )
echo "First user is ${first_user}"


### print email of first record
echo  ""
email=$( echo $first_user | jq '.email' )
echo "email is $email"

### print row email of first record
echo ""
row_email=$( echo $first_user | jq -r '.email' )
echo "row email is $row_email"


### last user
echo ""
last_user=$( echo $all_users | jq '.[-1]' )
echo "Last user is ${last_user}"


### the number of users
echo ""
users_length=$( echo $all_users | jq ' . | length' )
echo "Number of items is $users_length"


### Get status code from all users
echo ""
http_code=$(curl --write-out "%{http_code}\n" --output /dev/null --silent  https://jsonplaceholder.typicode.com/users)
echo $http_code 


### Get status code from user with id 5
echo ""
http_code=$(curl --write-out "%{http_code}\n" --output /dev/null --silent  https://jsonplaceholder.typicode.com/users/5)
echo $http_code 


### Get status code from user with id 500
echo ""
http_code=$(curl --write-out "%{http_code}\n" --output /dev/null --silent  https://jsonplaceholder.typicode.com/users/500)
echo $http_code 
