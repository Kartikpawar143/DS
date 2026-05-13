#!/bin/bash

cd "$(dirname "$0")"

echo "=== CORBA String Reversal Service Demo ==="
echo ""
echo "Testing with different strings:"
echo ""

# Test 1
echo "Test 1: 'Hello World'"
echo "Hello World" | java ReverseClient -ORBInitialPort 1050 -ORBInitialHost localhost
echo ""

# Test 2  
echo "Test 2: 'CORBA'"
echo "CORBA" | java ReverseClient -ORBInitialPort 1050 -ORBInitialHost localhost
echo ""

# Test 3
echo "Test 3: '12345'"
echo "12345" | java ReverseClient -ORBInitialPort 1050 -ORBInitialHost localhost
echo ""

echo "Demo completed successfully!"
