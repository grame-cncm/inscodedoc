
MAKE ?= make
AWK  ?= awk

MKDIR := "./"

SRCDIR := ../latex
SRC := $(SRCDIR)/OSCMsg.tex
OUT := 1-genformat.md 12-mapping.md 15-interaction.md 18-yacc.md 3-time.md 6-getsect.md 9-scene.md 10-forwarding.md 13-syncmsg.md 16-scripting.md 19-changes.md 4-miscmsgs.md 7-specificMsg.md 11-layers.md 14-graphsig.md 17-plugins.md 2-common.md 5-setsect.md 8-ITL.md
TMP 	:= $(OUT:%.md=%.tmp)
MD 		:= $(OUT:%=docs/refs/%)
REFOUT 	:= $(OUT:%.md=%.refs)
RAIL 	:= $(shell find rail -name "*.rail")
RAILOUT := $(RAIL:rail/%.rail=docs/BNF/%.js)

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
	@echo $(OUT) | tr " " "\n" | sort -n | sed -e 's/^/        - : /'

md: $(MD) docs/refs/index.md

fullrefs: fullrefs.sed
fullrefs.sed : $(TMP)
	grep label $(TMP) | sed -f scripts/labels.sed > $@

split :
	$(AWK) -f scripts/split.awk $(SRC)

refs: $(MD) fullrefs.sed


rail: tools/rail2js $(RAILOUT)

test:
	@echo $(TMP)

clean:
	rm -f $(TMP)
	rm -f $(MD)
	rm -f *.tmp
	rm -f fullrefs.sed
	rm -f index.sed index.md
	rm -f rail/*.rail $(RAILOUT)

	
docs/refs/%.md:%.tmp
	sed -f scripts/tags.sed $< | $(AWK) -f scripts/samples.awk | $(AWK) -f scripts/figures.awk  \
	| $(AWK) -f scripts/tables.awk | $(AWK) -f scripts/rail.awk FILE=$< \
	| sed -f fullrefs.sed | sed -f index.sed | sed -f scripts/cleanup.sed  | grep -v __removed__ > $@

docs/refs/18-yacc.md:18-yacc.tmp
	$(AWK) -f scripts/scan-input.awk $< | sed -f scripts/tags.sed  \
	| sed -f fullrefs.sed | sed -f scripts/cleanup.sed  | grep -v __removed__ > $@

docs/refs/19-changes.md: 19-changes.tmp
	$(AWK) -f scripts/scan-input.awk $< | sed -f scripts/tags.sed | $(AWK) -f scripts/tables.awk  \
 	| sed -f fullrefs.sed | sed -f scripts/cleanup.sed  | grep -v __removed__ > $@
			
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
