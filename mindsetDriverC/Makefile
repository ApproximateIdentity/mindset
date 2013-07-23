CC=gcc
LIBS=-lbluetooth
CFLAGS=-Wall

SRC_DIR=src

.PHONY: mindset recursiveMake
mindset: recursiveMake
	$(CC) -o $(SRC_DIR)/mindset $(shell find . -name *.o) $(CFLAGS) $(LIBS)

recursiveMake:
	$(MAKE) -C ThinkGearStreamParser
	$(MAKE) -C src

.PHONY: clean
clean:
	rm $(shell find . -name *.o) $(SRC_DIR)/mindset
