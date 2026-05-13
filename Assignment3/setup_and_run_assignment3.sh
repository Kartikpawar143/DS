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
echo "Please provide input when prompted:"
echo "1. First enter the number of elements (e.g., 8)"
echo "2. Then enter the array elements separated by spaces (e.g., 1 2 3 4 5 6 7 8)"
echo ""

mpirun -np 4 ./demo

echo ""
echo "Assignment 3 completed successfully!"
