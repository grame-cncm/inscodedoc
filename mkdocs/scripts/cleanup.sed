# remove comments
s/\\jsonindent/    /

s/^}[ \t]*$/__removed__/
s/.*\\begin{.*$/__removed__/
s/.*\\end{.*$/__removed__/
s/\\index{[^}*}]/__removed__/
s/\\input.*/__removed__/
s/\\printindex/__removed__/
s/\\newcommand..*$/__removed__/

s/\\label{\([^}]*\)}/<a name="\1"><\/a>/g
s/.*\\caption{.*$/__removed__/
s/.*\\includegraphics.*$/__removed__/

s/.*\\hline.*$/__removed__/

s/\\sample{//g
s/\\railalias.*$//g
s/\\smallbreak//
s/\\selayout//
s/&lt;/\&amp;lt;/
s/\\ //

############## remove comments
s/%.*//

