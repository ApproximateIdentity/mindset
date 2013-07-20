#include "dataHandler.h"

static char message[MAX_BUFFER] = "\0";
static int quality_message_ready = 0;

int output_fd;

void
myDataHandler(unsigned char extendedCodeLevel, unsigned char code,
              unsigned char numBytes, const unsigned char *value,
              void *customData)
{
    char buffer[MAX_BUFFER] = "\0";
    unsigned char i = 0;
    unsigned int j = 0;
    int status;

    switch(code) {
        case(PARSER_CODE_POOR_QUALITY):
            strcpy(message, "\0");
            sprintf(message, "%d,", *value);
            quality_message_ready = 1;
            break;
        case(PARSER_CODE_ASIC_EEG_POWER_INT):
            while (i < numBytes - 3) {
                j += *(value + i);
                i++;
                if ((i % 3) == 0) {
                    sprintf(buffer, "%d,", j);
                    strcat(message, buffer);
                    j = 0;
                }
                else j *= 256;
            }
            while (i < numBytes ) {
                j += *(value + i);
                i++;
                if ((i % 3) == 0) {
                    sprintf(buffer, "%d\n", j);
                    strcat(message, buffer);
                    j = 0;
                }
                else j *= 256;
            }
            if (quality_message_ready == 1) {
                status = write(output_fd, message, strlen(message));
                if (status < 0)
                    perror("Could not send signal.");
                quality_message_ready = 0;
            }
            break;
    };
}
