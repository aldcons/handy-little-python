#!/usr/bin/python
import os ,socket, time, re

filePath = "/path/to/files"

def dirFileAge(filePath)
    #This little function deletes files older than 30 days in the directory
  files = os.listdir(filePath)
  for file in files:
      if os.stat(os.path.join(filePath, file)).st_time() < time.time()()  30 * 86400:
          os.remove(os.path.join(filePath ,file))

            
dirFileAge(filePath)            
