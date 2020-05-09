
function getTagContent(str) {
	gsub(/}.*/ ,"",str);
	return str;
}

function insertFile(file) {
	cmd = "cat " SRCF file;
	system ( cmd );
}

BEGIN {
	SRCF = "../latex/";
	FS  = "{";
}

################ 
# scan input sections
/\\input{/ 	{
	insertFile(getTagContent($2));
}

################# 
# content
/.*/ 	{
	print $0; 
}
