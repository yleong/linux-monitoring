#!/bin/bash
grep -hvP '^Active|^Proto|^procs|swpd|available' $@ | awk -f process.awk | sort | uniq | sed 's/ESTABLISHED/&,/g' | sed 's/^udp.*$/&,/g' > netstat.csv
