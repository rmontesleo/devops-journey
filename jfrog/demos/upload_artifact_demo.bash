#!/bin/bash

source environment_variables

echo "############################################################"
echo "#########" JFrog Artifactory Environment Variables #########"
echo "JFrog Base URL: $JFROG_BASE_URL"
echo "JFROG Token: $JFROG_TOKEN"
echo "JFROG Username: $JFROG_USERNAME"
echo "##############################################"
echo

echo "############################################################"
echo "#########" JFrog Artifactory Local Variables #########"
repository="spring-zip-repo"
path_to_file="demo01.zip"
target_file_path="demo01.zip"

echo "JFrog Repository: $repository"
echo "Path to file: $path_to_file"
echo "Target File Path: $target_file_path"
echo "############################################################"


cd ./files_to_upload


curl -u$JFROG_USERNAME:$JFROG_TOKEN \
-T ./$path_to_file "$JFROG_BASE_URL/$repository/$target_file_path"

execution_status=$?

echo "Execution status: $execution_status"

if [ $execution_status -eq 0 ]; then
    echo "File uploaded successfully."
else
    echo "File upload failed."
fi