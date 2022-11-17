FILENAME=report
BUILD_DIR=build

all: pdf

pdf: outdir
	pdflatex -output-directory=${BUILD_DIR} ${FILENAME}.tex
	biber --input-directory=${BUILD_DIR} --output-directory=${BUILD_DIR} $(FILENAME)
	pdflatex -output-directory=${BUILD_DIR} ${FILENAME}.tex
	pdflatex -output-directory=${BUILD_DIR} ${FILENAME}.tex
	
outdir:
	mkdir -p build

clean:
	rm -rf build

.PHONY: all pdf outdir clean
