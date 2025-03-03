#!/bin/bash
set -x  # Enable debug mode

echo "Starting script..."
num1=10
num2=5
sum=$((num1 + num2))

echo "Sum is: $sum"

set +x  # Disable debug mode
echo "Script completed."

