#!/usr/bin/python
#Little function that checks if a loFile exists, if not it creates the file
import os

logFile = "/path/to/logfles/dataLogFile.log"

def checkForFile():
#Check if a log file exists, if not create one.
    if os.path.exists(logFile):
        myFileDocs  = open(logFile, 'a')
    else
        myFileDocs = open(logFile, 'wb')

def main()::
    #Stuff starts hhappening here.

if __name__ == "__main_":
    checkForLog()
    #Start logging
    logging.basicConfig(level=loggin.DEBUG, format ='%(asctime)s:%(levelname)s:(message)s', filename = logFile)
    logging.info("Running script")
    main()
