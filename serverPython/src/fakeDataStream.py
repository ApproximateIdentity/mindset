import socket
from sys import stdout
from time import sleep
import random

ADDRESS = ('', 13855)

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect(ADDRESS)

sock.send('mindset')

while True:
    sleep(1)
    payload = ''
    for i in range(5):
        payload += str(random.random()) + ','
    payload += str(random.random())
    sock.send(payload)
