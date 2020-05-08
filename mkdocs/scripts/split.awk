
function getTagContent(str) {
	gsub(/}.*/ ,"",str);
	return str;
}

function header(str) {
	return match(str, /\\[subtop]{3,6}level/) || match(str, /\\label/);
}

function printheader(level, title) {
	print "\n" level " " title "\n" >> FILE;
}

BEGIN {
	START   = 0;
	PRINT   = 0;
	WAITLABEL = 0;
	SECTION = "";
	FILE    = "";
	INDEX   = "index.md";
	FS      = "{";
	print > INDEX;
	N       = 1;
}

END {
}


################# 
# files and headings
/\\toplevel/ 	{
	if (START)  SECTION = "# " getTagContent($2);
	WAITLABEL = 1;
	PRINT = 0;
}

/\\sublevel/ 	{
	if (START) 	printheader("##", getTagContent($2));
	PRINT = 0;
}

/\\subsublevel/ {
	if (START) 	printheader("###", getTagContent($2));
	PRINT = 0;
}

/\\begin{document}/ {
	START=1;
}

/\\label/ {
	if (WAITLABEL) {
	 	FILE = N "-" getTagContent($2) ".tmp";
	 	N += 1;
	 	print "{!include.txt!}\n" > FILE;
	 	print SECTION >> FILE;
		print >> FILE;
	 	print "\n" >> FILE;
	}
	else if (FILE) print >> FILE;
	WAITLABEL = 0;
	PRINT = 1;
}


################# 
# content
!/\\[subtop]*level/ {
	if (PRINT && !header($0)) print $0 >> FILE; 
}

/\\index/ {
	if (PRINT) print getTagContent($2) >> INDEX;
}



