# this script converts a submitted docx file to basic markdown format
pandoc -i $1 -o article.md --extract-media .
