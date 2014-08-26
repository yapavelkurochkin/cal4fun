SVG=$(wildcard *.svg)
PNG=$(wildcard *.png) $(patsubst %.svg, %.png, $(SVG)) 
JPG=$(wildcard *.jpg)
EPS=$(patsubst %.png, %.eps, $(PNG)) $(patsubst %.jpg, %.eps, $(JPG))

all: $(EPS)

%.eps: %.png
	convert $< -bordercolor black -border 1 $@
%.eps: %.svg
	inkscape -z -E $@ $<
%.png: %.svg
	inkscape -z -e $@ $<
%.eps: %.jpg
	convert $< $@
clean:
	@rm -f $(EPS)
	@rm -f *.pdf

