#!/usr/bin/env python3
import socket
import threading
import time
import datetime
import sys

def client(client_id):
    print(f"=== Client {client_id} ===")
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    try:
        client_socket.connect(('localhost', 8080))
        print(f"Client {client_id} connected to server")
        
        for i in range(3):
            # Send current time
            current_time = datetime.datetime.now()
            client_socket.send(str(current_time).encode())
            print(f"Client {client_id} sent: {current_time}")
            
            # Receive synchronized time
            sync_time = client_socket.recv(1024).decode()
            print(f"Client {client_id} received synchronized time: {sync_time}")
            time.sleep(3)
            
    except Exception as e:
        print(f"Client {client_id} error: {e}")
    finally:
        client_socket.close()
        print(f"Client {client_id} disconnected")

if __name__ == "__main__":
    client_id = sys.argv[1] if len(sys.argv) > 1 else "1"
    client(client_id)
