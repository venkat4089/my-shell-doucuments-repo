#!/bin/bash

# Enable debugging options
set -x  # Print each command before executing
set -e  # Exit on any command failure
set -u  # Treat unset variables as an error
set -o pipefail  # Exit if any part of a pipeline fails

# Debugging function
debug() {
    echo "DEBUG: $1"
}

# Example function with potential error
divide_numbers() {
    local num1=$1
    local num2=$2

    debug "Dividing $num1 by $num2"

    # Prevent division by zero
    if [ "$num2" -eq 0 ]; then
        echo "Error: Division by zero" >&2
        return 1
    fi

    echo $((num1 / num2))
}

# Set variables
num1=10
num2=0  # Change this to a nonzero value to prevent the error

# Run function
result=$(divide_numbers "$num1" "$num2")
echo "Result: $result"

# Trap errors
trap 'echo "Error occurred on line $LINENO"' ERR

