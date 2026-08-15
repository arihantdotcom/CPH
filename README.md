# Competitive Programmer's Handbook

Competitive Programmer's Handbook is a modern introduction to competitive programming.
The book discusses programming tricks and algorithm design techniques relevant in competitive programming.

## About this edition

This edition is redesigned by Arihant Jain to improve accessibility and clarity, and to show
creativity in a minimalist experience of reading a book. The text remains identical to the
official repository.

- **Page size**: 7 × 9.1875 in (504 × 661.5 pt)
- **Font families**: body text EB Garamond, headings Open Sans Condensed (ExtraBold), code
  JetBrains Mono Nerd Font
- **Cover & back pages**: designed externally as separate assets (`assets/cover.pdf`), merged
  with the typeset book via `pdfunite`. Cover design fonts: Open Sans Condensed,
  Red Hat Display, PP Neue Machina, Fonetika Mono

### Building

Build the book (and auto-merge the cover and back pages):

```
./build.sh
```

Outputs:

- `book.pdf` — the typeset book (292 pages)
- `Only Competitive Programmer's Handbook.pdf` — the merged book with cover and back pages (295 pages)

To rebuild only one chapter: `./build.sh 7`

## CSES Problem Set

The CSES Problem Set contains a collection of competitive programming problems.
You can practice the techniques presented in the book by solving the problems.

https://cses.fi/problemset/

## License

The license of the book is Creative Commons BY-SA 4.0.

## Other Books

Guide to Competitive Programming is a printed book, published by Springer, based on Competitive Programmer's Handbook.
There is also a Russian edition Олимпиадное программирование (Olympiad Programming) and a Korean edition 알고리즘 트레이닝: 프로그래밍 대회 입문 가이드.

https://cses.fi/book/
