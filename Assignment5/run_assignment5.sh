#!/bin/bash

# Install Java if not present
if ! command -v javac &> /dev/null; then
    echo "Installing Java..."
    sudo apt update
    sudo apt install -y default-jdk
fi

cd "$(dirname "$0")"

echo "=== Assignment 5: Token Ring Algorithm Demo ==="
echo ""

echo "Compiling Java files..."
javac *.java

echo "Running Token Ring simulation..."
echo ""

java TokenRing

echo ""
echo "Assignment 5 completed!"

# Clean up
rm -f input.txt
