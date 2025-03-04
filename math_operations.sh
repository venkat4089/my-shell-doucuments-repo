#!/bin/bash

# Enable debugging options
set -x  # Print each command before executing
set -e  # Exit on any command failure
set -u  # Treat unset variables as an error
set -o pipefail  # Exit if any part of a pipeline fails

# Function to debug messages
debug() {
    echo "DEBUG: $1"
}

# Function to perform basic arithmetic
calculate() {
    local num1=$1
    local num2=$2
    local operation=$3

    debug "Performing $operation on $num1 and $num2"

    case $operation in
        add) echo "$((num1 + num2))" ;;
        sub) echo "$((num1 - num2))" ;;
        mul) echo "$((num1 * num2))" ;;
        div) 
            if [ "$num2" -eq 0 ]; then
                echo "Error: Division by zero" >&2
                return 1
            fi
            echo "$((num1 / num2))"
            ;;
        *)
            echo "Error: Invalid operation" >&2
            return 1
            ;;
    esac
}

# User input
read -p "Enter first number: " num1
read -p "Enter second number: " num2
read -p "Enter operation (add, sub, mul, div): " operation

# Run calculation
result=$(calculate "$num1" "$num2" "$operation")
echo "Result: $result"

# Trap errors
trap 'echo "Error occurred on line $LINENO"' ERR

