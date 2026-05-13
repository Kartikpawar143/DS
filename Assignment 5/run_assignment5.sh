#!/bin/bash

cd "../Assignment 5"

echo "=== Assignment 5: Token Ring Algorithm Demo ==="
echo ""

echo "Running Token Ring simulation with predefined inputs..."
echo ""

# Create input file with test data
cat > input.txt << EOF
4
0
2
100
1
1
3
200
0
EOF

echo "Test scenario:"
echo "- 4 nodes in ring (0,1,2,3)"
echo "- Send data 100 from node 0 to node 2"
echo "- Send data 200 from node 1 to node 3"
echo ""

java TokenRing < input.txt

echo ""
echo "Assignment 5 completed!"
