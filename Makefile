
MAKE ?= make
PDF     := latex/OSCMsg.pdf
PDFDEST := mkdocs/docs/rsrc/INScoreLang.pdf


####################################################################
help:
	@echo "======================================================="
	@echo "            INScore documentation Makefile"
	@echo "======================================================="
	@echo "Available targets are:"
	@echo "  pdf     : build the documentation as a pdf file from the latex folder"
	@echo "  mkdocs  : build the web site from mkdocs folder"
	@echo "  install : install required components for the mkdocs target"
	@echo "Note that you should call the 'install' target once before the 'mkdocs' target"

####################################################################
pdf:
	$(MAKE) -C latex
	cp $(PDF) $(PDFDEST)

mkdocs:
	$(MAKE) -C mkdocs all
	$(MAKE) -C mkdocs build

install:
	$(MAKE) -C mkdocs install

clean:
	$(MAKE) -C latex clean
	$(MAKE) -C mkdocs clean
