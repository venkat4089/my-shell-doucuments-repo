#!/bin/bash

trap 'echo "Error occurred at line $LINENO"' ERR  # Traps errors and prints the line number

echo "Starting script..."
num1=10
num2=0

# Intentional division by zero error
result=$((num1 / num2))

echo "Result: $result"

