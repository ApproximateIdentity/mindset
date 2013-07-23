#ifndef __DATAHANDLER_H__
#define __DATAHANDLER_H__

#include "ThinkGearStreamParser.h"
#include "string.h"
#include "stdio.h"

#define MAX_BUFFER 1024

extern int output_fd;

void
myDataHandler(unsigned char extendedCodeLevel, unsigned char code,
              unsigned char numBytes, const unsigned char *value,
              void *customData);

#endif
