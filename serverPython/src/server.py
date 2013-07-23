import sys
import socket
from select import select
from sklearn.linear_model import LogisticRegression
import numpy as np
from datetime import datetime
from time import sleep

CONNECTION_TEST = '\xFF'

DATA_FOLDER = '../../data/'

AVAILABLE_COMMANDS = ['reset',
                      'setLabel=???',
                      'toggleDataGather',
                      'toggleMode',
                      'save']

SERVER_SOCKET_ADDRESS = ('192.168.1.110', 13855)
#SERVER_SOCKET_ADDRESS = ('', 13855)


class Server(object):
    def __init__(self):
        self.serverSocket = getServerSock(SERVER_SOCKET_ADDRESS)
        self.__initializeConnStatus__()
        self.resetStatus()
        self.resetCurrentCommand()
        self.resetModel()
        self._availableCommands = AVAILABLE_COMMANDS


    def __initializeConnStatus__(self):
        self.connStatus = {
                'hasDataConn'          :   False,
                'hasCommandConn'       :   False,
                'hasMindsetConn'       :   False,
                'serverListening'      :   False,
                'statusChange'         :   True}


    def resetStatus(self):
        self.status = {
                'learning'             :   True,
                'predicting'           :   False,
                'dataGather'           :   False,
                'model'                :   None,
                'defaultModel'         :   'logistic',
                'currentLabel'         :   None,
                'labels'               :   [],
                'data'                 :   [],
                'statusChange'         :   True,
                'error'                :   False}


    def resetCurrentCommand(self):
        self.currentCommand = {
                'reset'                :   False,
                'save'                 :   False,
                'setLabel'             :   False,
                'toggleDataGather'     :   False,
                'toggleMode'           :   False,
                'changeModel'          :   False,
                'unRecognizedCommand'  :   False,
                'unRecognizedValue'    :   False}


    def resetModel(self):
        if not(self.status['model']):
            self.status['model'] = self.status['defaultModel']
        self.model = LogisticRegression()


    def mainLoop(self):
        while True:
            if not(self.connStatus['hasDataConn']
                    and self.connStatus['hasCommandConn']
                    and self.connStatus['hasMindsetConn']):
                self.scanForConnections()

            self.handleStatusChange()

            if self.connStatus['hasCommandConn']:
                try:
                    command = self._commandConn.send(CONNECTION_TEST)
                    if connReady(self._commandConn):
                        command = self._commandConn.recv(1024).strip()
                        self.parseCommand(command)
                        self.executeCommand()
                except socket.error:
                    self._commandConn.close()
                    self.connStatus['hasCommandConn'] = False
                    self.connStatus['statusChange'] = True

            mindsetPayload = None
            if self.connStatus['hasMindsetConn']:
                try:
                    self._mindsetConn.send(CONNECTION_TEST)
                    if connReady(self._mindsetConn):
                        mindsetPayload = self._mindsetConn.recv(1024).strip()
                except socket.error:
                    self._mindsetConn.close()
                    self.connStatus['hasMindsetConn'] = False
                    self.connStatus['statusChange'] = True
                    self.status['dataGather'] = False

            if mindsetPayload:
                if self.status['learning']:
                    dataPayload = self.learningMode(mindsetPayload)
                else:
                    dataPayload = self.predictingMode(mindsetPayload)

            if self.connStatus['hasDataConn']:
                try:
                    if mindsetPayload:
                        self._dataOutputConn.send(dataPayload + '\n')
                    else:
                        self._dataOutputConn.send(CONNECTION_TEST)
                except socket.error:
                    self._dataOutputConn.close()
                    self.connStatus['hasDataConn'] = False
                    self.connStatus['statusChange'] = True
            sleep(.1)


    def scanForConnections(self):
        if not(self.connStatus['serverListening']):
            self.serverSocket.listen(1)
            self.connStatus['serverListening'] = True
        if connReady(self.serverSocket):
            conn, _ = self.serverSocket.accept()
            self.connStatus['serverListening'] = False
            timer = 0
            connTimeOut = True
            while timer < 10:
                if connReady(conn):
                    response = conn.recv(1024)
                    response = response.strip()
                    connTimeOut = False
                timer += 1
                sleep(.1)
            if not connTimeOut:
                if (response == 'data'
                        and not self.connStatus['hasDataConn']):
                    self._dataOutputConn = conn
                    self.connStatus['hasDataConn'] = True
                    self.connStatus['statusChange'] = True
                elif (response == 'command'
                        and not self.connStatus['hasCommandConn']):
                    self._commandConn = conn
                    self.connStatus['hasCommandConn'] = True
                    self.connStatus['statusChange'] = True
                elif (response == 'mindset'
                        and not self.connStatus['hasMindsetConn']):
                    self._mindsetConn = conn
                    self.connStatus['hasMindsetConn'] = True
                    self.connStatus['statusChange'] = True
            else:
                conn.close()


    def handleStatusChange(self):
        if self.status['statusChange'] or self.connStatus['statusChange']:
            printStatus(self.connStatus, self.status, self.availableCommands)
            self.status['statusChange'] = False
            self.connStatus['statusChange'] = False


    def parseCommand(self, command):
        value = ''
        if '=' in command:
            command, value = command.split('=')

        if not(command in self.currentCommand.keys()):
            self.currentCommand['unRecognizedCommand'] = True
        if not value:
            self.currentCommand['unRecognizedValue'] = True

        if command == 'setLabel':
            self.currentCommand['setLabel'] = value
        elif command == 'changeModel':
            self.currentCommand['changeModel'] = value
        else:
            self.currentCommand[command] = True


    def executeCommand(self):
        status = self.status
        connStatus = self.connStatus
        command = self.currentCommand
        if command['reset']:
            self.resetStatus()
        elif command['save']:
            saveData(status['data'], status['labels'])
        elif command['toggleDataGather']:
            if connStatus['hasMindsetConn']:
                status['dataGather'] = not(status['dataGather'])
            else:
                status['error'] = ['dataGather requires Mindset Connection']
        elif command['toggleMode']:
            if status['learning']:
                status['learning'] = False
                self.enterPredictionMode()
            else:
                status['learning'] = True
        elif command['setLabel']:
            label = command['setLabel']
            status['currentLabel'] = label
            if not(label in status['labels']):
                status['labels'].append(label)
        elif command['changeModel']:
            status['model'] = command['changeModel']
            self.resetModel()
        elif command['unRecognizedCommand']:
            status['error'] = 'unrecognized command'
        elif command['unRecognizedValue']:
            status['error'] = 'unrecognized value'
        status['statusChange'] = True


    def learningMode(self, mindsetPayload):
        dataPayload = mindsetPayload
        if self.status['currentLabel']:
            dataPayload += ',' + self.status['currentLabel']
        if self.status['dataGather']:
            self.status['data'].append(dataPayload)
        return dataPayload


    def predictingMode(self, mindsetPayload):
        mindsetPayload = mindsetPayload.split(',')
        mindsetPayload = np.array(mindsetPayload, dtype='float')
        mindsetPayload = mindsetPayload[1:] #drop first entry which is signal quality
        dataPayload = self.model.predict(mindsetPayload)[0]
        return dataPayload


    def enterPredictionMode(self):
        status = self.status
        status['dataGather'] = False
        status['statusChange'] = True
        data = [datum.split(',') for datum in status['data']]
        data = np.array(data)
        X = data[:, 1 : -1].astype('float') #drop column signal quality
        y = data[:, -1]
        self.model.fit(X, y)


    @property
    def status(self):
        return self._status
    @status.setter
    def status(self, value):
        self._status = value

    @property
    def availableCommands(self):
        return self._availableCommands

    @property
    def currentCommand(self):
        return self._currentCommand
    @currentCommand.setter
    def currentCommand(self, value):
        self._currentCommand = value


def printStatus(connStatus, status, availableCommands):
    print chr(27) + "[2J" #Clears the screen

    print 'Connection Status'
    print '    ', 'Has Mindset Connection: ', connStatus['hasMindsetConn']
    print '    ', 'Has Data Connection: ', connStatus['hasDataConn']
    print '    ', 'Has Command Connection: ', connStatus['hasCommandConn']
    print ''

    print 'Server State'
    if status['learning']:
        print '    ', 'Mode: Learning'
    else:
        print '    ', 'Mode: Predicting'

    if status['dataGather']:
        print '    ', 'Data Gather: ON'
    else:
        print '    ', 'Data Gather: OFF'

    if status['currentLabel']:
        print '    ', 'Current Label: ', status['currentLabel']
    else:
        print '    ', 'Current Label: NONE'

    numLabels = len(status['labels'])
    if not(numLabels):
        print '    ', 'Labels: NONE'
    else:
        print '    ', 'Labels: ', status['labels']
    print ''

    print 'Available commands: '
    for command in availableCommands:
        print '    ', command

    if status['error']:
        print 'ERROR: ', status['error']


def saveData(data, labels):
    fmt = "%Y-%m-%d %H:%M:%S"
    now = datetime.now()
    fileName = now.strftime(fmt)
    for label in labels:
        fileName += '_' + label
    fileName += '.csv'
    fileName = DATA_FOLDER + fileName
    with open(fileName, 'w') as f:
        for datum in data:
            f.write(datum + '\n')


def getServerSock(address):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    sock.bind(address)
    return sock


def connReady(conn):
    ready, _, _ = select([conn], [], [], 0)
    return ready


if __name__ == '__main__':
    server = Server()
    server.mainLoop()
