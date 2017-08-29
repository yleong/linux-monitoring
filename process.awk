BEGIN{
	FS="\n=FS=\n";
	RS="\n=RS=\n";
}

{
	split($4, a, " +"); #vmstat
	split($5, b, "\n"); #free
	split(b[2], mem, " +"); #free mem
	split(b[3], membufcached, " +"); #free mem
	split(b[4], swp, " +"); #free swp

	gsub("[:T\-]","",$1); #strip chars from datetime
	gsub("\+0800","",$1); #strip chars from datetime
	#date, us, sy, id, wa, total mem, used mem, free mem, total swp, used swp, free swp
	print $1 "," a[14] "," a[15] "," a[16] "," a[17] "," mem[2] "," membufcached[3] "," membufcached[4] "," swp[2] "," swp[3] "," swp[4] > "cpu_mem.csv";

	gsub(" +",",",$3); #netstat
	print $3;
}
