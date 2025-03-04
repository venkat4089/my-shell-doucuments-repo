#!/bin/bash

debug() {
    echo "DEBUG: $1"
}

num1=10
num2=5

debug "Adding $num1 and $num2"
sum=$((num1 + num2))

debug "Result is $sum"
echo "Final sum: $sum"

