CLS = dbrgrptt
DOC = thesis
FIGS = figs

.PHONY: all default compile bib clean

all: default

default: compile bib
	$(MAKE) compile
	$(MAKE) compile

compile: $(CLS).cls $(DOC).tex
	pdflatex -shell-escape $(DOC).tex # -interaction=nonstopmode

bib: $(DOC).aux
	bibtex $(DOC).aux

clean:
	rm -f *.aux *.bbl *.blg *.log *.loa *.lof *.lot *.out *.pdf *.toc *.xdy *.gnuplot
	rm -f $(FIGS)/*.pdf
