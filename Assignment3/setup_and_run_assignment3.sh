#!/bin/bash

# Install MPI if not present
if ! command -v mpicc &> /dev/null; then
    echo "Installing MPI..."
    sudo apt update
    sudo apt install -y mpich
fi

cd "$(dirname "$0")"

echo "=== Assignment 3: MPI Parallel Sum Demo ==="
echo ""

echo "Compiling MPI program..."
mpicc demo_assignment3.c -o demo

echo "Running MPI parallel sum calculation..."
echo ""
./demo

echo ""
echo "Assignment 3 completed successfully!"
