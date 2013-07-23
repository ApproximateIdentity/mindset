#ifndef __OPTIONS_H__
#define __OPTIONS_H__

#include <getopt.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define DEFAULT_SOCKET_PORT 13855

extern char mindsetAddress[19];
extern int socketPort;
extern int useSocket;

void
showUsage(char *name);

void
parseArgs(int argc, char *argv[]);

#endif
