#!/bin/bash


echo ""
echo "##############################"
echo "Read all lines of a file"
echo ""
while read line; do
    echo "current endpoint is $line"
done < endpoints.txt


echo ""
echo "##############################"
echo "If empty line print 'Empty line' otherwise print the line value"
echo ""

while read line; do
    if [ -z $line ]; then
        echo "Empty line"
    else
        echo "current endpoint is $line"
    fi    
done < endpoints.txt

echo ""
echo "##############################"
echo "Avoid empty lines"
echo ""

while read line; do
    if [ ! -z $line  ]; then
        echo "Current endpoint is $line"
    fi
done <  endpoints.txt         