# Makefile for simplifying build of different latex resumes
#	sudo docker run --rm -i -e $(moderninputs) -v "$(PWD)":/data \
#		latex $$TEXINPUTS xelatex modern/modern-resume.tex

imgcheck := if ! sudo docker image ls | grep latex; then sudo docker build -t latex . ; fi
latexcmd := sudo docker run --rm -i -v "$(PWD)":/data latex pdflatex
xelatexcmd := sudo docker run --rm -i -v "$(PWD)":/data latex xelatex
awesomeinputs := TEXINPUTS=/data/awesome-cv/resume:/data/awesome-cv/:
moderninput1 := TEXINPUTS=/data/modern/:
moderninput2 := TTFONTS=/data/modern/fonts/:$$TFFONTS
classicinputs := TEXINPUTS=/data/classic/:

PDFS := ./pdfs

.PHONY: awesome modern classic classic clean

all: awesome modern classic

classic: 
	$(imgcheck)
	if ! [ -d $(PDFS) ]; then mkdir $(PDFS); fi
	$(latexcmd) classic/classic-resume.tex
	mv classic-resume.pdf $(PDFS)
	

modern: 
	$(imgcheck)
	if ! [ -d $(PDFS) ]; then mkdir $(PDFS); fi
	sudo docker run --rm -i -e $(moderninput1) -e $(moderninput2) -v "$(PWD)":/data \
		latex $$TEXINPUTS xelatex modern/modern-resume.tex
	mv modern-resume.pdf $(PDFS)

awesome:
	$(imgcheck)
	if ! [ -d $(PDFS) ]; then mkdir $(PDFS); fi
	sudo docker run --rm -i -e $(awesomeinputs) -v "$(PWD)":/data \
		latex $$TEXINPUTS xelatex awesome-cv/awesome-resume.tex
	mv awesome-resume.pdf $(PDFS)
	

clean:
	rm -rf ./*/*.pdf *.aux *.lof *.log *.lot *.fls *.out *.toc *.fmt *.fot *.cb *.cb2 .*.lb *.pdf

