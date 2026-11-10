# CSC302 Final Project: Elementary Number Theory in Lean

Choose a theorem of elementary number theory, formalize it in Lean starting from the Natural
Number Game, and explain it on paper and in Lean.

**Read the guideline: [guideline/guideline.pdf](guideline/guideline.pdf)** (LaTeX source:
[guideline/guideline.tex](guideline/guideline.tex)). It lists the 20 topics with difficulty and
size, the deliverables, and the grading.

| Folder | Contents |
|---|---|
| [`lean/`](lean/) | The Lean project: the Natural Number Game library extended with order, strong induction, divisibility, division with remainder, congruences and primes (no Mathlib) |
| [`lean/Projects/`](lean/Projects/) | One starter file per topic, with definitions and the statements to prove |
| [`templates/`](templates/) | LaTeX templates for the report (`report.tex`) and the slides (`slides.tex`) |

## Quick start

```bash
# install elan (the Lean version manager) once, then:
cd csc302/final-project/lean
scripts/check.sh                          # compiles the library (no Mathlib download)
scripts/check.sh Projects/A1_Euclid.lean  # checks a project file
```

Deliverables: Lean code, a LaTeX report (PDF), and slides (PDF). See the guideline, Section 4.
