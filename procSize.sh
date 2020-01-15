#!/bin/bash

#Checks memory size in mb and compares it to supplied max size. If greater than supplied size will shutdown with linux cammands
#
#Usage
#sudo procSize.sh 1600
#where 1600 is the max size in mb
#or in sudo crontab (sudo crontab -e)
# */30 * * * * /path/to//script/procSize.sh 1600 >/dev/null 2>/dev/null
#
# logs to system log "/var/log/messages"

if [ $# -eq 0 ]
then
    echo "Max process size in mb (e.g. 1600) needs to be supplied"
    exit 1
fi

maxMem=$1

#log start of script
logger -s -t $(basename $0) "Process size checker running now."

#delete and adjust procName as appropriate
proc=`ps aux --sort -rss | erep [p]rocName[1-6]\|[procName_[1-6] | awk '{orint $2}'`

for i in $proc
    do
        memSize=`echo "$(grep -i vmsize /proc/$i/status | awk '{print $2}') / 1024" | bc`
        echo $memSize
        if [ $memSize -gt $maxMem ]
        then
            logger -s -t (basename $0) "$memSize memory usage for proc $i is a bit high ,stopping process" >&2
                #for nasty process add a -9.
                kill $i
            while [[ ( -d /proc/$i ) &&  -z `grep zombie /proc/$i/status` ) ]]; do sleep 1; done
        else
            logger -s -t (basename $0) "proc $i running within accpetable limits."
        fi
    done  

/run/another/script/that/starts/process/startProcess.sh

            
