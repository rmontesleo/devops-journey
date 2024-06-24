#!/bin/bash

function greet(){
    first_name=$1
    last_name=$2
    email=$3

    echo "Welcome $first_name $last_name, a greet will be sent to $email"
}

function hello_world(){
    echo "Saludos a toda la raza... $@"
}

function say_hello(){
    echo "Hello $1"
}


echo "Invoking functions"

say_hello Polo
say_hello Chanchito
say_hello Feliz

hello_world Polo Chanchito Feliz Hugo Pago Luis

greet Chanchito Feliz chanchito.feliz@mail.com
