# this is the official Dockerfile for the Chroma Markdown Article Template
# it's basically just the pandoc/latex Docker image but with some added fonts
# it's used in the Github Action for building the template automatically
FROM pandoc/latex:latest
RUN tlmgr install libertine \
                  sourcecodepro
