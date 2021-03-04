
MAKE ?= make
AWK  ?= awk

MKDIR 		:= .
DOCSDIR		:= $(MKDIR)/docs
OSCDIR 		:= refs
LANGDIR 	:= lang

SRCDIR   	:= ../latex
MSGSRC   	:= $(SRCDIR)/OSCMsg.tex
LANGSRC  	:= $(SRCDIR)/INScoreLang.tex

OSCSPLIT 	:= $(wildcard $(OSCDIR)/*.tmp)
LANGSPLIT	:= $(wildcard $(LANGDIR)/*.tmp)

OSCSECTIONS := $(OSCSPLIT:%.tmp=%.md)
LANGSECTIONS:= $(LANGSPLIT:%.tmp=%.md)

RAIL 	 	:= $(shell find rail -name "*.rail")
RAILOUT  	:= $(RAIL:rail/%.rail=$(DOCSDIR)/BNF/%.js)

.PHONY: rail

all:
	$(MAKE) one SRCFILE=$(MSGSRC) OUTDIR=$(OSCDIR) INDEX=yes
	$(MAKE) one SRCFILE=$(LANGSRC) OUTDIR=$(LANGDIR) INDEX=no
	$(MAKE) rail

one:
	$(MAKE) -f Make.one


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

test:
	echo OSCDIR $(OSCDIR)

####################################################################
build:
	cd $(MKDIR) && mkdocs build
	git checkout ../docs/CNAME

serve:
	cd $(MKDIR) && mkdocs serve

menu:
	@echo Messages
	@echo $(OSCSECTIONS) | tr " " "\n"  | sed -e 's/^/        - : \//' | sort -n
	@echo Scripting language
	@echo $(LANGSECTIONS) | tr " " "\n" | sed -e 's/^/        - : \//' | sort -n

rail: tools/rail2js $(RAILOUT)

clean:
	rm -rf $(OSCDIR) $(LANGDIR)
	rm -f rail/*.rail $(RAILOUT)

				
$(DOCSDIR)/BNF/%.js: rail/%.rail
	@[ -d $(@D) ] || mkdir -p $(@D)
	tools/rail2js $< | sed -f scripts/rail.sed > $@ 

tools/rail2js:
	make -C tools/rail2js-src

install:
	pip install mkdocs
	pip install markdown-include
	pip install mkdocs-bootswatch
	pip install python-markdown-math

upgrade:
	pip install mkdocs --upgrade
	pip install markdown-include --upgrade
	pip install mkdocs-bootswatch --upgrade
	pip install python-markdown-math --upgrade
