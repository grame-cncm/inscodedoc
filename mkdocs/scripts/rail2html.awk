function basename(file) {
    gsub(/.*\//, "", file);
    gsub(/\..*/, "", file);
    return file;
}
  
function endrail(content, id) {
	file = basename(FILE);
	dstdir  = DSTDIR file;
	dstfile = dstdir "/" id ".rail";
	system ( "[ -d " dstdir " ] || mkdir -p " dstdir );
	print content > dstfile;
	dst = MDDIR id ".html";
	print "\n<span class=rail>"id"</span>\n{!"  MDDIR file "/" id ".html!}\n";
}

function makeID(str) {
	gsub(/[ \t]*/ ,"",str);  # remove spaces
	return str;
}

BEGIN {
	INRAIL= 0;
	FS     = ":";
	CAPTION = "";
	LABEL = "";
	FORMAT = "";
	PRINTFORMAT = 0;
	DSTDIR = "rail/"
	MDDIR = "BNF/";
	ID = "";
}

################# 
# scan sample sections
/\\begin{rail}/ 	{ INRAIL = 1; WAITID = 1}
/\\end{rail}/ 		{ endrail(RAIL, ID); INRAIL = 0; }

################# 
# content
!/\\begin{rail}/  {
	if (INRAIL) {
		if (WAITID) ID = makeID($1);
		WAITID = 0;
		RAIL = RAIL "\n" $0;
	}
	else print;	
}

