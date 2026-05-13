#!/bin/bash

cd "$(dirname "$0")"

echo "=== CORBA String Reversal Service Demo ==="
echo ""

java ReverseClient -ORBInitialPort 1050 -ORBInitialHost localhost

echo ""
echo "Demo completed successfully!"
