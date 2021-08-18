DOCNAME=template-article.md
OUTNAME=rendered-article
REFSFILE=references.bib
CSLFILE=pandoc-templates/apa.csl
LATEXTEMPLATE=pandoc-templates/chroma-article.tex
WORDTEMPLATE=pandoc-templates/custom-reference.docx
HTMLTEMPLATE=pandoc-templates/html.template
ARGS=--bibliography $(REFSFILE) --csl $(CSLFILE) --variable=numbersections --variable=indent --number-sections --citeproc 
# --filter pandoc-xnos - not working anymore.
.PHONY: all
all: article

.PHONY: article
article:
	pandoc --variable=numbersections --template=$(LATEXTEMPLATE) --natbib $(ARGS) $(DOCNAME) -o $(OUTNAME).tex
	sed -i '' 's/citep{/cite{/g' $(OUTNAME).tex
	sed -i '' 's@\\\usepackage{natbib}@@g' $(OUTNAME).tex
	pdflatex $(OUTNAME)
	bibtex $(OUTNAME)
	pdflatex $(OUTNAME)
	pdflatex $(OUTNAME)

.PHONY: pdf
pdf:
	pandoc $(ARGS) $(DOCNAME) -o $(OUTNAME).pdf

.PHONY: html
html:
	pandoc --self-contained --template=$(HTMLTEMPLATE) $(ARGS) $(DOCNAME) -o $(OUTNAME).html

.PHONY: word
word:
	pandoc $(ARGS) $(OUTNAME).tex --reference-doc=$(WORDTEMPLATE) -o $(OUTNAME).docx

.PHONY: clean
clean:
	rm -f $(OUTNAME).pdf $(OUTNAME).docx $(OUTNAME).tex $(OUTNAME).html
	rm -f $(OUTNAME).aux $(OUTNAME).bbl $(OUTNAME).blg $(OUTNAME).log $(OUTNAME).log $(OUTNAME).out $(OUTNAME).tex
