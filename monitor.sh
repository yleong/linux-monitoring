#!/usr/bin/env bash
set -euo pipefail
#set -x

FS='=FS='
RS='=RS='
LOG='/home/ubuntu/dfsg-monitor/stats'
GZIP_THRESH='10000000'
INTERVAL=5

while true; do
        {
        date --iso-8601='seconds'
        echo $FS
        uname -a
        echo $FS
        netstat -tuan
        echo $FS
        vmstat
        echo $FS
        free
        echo $RS
        } >> $LOG
        size=$(stat -c'%s' $LOG)
        if [[ $size -gt $GZIP_THRESH ]]; then
                gzip $LOG
                mv "$LOG.gz" "$LOG-$(date --iso-8601='seconds').gz"
        fi
        sleep $INTERVAL
done
