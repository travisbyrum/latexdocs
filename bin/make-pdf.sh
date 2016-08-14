#! /bin/bash

PROJECTDIR='../templates'
CURRENTDIR=$(pwd)
# check that the file exists

for template in $(ls $PROJECTDIR)
do
	echo -e "Processing $template ... \n\n"

	cd ~/latexdocs/templates/$template

	echo -e "Available files: $(pwd) \n\n"

	TEXFILE=$(ls *.tex)
	BASEFILE=${TEXFILE%.*}

	echo -e "texfile: $TEXFILE"
	echo -e "basefile: $BASEFILE"

	xelatex -interaction=nonstopmode $TEXFILE
	xelatex -interaction=nonstopmode $TEXFILE

	# these lines can be appended to delete other files, such as *.out
	rm *.aux
	rm *.log
	rm *.ps
	rm *.dvi
	rm *.toc
	rm *.lof
	rm *.out
	mv *pdf ../../pdf/.

done

cd $CURRENTDIR

