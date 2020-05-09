
function sample(str) {
	return match(str, /\\sample/) || match(str, /\\example/) ;
}

BEGIN {
	print "# Index"
	SECTION=""
	FS      = ":";
}

END {
	print "\n<\/div>";
}


################# 
# content
/.*/ 	{
	if ($1 != SECTION) {
		print "\n## " $1 "\n";
		SECTION = $1; 
	}
	print $2; 
}
