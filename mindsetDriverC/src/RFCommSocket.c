#include "RFCommSocket.h"

int
getRFCommSocket(char rem_addr[])
{
    int sock, status;
    struct sockaddr_rc sock_addr = {0};

    sock = socket(AF_BLUETOOTH, SOCK_STREAM, BTPROTO_RFCOMM);
    sock_addr.rc_family = AF_BLUETOOTH;
    sock_addr.rc_channel = 3;

    str2ba(rem_addr,  &sock_addr.rc_bdaddr);

    status = connect(sock, (struct sockaddr *)&sock_addr, sizeof(sock_addr));
    if (status < 0) perror("Could not connect to Mindset");

    return sock;
}

void
closeRFCommSocket(int sock)
{
    close(sock);
}

