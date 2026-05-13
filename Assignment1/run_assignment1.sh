#!/bin/bash

# Install Java if not present
if ! command -v javac &> /dev/null; then
    echo "Installing Java..."
    sudo apt update
    sudo apt install -y default-jdk
fi

cd "$(dirname "$0")"

echo "=== RMI Calculator Demo ==="
echo ""

echo "Compiling RMI files..."
javac *.java

echo "Starting RMI registry..."
rmiregistry &
sleep 2

echo "Starting RMI server..."
java Server &
sleep 3

echo "Running client with test data..."
echo -e "3\n5" | java Client

echo ""
echo "Assignment 1 completed!"
