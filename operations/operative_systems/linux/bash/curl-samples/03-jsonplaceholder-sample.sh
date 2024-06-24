#!/bin/bash

echo "######################################################"
echo "Start test"


endpoint="https://jsonplaceholder.typicode.com/users"

echo "### Save the response in a variable"
all_users=$(curl -X GET $endpoint)


echo "### Step 1: Print all names,  .[] means iterate over each item"
echo $all_users | jq  ".[]  | .name"
echo "Press enter"
read


echo "### Print in row mode the names"
echo $all_users | jq -r  ".[]  | .name"
echo "Press enter"
read


echo "### Step 2: Get Just the code status code"

echo "# Response code of id equals 1"
response_code=$( curl --write-out "%{http_code}\n" --output /dev/null --silent "$endpoint/1"  )
echo "Response code for id 1 is ${response_code}"
echo "Press enter"
read


echo "# Response code of id equals 111"
response_code=$( curl --write-out "%{http_code}\n" --output /dev/null --silent "$endpoint/111"  )
echo "Response code for id 111 is ${response_code}"
echo "Press enter"
read


echo "#### get code and response"
response_code=$( curl --write-out "%{http_code}\n" --output response01.json  --silent "$endpoint/1"  )
echo "Response code for id 1 is ${response_code}"
echo "Contente of response01.json"
cat response01.json
echo
echo "Press enter"
read

response_code=$( curl --write-out "%{http_code}\n" --output response111.json --silent "$endpoint/111"  )
echo "Response code for id 111 is ${response_code}"
echo "Contente of response111.json"
cat response111.json
echo
echo "Press enter"
read


echo "### Step 3: Get json element, given the email"
moria_user=$(  echo $all_users | jq '.[] | select(.email == "Rey.Padberg@karina.biz" )'  )
echo $moria_user
echo
echo $moria_user | jq
echo "Press enter"
read

echo
echo "#### Step 3.2 : Get json element, given the email"
email="Chaim_McDermott@dana.io"
delphine_user=$( echo $all_users | jq '.[] | select(.email == "'${email}'" )' )
echo $delphine_user
echo "Press enter"
read

echo
echo "#### Get  the user name given the email"
email="Sherwood@rosamond.me"
echo "Test with email ${email}"
user_name=$(  echo $all_users | jq -r '.[]  | select(.email == "'${email}'" ) | .username ' )
echo "User name with mail $mail is  $user_name"

# user_name is empty
if [ -z $user_name ]; then
    echo "user not found"
else
    echo "Welcome $user_name a greeting will be in your inbox"
fi

echo "Press enter"
read

echo 
email="chanchito@feliz.com"
echo "Test with mail ${email}"
user_name=$( echo $all_users | jq -r '.[] | select(.email ==  "'${email}'" )  | .username ' )
echo "User name with mail $mail is  $user_name"

if [ -z $user_name ]; then
    echo "user not found"
fi

echo "Press enter"
read

echo "## Extra tip"
echo "# Step 4: Get all elementes with id is even"
even_users=$(  echo $all_users | jq -r 'map(select( .id % 2 == 0  ) )' )
echo
echo  $even_users | jq
echo "Press enter"
read

echo "End of testing"