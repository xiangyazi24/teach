#!/usr/bin/env python3
"""Build the chapter PDFs with Tectonic and assemble the complete course handout."""

import argparse
from concurrent.futures import ThreadPoolExecutor
from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path
import re
import shutil
import subprocess

import fitz


ROOT = Path(__file__).resolve().parent
PDF = ROOT / "pdf"
MANIFEST = ROOT / "build-manifest.json"


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def inspect_pdf(path):
    with fitz.open(path) as document:
        if not document.page_count:
            raise ValueError(f"Empty PDF: {path.name}")
        for index, page in enumerate(document):
            if not page.get_text().strip():
                raise ValueError(f"Empty page: {path.name}:{index + 1}")
            for block in page.get_text("dict")["blocks"]:
                for line in block.get("lines", []):
                    for span in line["spans"]:
                        box = fitz.Rect(span["bbox"])
                        if box.x0 < -1 or box.y0 < -1 or box.x1 > page.rect.width + 1 or box.y1 > page.rect.height + 1:
                            raise ValueError(f"Text outside page: {path.name}:{index + 1}: {span['text']}")
        return document.page_count


def compile_chapter(number):
    name = f"chapter{number:02d}"
    source = ROOT / f"{name}.tex"
    if not source.exists() or "\\end{document}" not in source.read_text():
        raise ValueError(f"Incomplete source: {source.name}")
    executable = shutil.which("tectonic")
    if not executable:
        raise RuntimeError("Install Tectonic and ensure it is on PATH")
    result = subprocess.run([executable, "--keep-logs", "--outdir", str(PDF), source.name],
                            cwd=ROOT, text=True, capture_output=True)
    logdir = ROOT.parent / ".work/slide-build"
    logdir.mkdir(parents=True, exist_ok=True)
    (logdir / f"{name}.console.log").write_text(result.stdout + result.stderr)
    if result.returncode:
        raise RuntimeError(f"{name}: compilation failed\n{result.stdout[-1500:]}\n{result.stderr[-2500:]}")
    log = (PDF / f"{name}.log").read_text(errors="replace")
    overfull = re.findall(r"Overfull \\[hv]box \(([0-9.]+)pt too (?:wide|high)\)", log)
    if any(float(value) > 0.5 for value in overfull):
        raise ValueError(f"{name}: overflowing content: {overfull}; see pdf/{name}.log")
    if "Missing character:" in log:
        raise ValueError(f"{name}: missing glyphs; see pdf/{name}.log")
    path = PDF / f"{name}.pdf"
    pages = inspect_pdf(path)
    return {"chapter": number, "source": source.name, "source_sha256": sha(source),
            "pdf": f"pdf/{name}.pdf", "pdf_sha256": sha(path), "pages": pages,
            "overfull_boxes_over_half_point": 0, "missing_glyphs": 0}


def combine(chapters, sources):
    combined = fitz.open()
    bookmarks = []
    for chapter, source in zip(chapters, sources["chapters"]):
        bookmarks.append([1, source["title"], combined.page_count + 1])
        with fitz.open(ROOT / chapter["pdf"]) as document:
            combined.insert_pdf(document)
    combined.set_toc(bookmarks)
    combined.set_metadata({"title": "CSC302: The Mechanics of Proof — Lecture Notes",
                           "author": "Adapted from Heather Macbeth's textbook",
                           "subject": "Chapters 1–10; CSC302 course handout"})
    path = PDF / "all-chapters.pdf"
    combined.save(path, garbage=4, deflate=True)
    combined.close()
    return {"pdf": "pdf/all-chapters.pdf", "pdf_sha256": sha(path), "pages": inspect_pdf(path)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--chapters", type=int, nargs="+", choices=range(1, 11),
                        help="Compile only these chapters; the full manifest is written by a full build")
    parser.add_argument("--check", action="store_true", help="Verify saved input/output hashes without compiling")
    args = parser.parse_args()
    if args.check:
        manifest = json.loads(MANIFEST.read_text())
        for name, expected in manifest["shared_inputs"].items():
            if sha(ROOT / name) != expected:
                raise ValueError(f"Changed build input: {name}")
        for chapter in manifest["chapters"]:
            if sha(ROOT / chapter["source"]) != chapter["source_sha256"]:
                raise ValueError(f"Changed chapter source: {chapter['source']}")
            if sha(ROOT / chapter["pdf"]) != chapter["pdf_sha256"]:
                raise ValueError(f"Changed chapter PDF: {chapter['pdf']}")
            if inspect_pdf(ROOT / chapter["pdf"]) != chapter["pages"]:
                raise ValueError(f"Changed page count: {chapter['pdf']}")
        combined = manifest["combined"]
        if sha(ROOT / combined["pdf"]) != combined["pdf_sha256"]:
            raise ValueError("Changed combined PDF")
        if inspect_pdf(ROOT / combined["pdf"]) != sum(x["pages"] for x in manifest["chapters"]):
            raise ValueError("Combined page count mismatch")
        print(f"PASS: 10 chapter PDFs and combined handout; {combined['pages']} pages; all hashes match.")
        return
    PDF.mkdir(exist_ok=True)
    numbers = sorted(set(args.chapters or range(1, 11)))
    with ThreadPoolExecutor(max_workers=2) as executor:
        chapters = list(executor.map(compile_chapter, numbers))
    for chapter in chapters:
        print(f"PASS: {chapter['source']} -> {chapter['pdf']} ({chapter['pages']} pages)")
    if numbers == list(range(1, 11)):
        sources = json.loads((ROOT / "sources.json").read_text())
        combined = combine(chapters, sources)
        manifest = {"built_at_utc": datetime.now(timezone.utc).isoformat(timespec="seconds"),
                    "engine": subprocess.check_output([shutil.which("tectonic"), "--version"], text=True).strip(),
                    "shared_inputs": {name: sha(ROOT / name) for name in ["preamble.tex", "sources.json", "build.py"]},
                    "chapters": chapters, "combined": combined,
                    "scope": "LaTeX compilation, glyph/overflow checks, PDF page geometry and source/output hashes. Not a Lean kernel check."}
        MANIFEST.write_text(json.dumps(manifest, indent=2) + "\n")
        print(f"Combined handout: {combined['pdf']} ({combined['pages']} pages)")


if __name__ == "__main__":
    main()
