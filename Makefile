TARGET=calendar
BOOKLET=calendar-booklet.pdf


# '-shell-escape' is required for correct eps->pdf conversion
PDFLATEX=pdflatex -shell-escape 

SRC=${TARGET}.tex $(wildcard *.tex) #\
#  $(filter-out ${TARGET}.tex, $(wildcard *.tex))

PICS=$(wildcard pics/*)

all: ${TARGET}.pdf  ${BOOKLET} ${PICS}

booklet: ${BOOKLET}

${BOOKLET}: calendar-booklet.tex ${TARGET}.pdf
	${PDFLATEX} $(latex_cmd)

latex_cmd="\def\draft{$(DRAFT)}\input $<"

${TARGET}.pdf: ${SRC} $(PICS)  
	make -C pics
	${PDFLATEX} $(latex_cmd)  

clean:
	rm -f  *.dvi *.log *.aux *.toc *.out *.tmp *.idx *.ind
	rm -f  *.ilg index.tex
	$(MAKE) -C pics $@

distclean: clean
	rm -f *.ps *.pdf

.PHONY: pics pdf ps booklet
