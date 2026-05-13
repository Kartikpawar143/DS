#!/bin/bash

# Install Python if not present
if ! command -v python3 &> /dev/null; then
    echo "Installing Python..."
    sudo apt update
    sudo apt install -y python3 python3-dateutil
fi

cd "$(dirname "$0")"

echo "=== Assignment 4: Berkeley Clock Synchronization Demo ==="
echo ""

# Kill any existing processes
pkill -f "python3.*server" 2>/dev/null
sleep 1

echo "Starting server..."
python3 simple_server.py &
SERVER_PID=$!
sleep 2

echo "Enter number of clients (1-5):"
read num_clients

echo ""
echo "Starting clients..."
for ((i=1; i<=num_clients; i++)); do
    python3 simple_client.py $i &
    sleep 1
done
sleep 10

echo ""
echo "Stopping server..."
kill $SERVER_PID 2>/dev/null

echo ""
echo "Assignment 4 completed!"
