#!/usr/bin/env python3
"""Generate Lean-driven Blueprint inputs for each active LRA volume.

The number-systems Blueprint is sourced from prose Markdown.  This companion
generator builds volume overview Blueprint chapters directly from the current
Lean files, so the generated documentation can stay useful even in checkouts
where the prose Markdown source tree is absent.
"""

from __future__ import annotations

import pathlib
import json
import re
import sys
import unicodedata

ROOT = pathlib.Path(__file__).resolve().parents[1]
LRA = ROOT / "LRA"
OUTPUT_DIR = ROOT / "blueprint" / "src"
GUIDE_DIR = ROOT / "docs" / "blueprint"

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


def declaration_statuses(
    lines: list[str],
    declarations: list[tuple[str, str, int, str | None]],
) -> dict[str, str]:
    statuses: dict[str, str] = {}
    for position, (_kind, name, line, _title) in enumerate(declarations):
        start = line - 1
        end = (
            declarations[position + 1][2] - 1
            if position + 1 < len(declarations)
            else len(lines)
        )
        body = "\n".join(lines[start:end])
        statuses[name] = "proof pending" if re.search(r"\bsorry\b", body) else "checked"
    return statuses


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
        "declaration_statuses": declaration_statuses(lines, declarations),
        "labels": labels,
        "blueprint_label": blueprint_label,
        "status": status,
    }


def declaration_count_under(modules: list[dict[str, object]], module: str) -> int:
    return sum(
        len(item["declarations"])
        for item in modules
        if str(item["module"]) == module or str(item["module"]).startswith(module + ".")
    )


def declaration_index(modules: list[dict[str, object]]) -> dict[str, dict[str, object]]:
    indexed: dict[str, dict[str, object]] = {}
    for item in modules:
        statuses = item["declaration_statuses"]
        for kind, name, line, title_text in item["declarations"]:
            full = f"{item['module']}.{name}"
            record = {
                "kind": kind,
                "name": name,
                "module": item["module"],
                "line": line,
                "title": title_text,
                "status": statuses.get(name, "checked"),
            }
            indexed[name] = record
            indexed[full] = record
    return indexed


def render_volume_i_guide(modules: list[dict[str, object]]) -> list[str]:
    guide_path = GUIDE_DIR / "volume-i-guide.json"
    if not guide_path.exists():
        return []

    guide = json.loads(guide_path.read_text(encoding="utf-8"))
    decls = declaration_index(modules)
    output: list[str] = [
        "\\section{Maintainer Guide}",
        "\\label{lean-volume-i:maintainer-guide}",
        "",
    ]

    for paragraph in guide.get("chapter_intro", []):
        output.append(tex(paragraph))
        output.append("")

    output.extend([
        "\\subsection{Volume I Map}",
        "\\label{lean-volume-i:volume-map}",
        "",
        "\\begin{itemize}",
    ])
    for row in guide.get("volume_map", []):
        module = row["module"]
        count = declaration_count_under(modules, module)
        output.append(
            "\\item \\textbf{"
            + tex(row["area"])
            + "} (\\texttt{"
            + tex(module)
            + "}, "
            + str(count)
            + " declarations): "
            + tex(row["purpose"])
            + "."
        )
    output.extend(["\\end{itemize}", ""])

    generic = guide.get("generic_set", {})
    output.extend([
        "\\subsection{Generic Set Interface}",
        "\\label{lean-volume-i:generic-set-interface}",
        "",
        "The generic set layer separates mathematical set reasoning from the backend used to represent sets.",
        "Use the public interface for ordinary theorem statements; use implementation modules only when proving that a backend satisfies the interface.",
        "",
        "\\begin{itemize}",
    ])
    for concept in generic.get("concepts", []):
        record = decls.get(concept.get("declaration", ""))
        status = ", " + tex(record["status"]) if record else ""
        output.append(
            "\\item \\texttt{"
            + tex(concept["name"])
            + "} in \\texttt{"
            + tex(concept["module"])
            + "}: "
            + tex(concept["role"])
            + status
            + "."
        )
    output.extend(["\\end{itemize}", ""])

    output.extend([
        "\\subsection{How To Use Generic Sets}",
        "\\label{lean-volume-i:how-to-use-generic-sets}",
        "",
        "\\begin{enumerate}",
    ])
    for step in generic.get("usage", []):
        output.append("\\item " + tex(step))
    output.extend(["\\end{enumerate}", ""])

    output.extend([
        "\\subsection{Import Recipes}",
        "\\label{lean-volume-i:import-recipes}",
        "",
        "\\begin{itemize}",
    ])
    for recipe in generic.get("imports", []):
        output.append(
            "\\item "
            + tex(recipe["need"])
            + ": \\texttt{import "
            + tex(recipe["import"])
            + "}."
        )
    output.extend(["\\end{itemize}", ""])

    output.extend([
        "\\subsection{Proof Recipes}",
        "\\label{lean-volume-i:proof-recipes}",
        "",
        "\\begin{itemize}",
    ])
    for recipe in generic.get("recipes", []):
        output.append("\\item \\textbf{" + tex(recipe["title"]) + ".} " + tex(recipe["text"]))
    output.extend(["\\end{itemize}", ""])

    output.extend([
        "\\subsection{Generic Set Theorem Catalogue}",
        "\\label{lean-volume-i:generic-set-theorem-catalogue}",
        "",
    ])
    for group in guide.get("theorem_catalogue", []):
        output.extend([
            "\\subsubsection{" + tex(group["title"]) + "}",
            "\\begin{itemize}",
        ])
        declarations = group.get("declarations", [])
        if declarations:
            for declaration in declarations:
                record = decls.get(declaration)
                if record:
                    title_text = str(record["title"]).rstrip(".") if record.get("title") else ""
                    title = f": {tex(title_text)}" if title_text else ""
                    output.append(
                        "\\item \\texttt{"
                        + tex(record["kind"])
                        + " "
                        + tex(record["name"])
                        + "} in \\texttt{"
                        + tex(record["module"])
                        + "} ("
                        + tex(record["status"])
                        + ")"
                        + title
                        + "."
                    )
                else:
                    output.append("\\item \\texttt{" + tex(declaration) + "} (not found in current Lean tree).")
        else:
            modules = ", ".join("\\texttt{" + tex(module) + "}" for module in group.get("modules", []))
            output.append("\\item Catalogue group reserved for declarations in " + modules + ".")
        output.extend(["\\end{itemize}", ""])

    return output


def write_volume(slug: str, roman: str, title: str, prefix: str) -> pathlib.Path:
    modules = [inspect(path) for path in lean_files(prefix)]
    output: list[str] = [
        "% This file is generated by scripts/build-volume-blueprints.py.",
        f"\\chapter{{{tex(title)} Lean Blueprint}}",
        f"\\label{{lean-volume-{slug}}}",
        "",
        f"This chapter is generated from the current Lean files under \\texttt{{{tex(prefix)}}}.",
    ]
    if slug == "i":
        output.extend([
            "It records the curated maintainer guide for the Volume I foundation layer.",
            "",
        ])
        output.extend(render_volume_i_guide(modules))
        output_path = OUTPUT_DIR / f"generated-volume-{slug}.tex"
        output_path.write_text("\n".join(output) + "\n", encoding="utf-8")
        return output_path

    output.extend([
        "It records module coverage, source-facing labels, verification statuses,",
        "and public declarations visible to the Lean build.",
        "",
        "\\section{Module Coverage}",
        f"\\label{{lean-volume-{slug}:module-coverage}}",
        "",
        "\\begin{itemize}",
    ])
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
        statuses = item["declaration_statuses"]
        for kind, name, line, title_text in declarations:
            title_part = f" -- {tex(title_text)}" if title_text else ""
            output.append(
                "\\item \\texttt{"
                + tex(kind)
                + " "
                + tex(name)
                + "} at line "
                + str(line)
                + " ("
                + tex(statuses.get(name, "checked"))
                + ")"
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
