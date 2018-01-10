CLS = dbrgrptt
DOC = thesis
FIGS = figs

.PHONY: all default compile bib clean

all: default

default: plots compile bib
	$(MAKE) compile
	$(MAKE) compile

compile: $(CLS).cls $(DOC).tex
	pdflatex -shell-escape $(DOC).tex # -interaction=nonstopmode

bib: $(DOC).aux
	bibtex $(DOC).aux
	bibtex $(DOC).aux

plots:
	sh figs/make-plots.sh

clean:
	rm -f ./figs/plots/*
	rm -f *.aux *.bbl *.blg *.log *.loa *.lof *.lot *.out *.pdf *.toc *.xdy *.idx *.gnuplot
	rm -f $(FIGS)/*.pdf

dummy:
	pdflatex $(DOC)
	bibtex $(DOC)
	bibtex $(DOC)
	bibtex $(DOC)
	pdflatex $(DOC)
	pdflatex $(DOC)