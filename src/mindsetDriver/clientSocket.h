#ifndef __CLIENTSOCKET_H__
#define __CLIENTSOCKET_H__

#include <sys/socket.h>
#include <netinet/ip.h>
#include <string.h>

int
getClientSocket(int socketPort);

#endif
