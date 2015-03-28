BUILDDIR  = _build
#BINDIR    = ../../bin
TEX2PDF  := pdflatex --output-directory=$(BUILDDIR)#-shell-escape #-interaction=batchmode
BIBER  := biber --output_directory=$(BUILDDIR)#-interaction=batchmode
#KNIT     := cd $(BUILDDIR) && $(BINDIR)/knitr

all: clean thesis.pdf

clean:
	rm -rf $(BUILDDIR)/* *.pdf

$(BUILDDIR):
	mkdir -p $@

$(BUILDDIR)/%.pdf: %.tex
	($(TEX2PDF) $(<F) 1>/dev/null)


thesis.pdf: thesis.tex $(BUILDDIR)
	($(TEX2PDF) $(<))
	($(TEX2PDF) $(<))
	($(BIBER) thesis)
	($(TEX2PDF) $(<))
	cp $(BUILDDIR)/$(@) .
