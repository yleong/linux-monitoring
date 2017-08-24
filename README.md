How to process stats generated by `monitor.sh`
==============================================
```
mkdir raw/
cp stats stats*.gz raw/
cd raw/
gunzip *
mv stats stats-$(date --iso-8601='seconds')
./preprocess.sh ./raw/*
cat cpu_mem.csv netstat.csv
```
