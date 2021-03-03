

OSC   := OSCMsg
LANG  := INScoreLang
OUT   := $(OSC).pdf $(LANG).pdf

LANGDEPS := $(LANG).tex MathExpressions/mathexpressions.tex yacc.tex tokens.tex
OSCDEPS := $(OSC).tex changelist.tex Sensors/sensors.tex scorexpressions.tex


all: $(OUT)
	make -C ScoreExpressionDoc
	
$(OSC).pdf  : $(OSCDEPS) $(OSC).rao $(OSC).ind
$(LANG).pdf : $(LANGDEPS) $(LANG).rao $(LANG).ind

clean:
	rm -f *.aux *.bbl *.blg *.log *.dvi *.rai *.ilg *.idx *.ind *.toc 
	rm -f *.4* *.out *.tmp *.xref *.idv *.lg *.rao *.css *.synctex.gz
	rm -f $(OUT)


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
