#!/bin/bash

# Install Java if not present
if ! command -v javac &> /dev/null; then
    echo "Installing Java..."
    sudo apt update
    sudo apt install -y default-jdk
fi

cd "$(dirname "$0")"

# Set JAVA_HOME and classpath
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export CLASSPATH=.:$JAVA_HOME/lib/tools.jar

echo "Generating CORBA stubs..."
$JAVA_HOME/bin/idlj -fall ReverseModule.idl

echo "Compiling Java files..."
$JAVA_HOME/bin/javac -cp $CLASSPATH *.java ReverseModule/*.java

echo "Starting ORB daemon..."
$JAVA_HOME/bin/orbd -ORBInitialPort 1050 &
sleep 2

echo "Starting CORBA server..."
$JAVA_HOME/bin/java -cp $CLASSPATH ReverseServer -ORBInitialPort 1050 -ORBInitialHost localhost &
sleep 3

echo "Running CORBA String Reversal Client..."
echo ""
echo "=== CORBA String Reversal Demo ==="

$JAVA_HOME/bin/java -cp $CLASSPATH ReverseClient -ORBInitialPort 1050 -ORBInitialHost localhost

echo ""
echo "Demo completed!"
