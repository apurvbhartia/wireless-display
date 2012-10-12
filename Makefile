SOURCES = *.tex
#GRAPHS = graphs/*.ps
#FIGURES = figures/*.ps
REFS = *.bib

main.ps ps: main.dvi
	dvips -P pdf -t letter -G0 -o main.ps main.dvi

#main.dvi: $(SOURCES) $(GRAPHS) $(REFS) $(FIGURES) Makefile
main.dvi: $(SOURCES) $(REFS) Makefile
	latex main
	bibtex main
	latex main
	latex main

main.pdf pdf: main.ps
	ps2pdf main.ps main.pdf

all: pdf

clean:
	rm -f *.log *.ps *.dvi *.pdf *.aux *.bbl *.blg *.tpm *.out
