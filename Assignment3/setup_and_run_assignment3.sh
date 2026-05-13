#!/bin/bash

cd "../Assignment 3"

echo "Installing MPI..."
sudo apt install -y mpich > /dev/null 2>&1

echo "=== Assignment 3: MPI Parallel Sum Demo ==="
echo ""

echo "Compiling MPI program..."
mpicc demo_assignment3.c -o demo

echo "Running MPI parallel sum calculation..."
echo ""
./demo

echo ""
echo "Assignment 3 completed successfully!"
