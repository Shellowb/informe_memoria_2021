#!/bin/sh

pdflatex main.tex
makeglossaries glossaries
pdflatex main.tex