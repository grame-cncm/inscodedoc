
function sample(str) {
	return match(str, /\\sample/) || match(str, /\\example/) ;
}

BEGIN {
	INSAMPLE= 0;
	FS      = "{";
}

END {
}

################# 
# scan sample sections
/\\sample{/ 	{
		print "~~~~~~~ inscore";
		INSAMPLE = 1;
}

/^}/ {
	if(INSAMPLE) {
		print "~~~~~~~\n";
		INSAMPLE = 0;
	}
}

################# 
# content
/.*/ 	{
	print $0; 
}
