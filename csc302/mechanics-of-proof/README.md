# The Mechanics of Proof: CSC302 lecture slides

English Beamer lecture notes following the ten numbered chapters and all 42 sections of Heather Macbeth's [The Mechanics of Proof](https://hrmacbeth.github.io/math2001/). Each chapter includes definitions, worked proofs or calculations, Lean connections, classroom practice, and solution discussion.

[Download the complete handout](pdf/all-chapters.pdf). Individual chapters and editable LaTeX sources:

| Chapter | Sections | Pages | PDF | LaTeX |
|---|---:|---:|---|---|
| 1. Proofs by calculation | 5 | 30 | [Chapter 1](pdf/chapter01.pdf) | [Source](chapter01.tex) |
| 2. Proofs with structure | 5 | 33 | [Chapter 2](pdf/chapter02.pdf) | [Source](chapter02.tex) |
| 3. Parity and divisibility | 5 | 34 | [Chapter 3](pdf/chapter03.pdf) | [Source](chapter03.tex) |
| 4. Proofs with structure, II | 5 | 32 | [Chapter 4](pdf/chapter04.pdf) | [Source](chapter04.tex) |
| 5. Logic | 3 | 28 | [Chapter 5](pdf/chapter05.pdf) | [Source](chapter05.tex) |
| 6. Induction | 7 | 45 | [Chapter 6](pdf/chapter06.pdf) | [Source](chapter06.tex) |
| 7. Number theory | 3 | 29 | [Chapter 7](pdf/chapter07.pdf) | [Source](chapter07.tex) |
| 8. Functions | 4 | 28 | [Chapter 8](pdf/chapter08.pdf) | [Source](chapter08.tex) |
| 9. Sets | 3 | 27 | [Chapter 9](pdf/chapter09.pdf) | [Source](chapter09.tex) |
| 10. Relations | 2 | 26 | [Chapter 10](pdf/chapter10.pdf) | [Source](chapter10.tex) |

The combined handout has **312 pages**, with one bookmark for each chapter.

## Teaching use

The decks use a common 16:9 layout. Practice prompts and solution discussions are on separate slides. The preface and the two technical appendices are supporting reading rather than separate numbered chapter decks.

The mathematical exposition, classroom prompts, and diagrams were written for these slides. Examples are sometimes numerical variants or new examples illustrating the book's method; TeX comments identify the corresponding source section or example. Use the book for its full exercise collection.

Lean snippets follow the textbook's `Library.Basic` / `math2001_init` environment and custom tactics. The source checkout specifies Lean 4.3.0. These are typeset teaching examples: the PDF build does not compile the snippets with Lean. Some slides intentionally show only a statement or proof pattern, and label it as such.

All ten decks received mathematical review against the complete published chapters, including theorem hypotheses, boundary cases, and practice answers. Algebraic identities, truth tables, numerical examples, and algorithm traces were independently checked. All PDFs were compiled and visually inspected; this review does not constitute Lean kernel verification.

## Build

Requirements: [Tectonic](https://tectonic-typesetting.github.io/) on `PATH`, Python 3, and the `PyMuPDF` Python package. The first Tectonic run downloads its TeX packages; subsequent builds can reuse the cache.

Run from the repository root:

```bash
python3 csc302/mechanics-of-proof/build.py
python3 csc302/mechanics-of-proof/build.py --check
```

To rebuild selected chapters:

```bash
python3 csc302/mechanics-of-proof/build.py --chapters 1 6
```

A complete build also merges the ten PDFs, adds chapter bookmarks, and records source/PDF hashes and page counts in [build-manifest.json](build-manifest.json). Re-run the complete build after changing the shared [preamble](preamble.tex). `--check` checks that the saved PDFs correspond to the recorded inputs; it does not rerun TeX or check Lean proofs.

The build rejects missing glyphs, content overflow greater than half a TeX point, empty pages, and text beyond the PDF page boundary. Compilation logs are ignored by Git. Page counts and the validation scope are recorded in the manifest.

## Sources and attribution

Author: **Heather Macbeth**. Book: [The Mechanics of Proof](https://hrmacbeth.github.io/math2001/). Official source: [hrmacbeth/math2001](https://github.com/hrmacbeth/math2001). This adaptation used commit [`e660f42b13ddc`](https://github.com/hrmacbeth/math2001/tree/e660f42b13ddcb6d12b52ba036d6bd071a0cfb9b). [sources.json](sources.json) records every chapter/section URL and the inspected HTML hashes.

The book's footer states: “© Copyright 2022–2024, Heather Macbeth. All rights reserved.” The upstream repository is not labelled with an open content license. These independently written slides attribute the underlying textbook; they do not reproduce its prose wholesale or distribute its original figures. No upstream endorsement is implied.

The full published HTML was used for the source reading: the repository's RST files refer to include files that are absent from the checkout. The accompanying Lean source was consulted for definitions, theorem hypotheses, and the book's notation. Where the book's prose conflicts with its types or calculation, the slides use the consistent mathematical statement and record the adjustment in a TeX comment.
