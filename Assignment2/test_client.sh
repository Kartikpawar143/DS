#!/bin/bash
echo "Testing CORBA String Reversal Service"
echo "Enter a string to reverse (or press Ctrl+C to exit):"
java ReverseClient -ORBInitialPort 1050 -ORBInitialHost localhost
