#!/bin/bash

echo "Installing OpenJDK 8..."
sudo apt update -qq
sudo apt install -y openjdk-8-jdk > /dev/null 2>&1

echo "Setting Java 8 as default..."
echo "2" | sudo update-alternatives --config java > /dev/null 2>&1
echo "2" | sudo update-alternatives --config javac > /dev/null 2>&1

echo "Generating CORBA stubs..."
idlj -fall ReverseModule.idl

echo "Compiling Java files..."
javac *.java ReverseModule/*.java 2>/dev/null

echo "Starting ORB daemon..."
orbd -ORBInitialPort 1050 &
sleep 2

echo "Starting CORBA server..."
java ReverseServer -ORBInitialPort 1050 -ORBInitialHost localhost &
sleep 3

echo "Running demo..."
echo ""
echo "=== CORBA String Reversal Demo ==="

echo "Test 1: 'Hello'"
echo "Hello" | java ReverseClient -ORBInitialPort 1050 -ORBInitialHost localhost

echo "Test 2: 'World'"  
echo "World" | java ReverseClient -ORBInitialPort 1050 -ORBInitialHost localhost

echo "Test 3: '12345'"
echo "12345" | java ReverseClient -ORBInitialPort 1050 -ORBInitialHost localhost

echo ""
echo "Demo completed!"
