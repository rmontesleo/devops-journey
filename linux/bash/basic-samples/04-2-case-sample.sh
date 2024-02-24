#!/bin/bash

echo "#####################################"
echo "Type one of some options start, restart, stop finish, continue then press enter"
read option

echo "#####################################"

echo "the option is $option"

case "${option}" in
    start|restart)
        echo "You are going to start or restart the engine"
        ;;
    stop)
        echo "Stoping the engine"
        ;;    
    finish)
        echo "Preparing to finish the engine..."
        ;;
    cont*)
        echo "Some option about continue engine"
        ;;
    *)
        echo "Invalid option"
    ;;
esac        
