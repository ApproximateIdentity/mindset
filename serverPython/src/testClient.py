import socket
import sys

CONNECTION_TEST = '\xFF'

ADDRESS = ('', 13855)

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect(ADDRESS)

sock.send('data')

while True:
    data = sock.recv(1)
    if not(data == CONNECTION_TEST):
        sys.stdout.write(data)
