FILENAME=slides
BUILD_DIR=build

all: outdir pdf

pdf:
	pdflatex -output-directory=${BUILD_DIR} -aux-directory=${BUILD_DIR} ${FILENAME}.tex
	biber --input-directory=${BUILD_DIR} --output-directory=${BUILD_DIR} $(FILENAME)
	pdflatex -output-directory=${BUILD_DIR} ${FILENAME}.tex
	pdflatex -output-directory=${BUILD_DIR} ${FILENAME}.tex
	
outdir:
	mkdir -p build

clean:
	rm -rf build
