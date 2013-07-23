#include "clientSocket.h"

#define HOST "192.168.1.110"

int
getClientSocket(int socketPort)
{
    int clientSocket_fd;
    struct sockaddr_in server_addr;
    int status;

    clientSocket_fd = socket(AF_INET, SOCK_STREAM, 0);
    if (clientSocket_fd < 0)
        perror("Can't make socket.");

    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(socketPort);
    server_addr.sin_addr.s_addr = inet_addr(HOST);

    status = connect(clientSocket_fd, (struct sockaddr *) &server_addr, sizeof(server_addr));
    if (status < 0)
        perror("Can't connect to server.");

    status = write(clientSocket_fd, "mindset", strlen("mindset"));
    if (status < 0)
        perror("Can't authenticate mindset.");

    return clientSocket_fd;
}
