#!/bin/sh

# PDFLATEX
# pdflatex main.tex
# makeglossaries glossaries
# pdflatex main.tex

# LUALATEX
lualatex -shell-escape main.tex
makeglossaries main
biber main
lualatex -shell-escape main.tex