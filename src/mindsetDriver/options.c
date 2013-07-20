#include "options.h"
#include <string.h>

void
showUsage(char *name)
{
    printf("\
Usage: %s [OPTION]\n\
Connect to Nuerosky Mindset device and send data stream to stdout or to a\n\
socket of one's choice.\n\n", name);

    printf("\
Mandatory arguments to long options are mandatory for short options too.\n");

    printf("\
  -s, --socket INTEGER\n\
                          direct data stream to socket INTEGER instead of\n\
                          stdout\n");

    printf("\
  -m, --mindset BLUETOOTH_ADDRESS\n\
                          set bluetooth address of mindset device\n");
    
    printf("\
  -h, --help\n\
                          print this help message\n");
}

void
parseArgs(int argc, char *argv[])
{
    int c;
    int digit_optind = 0;

    while (1) {
        int this_option_optind = optind ? optind : 1;
        int option_index = 0;
        static struct option long_options[] = {
            {"socket",           required_argument, 0,  's'   },
            {"mindsetAddress",   required_argument, 0,  'm'   },
            {"help",             no_argument,       0,  'h'   },
            {0,                  0,                 0,  0     }
        };

        c = getopt_long(argc, argv, "s:m:h",
            long_options, &option_index);
        if (c == -1)
            break;

        switch (c) {

        case 's':
            useSocket = 1;
            socketPort = atoi(optarg);
            break;

        case 'm':
            strcpy(mindsetAddress, optarg);
            break;
        
        case 'h':
            showUsage(argv[0]);
            exit(EXIT_SUCCESS);
        }
    }
}
