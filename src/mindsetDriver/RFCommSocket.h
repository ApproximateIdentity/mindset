#ifndef __RFCOMMSOCKET_H__
#define __RFCOMMSOCKET_H__

#include <bluetooth/bluetooth.h>
#include <bluetooth/hci.h>
#include <bluetooth/rfcomm.h>

int
getRFCommSocket(char rem_addr[]);

void
closeRFCommSocket(int sock);

#endif
