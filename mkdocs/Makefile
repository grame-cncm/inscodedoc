
MAKE ?= make
AWK  ?= awk
PIP  ?= pip3
CONFIG  ?= mkdocs.yml
PORT    ?= 5000

MKDIR 		:= .
DOCSDIR		:= $(MKDIR)/docs
OSCDIR 		:= refs
LANGDIR 	:= lang
WEBDIR 		:= web

SRCDIR   	:= ../latex
MSGSRC   	:= $(SRCDIR)/OSCMsg.tex
LANGSRC  	:= $(SRCDIR)/INScoreLang.tex
WEBSRC  	:= $(SRCDIR)/INScoreWeb/INScoreWeb.tex

OSCSPLIT 	:= $(wildcard $(OSCDIR)/*.tmp)
LANGSPLIT	:= $(wildcard $(LANGDIR)/*.tmp)
WEBSPLIT	:= $(wildcard $(WEBDIR)/*.tmp)

OSCSECTIONS := $(OSCSPLIT:%.tmp=%.md)
LANGSECTIONS:= $(LANGSPLIT:%.tmp=%.md)
WEBSECTIONS := $(WEBSPLIT:%.tmp=%.md)

RAIL 	 	:= $(shell find rail -name "*.rail")
RAILOUT  	:= $(RAIL:rail/%.rail=$(DOCSDIR)/BNF/%.js)

.PHONY: rail web

all:
	$(MAKE) -f Make.one SRCFILE=$(MSGSRC) OUTDIR=$(OSCDIR) INDEX=yes
	$(MAKE) -f Make.one SRCFILE=$(LANGSRC) OUTDIR=$(LANGDIR) INDEX=no
	$(MAKE) -f Make.one SRCFILE=$(WEBSRC) OUTDIR=$(WEBDIR) INDEX=no
	$(MAKE) rail

web:
	$(MAKE) -f Make.one SRCFILE=$(WEBSRC) OUTDIR=$(WEBDIR) INDEX=no


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
	@echo "  menu     : generates menu for mkdoc.yml"

test:
	echo OSCDIR $(OSCDIR)

####################################################################
build:
	cd $(MKDIR) && mkdocs build -f $(CONFIG)
	git checkout ../docs/CNAME

serve:
	cd $(MKDIR) && mkdocs serve -a localhost:$(PORT)

menu:
	@echo Messages
	@echo $(OSCSECTIONS) | tr " " "\n"  | sed -e 's/^/        - : \//' | sort -n
	@echo Scripting language
	@echo $(LANGSECTIONS) | tr " " "\n" | sed -e 's/^/        - : \//' | sort -n
	@echo INScore Web
	@echo $(WEBSECTIONS) | tr " " "\n" | sed -e 's/^/        - : \//' | sort -n

rail: tools/rail2js $(RAILOUT)

clean:
	rm -rf $(OSCDIR) $(LANGDIR) $(WEBDIR)
	rm -f rail/*.rail $(RAILOUT)

				
$(DOCSDIR)/BNF/%.js: rail/%.rail
	@[ -d $(@D) ] || mkdir -p $(@D)
	tools/rail2js $< | sed -f scripts/rail.sed > $@ 

tools/rail2js:
	$(MAKE) -C tools/rail2js-src

install:
	$(PIP) install mkdocs
	$(PIP) install markdown-include
	$(PIP) install mkdocs-bootswatch
	$(PIP) install python-markdown-math

upgrade:
	$(PIP) install mkdocs --upgrade
	$(PIP) install markdown-include --upgrade
	$(PIP) install mkdocs-bootswatch --upgrade
	$(PIP) install python-markdown-math --upgrade
