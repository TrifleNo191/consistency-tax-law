```markdown
# Consistency Tax — One-Equation Law

This repository contains the LaTeX source for the 1-page paper:
"One-Equation Law for reality-aligned agents: minimize Consistency Tax CT(P;P*) = λ·D_KL(P||P*) under an ethics gate."

What the repo does:
- Builds a PDF via GitHub Actions (see .github/workflows/build-pdf.yml).
- Provides CITATION.cff to make the paper citable.
- Public, forkable, and ready for archival (e.g., Zenodo) or DOI minting.

To build locally:
```bash
latexmk -pdf main.tex
```
