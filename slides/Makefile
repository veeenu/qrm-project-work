TEX:=$(wildcard *tex) $(wildcard *sty)

output/slides.pdf: $(TEX)
	xelatex -shell-escape -interaction=nonstopmode -output-directory output -aux-directory output slides.tex

all:
	while true; do $(MAKE) output/slides.pdf; sleep 1; done

.PHONY: all
