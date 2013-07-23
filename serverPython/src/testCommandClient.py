import signal
import sys
import socket
import select

ADDRESS = ('', 13855)

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect(ADDRESS)

sock.send('command')

while True:
    command = sys.stdin.readline()
    sock.send(command)
