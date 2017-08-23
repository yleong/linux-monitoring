#!/bin/bash
grep -vP '^Active|^Proto|^procs|swpd|available' $1 | awk -f process.awk
