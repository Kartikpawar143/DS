#!/bin/bash

cd "../Assignment 1"

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
