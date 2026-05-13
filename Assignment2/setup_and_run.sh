#!/bin/bash

cd "$(dirname "$0")"

echo "Generating CORBA stubs..."
idlj -fall ReverseModule.idl

echo "Compiling Java files..."
javac *.java ReverseModule/*.java

echo "Starting ORB daemon..."
orbd -ORBInitialPort 1050 &
sleep 2

echo "Starting CORBA server..."
java ReverseServer -ORBInitialPort 1050 -ORBInitialHost localhost &
sleep 3

echo "Running CORBA String Reversal Client..."
echo ""
echo "=== CORBA String Reversal Demo ==="

java ReverseClient -ORBInitialPort 1050 -ORBInitialHost localhost

echo ""
echo "Demo completed!"
