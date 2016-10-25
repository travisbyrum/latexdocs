#! /bin/bash

TEXFILE=$1
CURRENTDIR=$(pwd)

if [ "TEXFILE" == *.tex ]; then
    echo "tex file not found!"
    exit 1
fi

DIR_NAME=$(dirname $TEXFILE)
cd "$DIR_NAME"

xelatex -interaction=nonstopmode "$TEXFILE" -output-directory="$CURRENTDIR"