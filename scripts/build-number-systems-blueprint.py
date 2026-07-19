#!/usr/bin/env python3
"""Assemble Blueprint TeX from ordered number-system Markdown sources.

This is deliberately a small, deterministic converter. It preserves prose order,
turns Markdown headings into TeX sectioning commands, keeps display mathematics,
and emits stable labels derived from source file names and heading slugs. Lean
metadata may be added later through the declaration manifest without rewriting the
mathematical prose by hand.
"""

from __future__ import annotations

import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
SOURCE = ROOT / "docs" / "number-systems"
OUTPUT = ROOT / "blueprint" / "src" / "generated-number-systems.tex"

ORDER = [
    "gpt-00-abstract-laws.md",
    "gpt-00b-canonical-embeddings.md",
    "gpt-00c-universal-properties.md",
    "gpt-00d-streamlined-construction-workflows.md",
    "gpt-01-natural-numbers.md",
    "gpt-01b-whole-numbers.md",
    "gpt-01c-place-value-integers.md",
    "gpt-01d-divisibility-division.md",
    "gpt-02-integers.md",
    "gpt-02a-integers-tao.md",
    "gpt-02b-integers-mendelson.md",
    "gpt-03-rationals.md",
    "gpt-03b-continued-fractions.md",
    "gpt-04-reals-dedekind.md",
    "gpt-05-reals-cauchy.md",
    "gpt-06-reals-cantor.md",
    "gpt-07-reals-interval-arithmetic.md",
    "gpt-08-reals-dyadic.md",
    "gpt-08a-computable-reals.md",
    "gpt-08b-reals-extensions.md",
    "gpt-08c-extended-reals.md",
    "gpt-08d-interval-arithmetic-over-reals.md",
    "gpt-09-complex.md",
    "gpt-09a-characteristic-cardinality.md",
    "gpt-10-comparison-matrix.md",
    "gpt-09b-isomorphism-requirements.md",
    "gpt-09c-volume-iii-interoperability-tests.md",
]

SPECIAL = {
    "&": r"\&",
    "%": r"\%",
    "#": r"\#",
    "_": r"\_",
}


def slug(text: str) -> str:
    plain = re.sub(r"\\\(|\\\)|\$|`|\*", "", text)
    plain = re.sub(r"[^A-Za-z0-9]+", "-", plain).strip("-").lower()
    return plain or "section"


def escape_text(text: str) -> str:
    # Preserve inline math and code fragments; escape only ordinary text spans.
    parts = re.split(r"(\$[^$]*\$|`[^`]*`|\\\([^)]*\\\))", text)
    out: list[str] = []
    for part in parts:
        if not part:
            continue
        if part.startswith("$") or part.startswith("`") or part.startswith(r"\("):
            if part.startswith("`"):
                out.append(r"\texttt{" + part[1:-1].replace("_", r"\_") + "}")
            else:
                out.append(part)
        else:
            for source, target in SPECIAL.items():
                part = part.replace(source, target)
            out.append(part)
    return "".join(out)


def convert(path: pathlib.Path) -> str:
    lines = path.read_text(encoding="utf-8").splitlines()
    output: list[str] = [f"% Generated from {path.name}"]
    in_fence = False
    fence: list[str] = []
    in_display = False

    for raw in lines:
        line = raw.rstrip()

        if line.startswith("```"):
            if not in_fence:
                in_fence = True
                fence = []
            else:
                output.append(r"\begin{verbatim}")
                output.extend(fence)
                output.append(r"\end{verbatim}")
                in_fence = False
            continue
        if in_fence:
            fence.append(line)
            continue

        if line.strip() == "$$":
            output.append(r"\[") if not in_display else output.append(r"\]")
            in_display = not in_display
            continue
        if in_display:
            output.append(line)
            continue

        heading = re.match(r"^(#{1,4})\s+(.*)$", line)
        if heading:
            level = len(heading.group(1))
            title = heading.group(2).strip()
            command = {1: "chapter", 2: "section", 3: "subsection", 4: "subsubsection"}[level]
            label = f"md:{path.stem}:{slug(title)}"
            output.append(f"\\{command}{{{escape_text(title)}}}")
            output.append(f"\\label{{{label}}}")
            continue

        if not line:
            output.append("")
            continue

        if line.startswith("- "):
            output.append(r"\begin{itemize}")
            output.append(r"\item " + escape_text(line[2:]))
            output.append(r"\end{itemize}")
            continue

        output.append(escape_text(line) + "\n")

    return "\n".join(output)


def main() -> int:
    missing = [name for name in ORDER if not (SOURCE / name).exists()]
    if missing:
        print("Missing number-system Markdown sources:", file=sys.stderr)
        for name in missing:
            print(f"  - {name}", file=sys.stderr)
        return 1

    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    body = ["% This file is generated. Do not edit by hand."]
    body.extend(convert(SOURCE / name) for name in ORDER)
    OUTPUT.write_text("\n\n".join(body) + "\n", encoding="utf-8")
    print(f"Wrote {OUTPUT.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
