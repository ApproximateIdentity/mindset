THINKGEAR_DIR=../ThinkGearStreamParser
CC=gcc
CFLAGS=-I$(THINKGEAR_DIR) -Wall

LIBS=-lbluetooth

DEPS = \
	options.h \
	dataHandler.h \
	clientSocket.h \
	RFCommSocket.h

OBJS = \
	main.o \
	RFCommSocket.o \
   	clientSocket.o \
	dataHandler.o \
	options.o \

%.o: %.c %.h
	$(CC) -c -o $@ $< $(CFLAGS)

all: $(OBJS)
