DOCNAME=template-article.md
OUTNAME=rendered-article
REFSFILE=references.bib
CSLFILE=pandoc-templates/apa.csl
LATEXTEMPLATE=pandoc-templates/chroma-article.tex
DOCXTEMPLATE=pandoc-templates/custom-reference.docx
HTMLTEMPLATE=pandoc-templates/template.html
ARGS=--bibliography $(REFSFILE) --csl $(CSLFILE) --variable=numbersections --variable=indent --number-sections --citeproc 

.PHONY: all
all: pdf

.PHONY: pdf
pdf:
	pandoc $(ARGS) --template=$(LATEXTEMPLATE) $(DOCNAME) -o $(OUTNAME).pdf

.PHONY: tex
tex:
	pandoc $(ARGS) --template=$(LATEXTEMPLATE) $(DOCNAME) -o $(OUTNAME).tex

.PHONY: html
html:
	pandoc --self-contained --template=$(HTMLTEMPLATE) $(ARGS) $(DOCNAME) -o $(OUTNAME).html

.PHONY: docx
docx:
	pandoc $(ARGS) $(DOCNAME) -o $(OUTNAME).docx

# --reference-doc=$(WORDTEMPLATE)

.PHONY: clean
clean:
	rm -f $(OUTNAME).pdf $(OUTNAME).docx $(OUTNAME).tex $(OUTNAME).html
	rm -f $(OUTNAME).aux $(OUTNAME).bbl $(OUTNAME).blg $(OUTNAME).log $(OUTNAME).log $(OUTNAME).out $(OUTNAME).tex
