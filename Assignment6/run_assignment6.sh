#!/bin/bash

# Install Java if not present
if ! command -v javac &> /dev/null; then
    echo "Installing Java..."
    sudo apt update
    sudo apt install -y default-jdk
fi

cd "$(dirname "$0")"

echo "=== Assignment 6: Leader Election Algorithms Demo ==="
echo ""

echo "Compiling Java files..."
javac *.java

echo "Select algorithm:"
echo "1. Bully Algorithm"
echo "2. Ring Algorithm"
read choice

if [ $choice -eq 1 ]; then
    echo "Running Bully Algorithm..."
    java BullyAlgoExample
elif [ $choice -eq 2 ]; then
    echo "Running Ring Algorithm..."
    java RingAlgorithm
else
    echo "Invalid choice"
fi

echo ""
echo "Assignment 6 completed!"

# Clean up
rm -f bully_input.txt ring_input.txt
