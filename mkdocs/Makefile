
MAKE ?= make
AWK  ?= awk

MKDIR := "./"

SRCDIR   := ../latex
SRC      := $(SRCDIR)/OSCMsg.tex
SPLIT    := $(wildcard *.tmp)
SECTIONS := $(SPLIT:%.tmp=%.md)
MD 		 := $(SPLIT:%.tmp=docs/refs/%.md)
REFOUT 	 := $(SECTIONS:%.md=%.refs)
RAIL 	 := $(shell find rail -name "*.rail")
RAILOUT  := $(RAIL:rail/%.rail=docs/BNF/%.js)

.PHONY: rail

all:
	$(MAKE) split
	$(MAKE) fullrefs
	$(MAKE) md
	$(MAKE) rail


####################################################################
help:
	@echo "======================================================="
	@echo "                  INScore documentation"
	@echo "This Makefile is intended to generate the documentation from latex src code"
	@echo "======================================================="
	@echo "Available targets are:"
	@echo "  install  : install the required components"
	@echo "  build    : build the web site"
	@echo "  serve    : launch the mkdoc server"
	@echo "  all      : generates all the necessary files from the latex documentation"
	@echo "Development specific targets are available:"

####################################################################
build:
	cd $(MKDIR) && mkdocs build
	git checkout ../docs/CNAME

serve:
	cd $(MKDIR) && mkdocs serve

menu:
	@echo $(SECTIONS) | tr " " "\n" | sort -n | sed -e 's/^/        - : refs\//'

md: $(MD) docs/refs/index.md

fullrefs: fullrefs.sed
fullrefs.sed : $(SPLIT)
	grep label $(SPLIT) | sed -f scripts/labels.sed > $@

split :
	$(AWK) -f scripts/scan-input.awk $(SRC) | $(AWK) -f scripts/split.awk 

refs: $(MD) fullrefs.sed


rail: tools/rail2js $(RAILOUT)

test:
	@echo $(TMP)

clean:
	rm -f $(SPLIT)
	rm -f $(MD)
	rm -f *.tmp
	rm -f fullrefs.sed
	rm -f index.sed index.md
	rm -f rail/*.rail $(RAILOUT)

docs/refs/%.md:%.tmp
	sed -f scripts/tags.sed $< | $(AWK) -f scripts/samples.awk | $(AWK) -f scripts/figures.awk  \
	| $(AWK) -f scripts/tables.awk | $(AWK) -f scripts/rail.awk FILE=$< \
	| sed -f fullrefs.sed | sed -f index.sed | sed -f scripts/cleanup.sed  | grep -v __removed__ > $@
			
docs/refs/index.md:index.md
	sort $< | $(AWK) -f scripts/index.awk > $@
	
docs/BNF/%.js: rail/%.rail
	@[ -d $(@D) ] || mkdir -p $(@D)
	tools/rail2js $< | sed -f scripts/rail.sed > $@ 

tools/rail2js:
	make -C tools/rail2js-src

install:
	pip install mkdocs
	pip install markdown-include
	pip install mkdocs-bootswatch
	pip install python-markdown-math
