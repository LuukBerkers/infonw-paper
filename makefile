SHELL = /usr/bin/fish

all: raspberry-pi.pdf clean
view: show clean

raspberry-pi.pdf: raspberry-pi.tex raspberry-pi.bib
	pdflatex raspberry-pi
	biber raspberry-pi
	pdflatex raspberry-pi
	pdflatex raspberry-pi

show: raspberry-pi.pdf
	okular raspberry-pi.pdf -p 6

spell: raspberry-pi.tex
	hunspell -d nl raspberry-pi.tex

clean:
	rm (ls * | grep -vE "makefile|*.tex|*.bib|*.pdf|afbeeldingen|*.png")
