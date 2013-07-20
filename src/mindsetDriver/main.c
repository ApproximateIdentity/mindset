#include "options.h"
#include "dataHandler.h"
#include "clientSocket.h"
#include "RFCommSocket.h"
#include "ThinkGearStreamParser.h"

#define DEFAULT_MINDSET_ADDRESS    "00:13:EF:00:3B:F6"
#define DEFUALT_SOCKET_PORT        13855

char mindsetAddress[19] = DEFAULT_MINDSET_ADDRESS;
int socketPort = DEFAULT_SOCKET_PORT;
int useSocket = 0;
int output_fd;

int
main(int argc, char *argv[])
{
    parseArgs(argc, argv);

    int RFCommSocket;
    RFCommSocket = getRFCommSocket(mindsetAddress);

    if (useSocket)
        output_fd = getClientSocket(socketPort);
    else
        output_fd = STDOUT_FILENO;

    sleep(1);

    unsigned char byte;

    ThinkGearStreamParser parser;
    parser.handleDataValue = &myDataHandler;

    for (;;) {
        recv(RFCommSocket, &byte, 1, 0);
        THINKGEAR_parseByte(&parser, byte);
    }

    closeRFCommSocket(RFCommSocket);
    close(output_fd);

    return EXIT_SUCCESS;
}
