#!/bin/bash
FS='=FS='
RS='=RS='
LOG='/root/stats'
GZIP_THRESH='10000000'
INTERVAL=5

while true; do
        date --iso-8601='seconds' >> $LOG
        echo $FS >> $LOG
        uname -a >> $LOG
        echo $FS >> $LOG
        netstat -tuan >> $LOG
        echo $FS >> $LOG
        vmstat >> $LOG
        echo $FS >> $LOG
        free >> $LOG
        echo $RS >> $LOG
        size=`stat -c'%s' $LOG`
        if [[ $size -gt $GZIP_THRESH ]]; then
                gzip $LOG
                mv "$LOG.gz" "$LOG-`date --iso-8601='seconds'`.gz"
        fi
        sleep $INTERVAL
done
