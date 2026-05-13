#!/bin/bash

# Install Python if not present
if ! command -v python3 &> /dev/null; then
    echo "Installing Python..."
    sudo apt update
    sudo apt install -y python3
fi

cd "$(dirname "$0")"

echo "=== Berkeley Clock Synchronization Demo ==="
echo ""

# Kill any existing processes
pkill -f "python3 server.py" 2>/dev/null
pkill -f "python3 client.py" 2>/dev/null
sleep 1

echo "Starting clock server..."
python3 server.py > server_output.txt 2>&1 &
SERVER_PID=$!
sleep 3

echo "Starting client 1..."
python3 client.py > client1_output.txt 2>&1 &
CLIENT1_PID=$!
sleep 2

echo "Starting client 2..."
python3 client.py > client2_output.txt 2>&1 &
CLIENT2_PID=$!
sleep 8

echo "Server Output:"
head -20 server_output.txt

echo ""
echo "Client 1 Output:"
head -10 client1_output.txt

echo ""
echo "Client 2 Output:"
head -10 client2_output.txt

# Cleanup
kill $SERVER_PID $CLIENT1_PID $CLIENT2_PID 2>/dev/null
rm -f server_output.txt client1_output.txt client2_output.txt

echo ""
echo "Assignment 4 completed!"
