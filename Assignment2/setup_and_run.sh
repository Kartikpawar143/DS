#!/bin/bash

# Check Java version
JAVA_VERSION=$(java -version 2>&1 | head -n1 | cut -d'"' -f2 | cut -d'.' -f1-2)
if [[ "$JAVA_VERSION" != "1.8" ]]; then
    echo "Error: Java 8 is required for CORBA support"
    echo "Current Java version: $JAVA_VERSION"
    echo "Please install Java 8 (OpenJDK 8)"
    exit 1
fi

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
