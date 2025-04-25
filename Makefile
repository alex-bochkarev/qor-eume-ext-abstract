##
# Extended abstract template
#

.PHONY: clean

example.pdf: example.tex figures/figure.png refs.bib
	pdflatex example && biber example && pdflatex example && pdflatex example

example.zip: example.pdf example.tex figures/figure.png refs.bib qor-eume-ext-abstract.cls
	zip $@ $^

clean:
	rm *.aux *.bbl *.bcf *.blg *.log *.out *.run.xml
# end
