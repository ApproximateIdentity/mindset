objects = main.o RFCommSocket.o ThinkGearStreamParser.o\
   	      clientSocket.o dataHandler.o options.o

headers = options.h dataHandler.h clientSocket.h\
		  RFCommSocket.h ThinkGearStreamParser.h

Mindset: $(objects)
	cc    -o Mindset $(objects) -lbluetooth

main.o: $(headers)
ThinkGearStreamParser.o: ThinkGearStreamParser.h
RFCommSocket.o: RFCommSocket.h
clientSocket.o: clientSocket.h
dataHandler.o: dataHandler.h
options.o: options.h

.PHONY: clean
clean:
	rm Mindset $(objects)
