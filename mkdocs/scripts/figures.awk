
function getTagContent(str) {
	gsub(/}.*/ ,"",str);
	return str;
}

function makefigure(label, caption, file) {
	print "![" label "](" file ")    ";
	print "<span class='caption'>" caption "</span>";
	cmd = "cp " SRCF file " " DSTF file
	system ( cmd );
}

BEGIN {
	SRCF = "../latex/";
	DSTF = "docs/refs/";
	INFIG= 0;
	FS      = "{";
	FILE = "";
	CAPTION = "";
	LABEL = "";
}

END {
}

################# 
# scan sample sections
/\\begin{figure}/ 	{ INFIG = 1; }
/\\end{figure}/ 		{ makefigure(LABEL, CAPTION, FILE); INFIG = 0; }

/\\includegraphics/ {
	FILE = getTagContent($2) ".png";
}

/\\caption/ {
	CAPTION = getTagContent($2);
}

/\\label/ {
	LABEL = getTagContent($2);
}


################# 
# content
!/\\begin{figure}/  	{
	print $0; 
}
