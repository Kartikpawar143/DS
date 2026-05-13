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

echo "1. Bully Algorithm Demo:"
echo "Test scenario: 4 processes with priorities [1,2,3,4], process 2 initiates election"
echo ""

# Create input for Bully Algorithm
cat > bully_input.txt << EOF
4
1
1
1
2
1
3
1
4
2
EOF

java BullyAlgoExample < bully_input.txt

echo ""
echo "2. Ring Algorithm Demo:"
echo "Test scenario: 5 processes, process 3 initiates election, process 5 failed"
echo ""

# Create input for Ring Algorithm  
cat > ring_input.txt << EOF
5
3
5
EOF

java RingAlgorithm < ring_input.txt

echo ""
echo "Assignment 6 completed!"
