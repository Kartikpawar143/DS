#!/bin/bash

cd "../Assignment 3"

echo "=== MPI Parallel Sum Demo ==="
echo ""

echo "Compiling MPI program..."
mpicc Assignment3.c -o assignment3

echo "Running MPI program with 4 processes..."
echo ""

# Try different approaches for running MPI
if mpirun -n 4 ./assignment3 2>/dev/null; then
    echo "Success with -n flag"
elif mpiexec -n 4 ./assignment3 2>/dev/null; then
    echo "Success with mpiexec"
else
    echo "Running single process version..."
    ./assignment3
fi

echo ""
echo "Assignment 3 completed!"
