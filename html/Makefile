
MAKE ?= make

LATEXDIR := ../latex
SRC 	 := OSCMsg.tex
HTMLDIR  := OSCMsg

all: $(DOC)
	$(MAKE) -C $(LATEXDIR)
	$(MAKE) htlatex

htlatex:
	cd  $(LATEXDIR) && htlatex $(SRC) "html,2,frames,index=3,info"
	-[ -d OSCMsg ] && rm -rf OSCMsg
	mkdir OSCMsg
	mv $(LATEXDIR)/*.html $(LATEXDIR)/*.png  $(HTMLDIR)
	cp css/htlatex.css $(HTMLDIR)/OSCMsg.css
	open $(HTMLDIR)/OSCMsg.html

clean:
	rm -rf $(HTMLDIR)
	rm -f  OSCMsg.log
