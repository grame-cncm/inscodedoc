
function basename(file) {
    gsub(/\..*/, "", file);
    gsub(/^[^/]*\//, "", file);
    return file;
}

function getTagContent(str) {
	gsub(/}.*/ ,"",str);
	return str;
}

function getsection(str) {
	gsub(/!.*/ ,"",str);
	return str;
}

function gettag(str) {
	gsub(/[^!]*!/ ,"",str);
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
	INDEX   = OUTDIR "/index.md";
	SED     = OUTDIR "/index.sed";
	FS      = "{";
	print > INDEX;
	print > SED;
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

/\\section/ 	{
	if (START)  SECTION = "# " getTagContent($2);
	WAITLABEL = 1;
	PRINT = 0;
}

/\\sublevel/ 	{
	if (START) 	printheader("##", getTagContent($2));
	PRINT = START;
}

/\\subsection/ 	{
	if (START) 	printheader("##", getTagContent($2));
	PRINT = START;
}

/\\subsublevel/ {
	if (START) 	printheader("###", getTagContent($2));
	PRINT = START;
}

/\\subsubsection/ {
	if (START) 	printheader("###", getTagContent($2));
	PRINT = START;
}

/\\begin{document}/ {
	START=1;
}

/\\label/ {
	if (WAITLABEL) {
	 	FILE = OUTDIR "/" N "-" getTagContent($2) ".tmp";
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
	if (PRINT) {
		ref = getTagContent($2);
		section = getsection(ref);
		tag = gettag(ref);
		mdfile =  basename(FILE);
		print section ": <a class=\"indexitem\" href=\"" mdfile "#" mdfile "-" tag "\">" tag "<\/a> " >> INDEX;
		print "s/\\" $0 "/<a name=\"" mdfile "-" tag "\"><\\/a>/" >> SED;
	}
}



