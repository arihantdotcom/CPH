#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
BUILD_DIR="./cache"
rm -rf "$BUILD_DIR" && mkdir -p "$BUILD_DIR"
export TEXINPUTS="./chapters:"    # resolve \include{chapterXX} into chapters/
pdflatex -synctex=1 -interaction=nonstopmode -halt-on-error -output-directory="$BUILD_DIR" book.tex
makeindex -q "$BUILD_DIR/book.idx" 2>/dev/null || true
pdflatex -synctex=1 -interaction=nonstopmode -halt-on-error -output-directory="$BUILD_DIR" book.tex
pdflatex -synctex=1 -interaction=nonstopmode -halt-on-error -output-directory="$BUILD_DIR" book.tex
cp "$BUILD_DIR/book.pdf" ./book.pdf
rm -rf "$BUILD_DIR"
echo "Done: book.pdf"