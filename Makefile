filename=test

pdf: 
	pdflatex ${filename}.tex
	pdflatex ${filename}.tex


clean:
	 rm ${filename}.{pdf,log,aux}
