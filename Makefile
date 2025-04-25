##
# Extended abstract template
#

example.pdf: example.tex figures/figure.png refs.bib
	pdflatex example && biber example && pdflatex example

example.zip: example.pdf example.tex figures/figure.png refs.bib
	zip $@ $^
# end
