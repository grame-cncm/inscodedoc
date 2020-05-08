
DOC 	= OSCMsg.pdf


all: $(DOC)
	
OSCMsg.pdf : OSCMsg.rao OSCMsg.ind

clean:
	rm -f *.aux *.bbl *.blg *.log *.dvi *.rai *.ilg *.idx *.ind *.toc 
	rm -f *.4* *.out *.tmp *.xref *.idv *.lg *.rao *.css
	rm -f $(DOC)


%.bbl: %.bib
	pdflatex $(patsubst %.bib, %.tex, $<) 
	bibtex $(patsubst %.bib, %, $<)
	pdflatex $(patsubst %.bib, %.tex, $<) 

%.idx : %.tex
	latex $< 

%.ind : %.idx
	makeindex $< 

%.aux : %.tex
	pdflatex $< 

%.rao: %.rai
	rail -i $(patsubst %.rai, %, $<)

%.rai: %.tex
	pdflatex $< 

%.pdf: %.tex
	pdflatex $< 
