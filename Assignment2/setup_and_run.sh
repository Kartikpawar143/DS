#!/bin/bash

# Find Java 8 installation
JAVA8_HOME=$(find /usr/lib/jvm -name "java-8-openjdk*" -type d 2>/dev/null | head -1)

if [ -z "$JAVA8_HOME" ]; then
    echo "Java 8 not found. Installing OpenJDK 8..."
    sudo apt update
    sudo apt install -y openjdk-8-jdk
    JAVA8_HOME=$(find /usr/lib/jvm -name "java-8-openjdk*" -type d 2>/dev/null | head -1)
    
    if [ -z "$JAVA8_HOME" ]; then
        echo "Error: Failed to install Java 8"
        exit 1
    fi
fi

# Use Java 8 for this session
export JAVA_HOME="$JAVA8_HOME"
export PATH="$JAVA_HOME/bin:$PATH"

echo "Using Java 8 from: $JAVA_HOME"

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
