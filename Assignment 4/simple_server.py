#!/usr/bin/env python3
import socket
import threading
import time
import datetime

def server():
    print("=== Berkeley Clock Synchronization Server ===")
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server_socket.bind(('localhost', 8080))
    server_socket.listen(5)
    print("Server started on port 8080")
    
    clients = []
    
    def handle_client(conn, addr):
        print(f"Client {addr} connected")
        clients.append(conn)
        try:
            while True:
                # Receive client time
                data = conn.recv(1024).decode()
                if data:
                    print(f"Received time from {addr}: {data}")
                    # Send synchronized time back
                    sync_time = datetime.datetime.now()
                    conn.send(str(sync_time).encode())
                    print(f"Sent synchronized time to {addr}: {sync_time}")
                time.sleep(2)
        except:
            print(f"Client {addr} disconnected")
            if conn in clients:
                clients.remove(conn)
    
    try:
        while True:
            conn, addr = server_socket.accept()
            client_thread = threading.Thread(target=handle_client, args=(conn, addr))
            client_thread.daemon = True
            client_thread.start()
    except KeyboardInterrupt:
        print("Server shutting down...")
        server_socket.close()

if __name__ == "__main__":
    server()
