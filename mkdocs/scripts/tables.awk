
function getTagContent(str) {
	gsub(/}.*/ ,"",str);
	return str;
}

function tblcontent(str) {
	return index(str, "&");
}


function formatrow(line) {
	gsub("&", "|", line);
	line = "| " line " |";
	return line;
}

function formatheader(line) {
	gsub(/r/, "------:", line);
	gsub(/l/, "------", line);
	gsub(/c[^l]/, ":------:|", line);
	gsub(/cl]/, "------", line);
	return line;
}

function endtable(label, caption) {
	print "\n<span class='caption'>" caption "</span>";
}

BEGIN {
	INTABLE= 0;
	FS     = "{";
	CAPTION = "";
	LABEL = "";
	FORMAT = "";
	PRINTFORMAT = 0;
}

END {
}

################# 
# scan sample sections
/\\begin{table}/ 	{ INTABLE = 1; }
/\\end{table}/ 		{ endtable(LABEL, CAPTION); INTABLE = 0; }
/\\begin{tabular}/ 	{ FORMAT = formatheader(getTagContent($3)); }

/\\caption/ 	{ CAPTION = getTagContent($2); }
/\\label/ 		{ LABEL = getTagContent($2); }

################# 
# content
!/\\begin{tabular}/  {
	if (INTABLE) {
		print formatrow($0);
 		if (FORMAT && tblcontent($0)) {
 			print FORMAT;
	 		FORMAT = "";
	 	}
	}
	else print;	
}

