BEGIN{
	FS="\n=FS=\n";
	RS="\n=RS=\n";
}

{
	split($4, a, " +"); #vmstat
	split($5, b, "\n"); #free
	split(b[1], mem, " +"); #free mem
	split(b[2], swp, " +"); #free swp

	#date, us, sy, id, wa, total mem, used mem, free mem, total swp, used swp, free swp, uname
	print $1 "," a[14] "," a[15] "," a[16] "," a[17] "," mem[2] "," mem[3] "," mem[4] "," swp[2] "," swp[3] "," swp[4] "," $2 > "cpu_mem.csv";

	gsub(" +",",",$3); #netstat
	print $3;
}
