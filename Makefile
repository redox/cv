PDFLATEX  = pdflatex

all:
	$(PDFLATEX) cv.tex
	
clean:
	$(RM) -f *.log *.aux *.lof *.lot *.lom *.toc \
	*.idx *.ind *.glo *.gls *.ilg *.out *~ *.bmt *.mtc* \
	*.nlo *.nls *.bbl *.blg
