#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

BUILD_DIR="./cache"
mkdir -p "$BUILD_DIR"
export TEXINPUTS="./chapters:"    # resolve \include{chapterXX} into chapters/

CHAP="${1:-}"
INCLUDEONLY=""
if [[ -n "$CHAP" ]]; then
  CHAP="${CHAP#chapter}"
  [[ "$CHAP" =~ ^[0-9]+$ ]] || { echo "usage: ./build.sh [chapter-number]  (no arg = full book)"; exit 1; }
  INCLUDEONLY="\\\\includeonly{chapter$(printf %02d "$CHAP")}"
fi

hash_aux() {
  ( cd "$BUILD_DIR" && cat book.aux book.toc book.out book.idx book.ind *.aux 2>/dev/null | sha256sum ) || true
}

run_tex() {   # $1 = draft|final
  local mode="" args=() synctex=()
  [[ "$1" == "draft" ]] && mode="-draftmode" || synctex=(-synctex=1)
  if [[ -n "$INCLUDEONLY" ]]; then
    sed "s|^%.*includeonly.*|$INCLUDEONLY|" book.tex > "$BUILD_DIR/book.inc.tex"
    args=(-jobname=book "$BUILD_DIR/book.inc.tex")
  else
    args=(book.tex)
  fi
  local t0 t1
  t0=$(date +%s)
  lualatex $mode "${synctex[@]}" -interaction=nonstopmode -halt-on-error -output-directory="$BUILD_DIR" "${args[@]}"
  t1=$(date +%s)
  printf '  [%s pass: %ds]\n' "$1" "$((t1 - t0))"
}

PRE_HASH="$(hash_aux)"

run_tex draft
makeindex -q "$BUILD_DIR/book.idx" 2>/dev/null || true

if [[ "$(hash_aux)" != "$PRE_HASH" ]]; then
  run_tex draft
  makeindex -q "$BUILD_DIR/book.idx" 2>/dev/null || true
fi

run_tex final
cp "$BUILD_DIR/book.pdf" ./book.pdf
cp "$BUILD_DIR/book.synctex.gz" ./book.synctex.gz 2>/dev/null || true
echo "Done: book.pdf"

if [[ -f assets/cover.pdf ]]; then
  qpdf --empty --pages assets/cover.pdf 1-2 book.pdf 1-z assets/cover.pdf 3 \
    -- "Only Competitive Programmer's Handbook.pdf"
  echo "Done: Only Competitive Programmer's Handbook.pdf"
fi