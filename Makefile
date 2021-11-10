DOC_NAME=template-article.md
OUT_NAME=rendered-article
REFS_FILE=references.bib
CSL_FILE=templates/apa.csl
LATEX_TEMPLATE=templates/chroma-article.tex
DOCX_TEMPLATE=templates/custom-reference.docx
HTML_TEMPLATE=templates/template.html
PANDOC_ARGS=--bibliography $(REFS_FILE) --csl $(CSL_FILE) --variable=numbersections --variable=indent --number-sections --citeproc 

.PHONY: all
all: pdf html

.PHONY: pdf
pdf:
	pandoc $(PANDOC_ARGS) --template=$(LATEX_TEMPLATE) $(DOC_NAME) -o $(OUT_NAME).pdf

.PHONY: tex
tex:
	pandoc $(PANDOC_ARGS) --template=$(LATEX_TEMPLATE) $(DOC_NAME) -o $(OUT_NAME).tex

.PHONY: html
html:
	pandoc --self-contained --template=$(HTML_TEMPLATE) $(PANDOC_ARGS) $(DOC_NAME) -o $(OUT_NAME).html

.PHONY: docx
docx:
	pandoc $(PANDOC_ARGS) $(DOC_NAME) -o $(OUT_NAME).docx

# --reference-doc=$(WORDTEMPLATE)

.PHONY: clean
clean:
	rm -f $(OUT_NAME).pdf $(OUT_NAME).docx $(OUT_NAME).tex $(OUT_NAME).html
	rm -f $(OUT_NAME).aux $(OUT_NAME).bbl $(OUT_NAME).blg $(OUT_NAME).log $(OUT_NAME).log $(OUT_NAME).out $(OUT_NAME).tex
