TARGET=calendar
BOOKLET=calendar-booklet.pdf

# '-shell-escape' is required for correct eps->pdf conversion
PDFLATEX=pdflatex -shell-escape 

latex_cmd="\def\draft{$(DRAFT)}\input $<"

PICS=$(wildcard pics/*)

all: ${TARGET}.pdf  ${BOOKLET} ${PICS}

booklet: ${BOOKLET}

calendar-booklet.tex: $(TARGET).pdf

$(BOOKLET): calendar-booklet.tex preamble.tex
	$(PDFLATEX) $(latex_cmd)

$(TARGET).pdf: calendar.tex preamble.tex $(PICS)  
	make -C pics
	$(PDFLATEX) $(latex_cmd)  

clean:
	rm -f  *.dvi *.log *.aux *.toc *.out *.tmp *.idx *.ind
	rm -f  *.ilg index.tex
	$(MAKE) -C pics $@

distclean: clean
	rm -f *.ps *.pdf

.PHONY: pics pdf ps booklet
