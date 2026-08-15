# Contributing to Competitive Programmer's Handbook

Thanks for your interest in contributing! This is a LaTeX book about
competitive programming. Contributions of all kinds are welcome:
fixing typos, improving explanations, adding examples, and translating
chapters.

## License

The book is licensed under the
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International
(CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
license. By contributing, you agree that your contributions are
licensed under the same license. See [LICENSE](LICENSE) for details.

## Getting started

1. Fork the repository and clone your fork.
2. Create a new branch for your changes:
   `git checkout -b my-contribution`
3. Make your changes, then build the book to verify they compile
   (see [Building](#building)).
4. Commit and push your branch, then open a pull request.

## Building

The book is written in LaTeX and is compiled with `pdflatex` (twice,
for the index and references):

```sh
pdflatex book.tex
pdflatex book.tex
pdflatex book.tex
```

The output is `book.pdf`. Most Linux distributions provide these
packages as `texlive` (you may also need `texlive-lang-english`,
`texlive-latex-extra`, and `texlive-fonts-extra`).

## What to work on

- Typos, grammar, and wording improvements
- Corrections to algorithms, proofs, or complexity analysis
- New examples, figures, or code listings
- Better explanations of existing topics
- Translations of chapters

## Style guidelines

- Each chapter lives in its own file under `chapters/`, included from
  `book.tex` via `\include{}`.
- Keep chapter and section numbering consistent with the existing
  structure.
- Use the existing LaTeX commands and environments (for example
  `\begin{lstlisting}` for C++ code, TikZ for figures).
- Code examples should be in C++ and follow the style used throughout
  the book.
- Keep lines reasonably short to make diffs easier to review.

## Pull request process

- Describe what you changed and why in the pull request description.
- If your change is substantial, mention it so reviewers can check it
  carefully.
- If you are asked for changes, update your branch and re-request
  review.

## Questions

If you are not sure about anything, open an issue before making large
changes.