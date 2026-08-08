#!/usr/bin/env python3
"""Generate Lean-driven Blueprint inputs for each active LRA volume.

The number-systems Blueprint is sourced from prose Markdown.  This companion
generator builds volume overview Blueprint chapters directly from the current
Lean files, so the generated documentation can stay useful even in checkouts
where the prose Markdown source tree is absent.
"""

from __future__ import annotations

import pathlib
import re
import sys
import unicodedata

ROOT = pathlib.Path(__file__).resolve().parents[1]
LRA = ROOT / "LRA"
OUTPUT_DIR = ROOT / "blueprint" / "src"

VOLUMES = [
    ("i", "I", "Volume I", "LRA/VolumeI"),
    ("ii", "II", "Volume II", "LRA/VolumeII"),
    ("iii", "III", "Volume III", "LRA/VolumeIII"),
    ("iv", "IV", "Volume IV", "LRA/VolumeIV"),
    ("vi", "VI", "Volume VI", "LRA/VolumeVI"),
    ("vii", "VII", "Volume VII", "LRA/VolumeVII"),
]

DECLARATION = re.compile(
    r"^\s*(?:noncomputable\s+)?(?:private\s+)?"
    r"(def|theorem|lemma|axiom|structure|inductive|class|abbrev)\s+"
    r"([A-Za-z_][A-Za-z0-9_'.]*)",
)
IMPORT = re.compile(r"^\s*import\s+([A-Za-z_][A-Za-z0-9_'.]*)\s*$")
LABEL = re.compile(r"Volume\s+([IVX]+)\s+label:\s*(.+)")
LEAN_MODULE = re.compile(r"Lean module:\s*(.+)")
BLUEPRINT_LABEL = re.compile(r"Blueprint label:\s*(.+)")
STATUS = re.compile(r"Verification status:\s*(.+)")

SPECIAL = {
    "\\": r"\textbackslash{}",
    "&": r"\&",
    "%": r"\%",
    "#": r"\#",
    "_": r"\_",
    "{": r"\{",
    "}": r"\}",
    "$": r"\$",
    "^": r"\textasciicircum{}",
    "~": r"\textasciitilde{}",
    "`": "'",
}

UNICODE_REPLACEMENTS = {
    "\u2013": "--",
    "\u2014": "--",
    "\u2018": "'",
    "\u2019": "'",
    "\u201c": '"',
    "\u201d": '"',
    "\u2192": "->",
    "\u2194": "<->",
    "\u21d2": "=>",
    "\u21a6": "|->",
    "\u2260": "!=",
    "\u2264": "<=",
    "\u2265": ">=",
    "\u2205": "empty set",
    "\u222a": " union ",
    "\u2229": " intersection ",
    "\u2286": " subset ",
    "\u2208": " in ",
    "\u2200": "forall",
    "\u2203": "exists",
    "\u00ac": "not",
    "\u2227": "and",
    "\u2228": "or",
    "\u25b3": "symmetric difference",
    "\u00d7": "x",
    "\u00b7": "*",
    "\u2218": "o",
    "\u221a": "sqrt",
    "\u207b": "^-",
    "\u207f": "^n",
    "\u1d9c": "^c",
    "\u1d62": "_i",
    "\u03b1": "alpha",
    "\u03b2": "beta",
    "\u03b3": "gamma",
    "\u03b4": "delta",
    "\u03b5": "epsilon",
    "\u03c6": "phi",
    "\u03bb": "lambda",
    "\u2115": "N",
    "\u2124": "Z",
    "\u211a": "Q",
    "\u211d": "R",
    "\u2102": "C",
}


def tex(text: object) -> str:
    value = str(text)
    for source, target in UNICODE_REPLACEMENTS.items():
        value = value.replace(source, target)
    value = unicodedata.normalize("NFKD", value)
    value = value.encode("ascii", "ignore").decode("ascii")
    for source, target in SPECIAL.items():
        value = value.replace(source, target)
    return value


def module_name(path: pathlib.Path) -> str:
    return ".".join(path.relative_to(ROOT).with_suffix("").parts)


def lean_files(prefix: str) -> list[pathlib.Path]:
    root_file = ROOT / f"{prefix}.lean"
    tree = ROOT / prefix
    paths: list[pathlib.Path] = []
    if root_file.exists():
        paths.append(root_file)
    if tree.exists():
        paths.extend(sorted(tree.rglob("*.lean")))
    return paths


def first_doc_title(lines: list[str], declaration_index: int) -> str | None:
    start = max(0, declaration_index - 18)
    block = "\n".join(lines[start:declaration_index])
    match = re.search(r"\*\*\[(?:Definition|Theorem|Lemma|Proposition|Corollary|Axiom|Abbrev|Structure|Class)\s+[^\]]*\]\*\*", block)
    if match:
        return match.group(0).strip("*")
    doc_start = block.rfind("/--")
    if doc_start >= 0:
        snippet = block[doc_start:].replace("/--", "").replace("-/", "").strip()
        first = next((line.strip() for line in snippet.splitlines() if line.strip()), "")
        if first:
            return first[:120]
    return None


def inspect(path: pathlib.Path) -> dict[str, object]:
    lines = path.read_text(encoding="utf-8").splitlines()
    imports: list[str] = []
    declarations: list[tuple[str, str, int, str | None]] = []
    labels: list[str] = []
    lean_module: str | None = None
    blueprint_label: str | None = None
    status: str | None = None

    for index, line in enumerate(lines):
        if match := IMPORT.match(line):
            imports.append(match.group(1))
        if match := DECLARATION.match(line):
            declarations.append(
                (match.group(1), match.group(2), index + 1, first_doc_title(lines, index))
            )
        if match := LABEL.search(line):
            labels.append(match.group(2).strip())
        if match := LEAN_MODULE.search(line):
            lean_module = match.group(1).strip()
        if match := BLUEPRINT_LABEL.search(line):
            blueprint_label = match.group(1).strip()
        if match := STATUS.search(line):
            status = match.group(1).strip()

    return {
        "path": path,
        "module": lean_module or module_name(path),
        "imports": imports,
        "declarations": declarations,
        "labels": labels,
        "blueprint_label": blueprint_label,
        "status": status,
    }


def write_volume(slug: str, roman: str, title: str, prefix: str) -> pathlib.Path:
    modules = [inspect(path) for path in lean_files(prefix)]
    output: list[str] = [
        "% This file is generated by scripts/build-volume-blueprints.py.",
        f"\\chapter{{{tex(title)} Lean Blueprint}}",
        f"\\label{{lean-volume-{slug}}}",
        "",
        f"This chapter is generated from the current Lean files under \\texttt{{{tex(prefix)}}}.",
        "It records module coverage, source-facing labels, verification statuses,",
        "and public declarations visible to the Lean build.",
        "",
        "\\section{Module Coverage}",
        f"\\label{{lean-volume-{slug}:module-coverage}}",
        "",
        "\\begin{itemize}",
    ]
    for item in modules:
        declarations = item["declarations"]
        output.append(
            "\\item \\texttt{"
            + tex(item["module"])
            + "} ("
            + str(len(declarations))
            + " declarations)"
        )
    output.extend(["\\end{itemize}", ""])

    labelled = [
        item for item in modules
        if item["labels"] or item["blueprint_label"] or item["status"]
    ]
    if labelled:
        output.extend([
            "\\section{Source Mappings}",
            f"\\label{{lean-volume-{slug}:source-mappings}}",
            "",
            "\\begin{itemize}",
        ])
        for item in labelled:
            parts: list[str] = []
            if item["labels"]:
                parts.append("labels " + ", ".join(tex(label) for label in item["labels"]))
            if item["blueprint_label"]:
                parts.append("Blueprint label " + tex(item["blueprint_label"]))
            if item["status"]:
                parts.append("status " + tex(item["status"]))
            output.append("\\item \\texttt{" + tex(item["module"]) + "}: " + "; ".join(parts) + ".")
        output.extend(["\\end{itemize}", ""])

    output.extend([
        "\\section{Public Declaration Inventory}",
        f"\\label{{lean-volume-{slug}:public-declaration-inventory}}",
        "",
    ])
    for item in modules:
        declarations = item["declarations"]
        if not declarations:
            continue
        output.extend([
            "\\subsection{" + tex(item["module"]) + "}",
            "\\begin{itemize}",
        ])
        for kind, name, line, title_text in declarations:
            title_part = f" -- {tex(title_text)}" if title_text else ""
            output.append(
                "\\item \\texttt{"
                + tex(kind)
                + " "
                + tex(name)
                + "} at line "
                + str(line)
                + title_part
            )
        output.extend(["\\end{itemize}", ""])

    output_path = OUTPUT_DIR / f"generated-volume-{slug}.tex"
    output_path.write_text("\n".join(output) + "\n", encoding="utf-8")
    return output_path


def main() -> int:
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    written = []
    for slug, roman, title, prefix in VOLUMES:
        if lean_files(prefix):
            written.append(write_volume(slug, roman, title, prefix))
    for path in written:
        print(f"Wrote {path.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
