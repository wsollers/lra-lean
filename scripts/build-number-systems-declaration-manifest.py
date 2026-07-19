#!/usr/bin/env python3
"""Generate the number-system declaration inventory from Markdown.

Every numbered mathematical block in docs/number-systems must have an explicit
manifest row.  The inventory is descriptive: it never invents Lean names.  New
rows are emitted with status `missing` until a canonical Lean declaration is
mapped deliberately.
"""

from __future__ import annotations

import pathlib
import re
import sys
import yaml

ROOT = pathlib.Path(__file__).resolve().parents[1]
SOURCE = ROOT / "docs" / "number-systems"
OUTPUT = SOURCE / "declarations.yaml"

BLOCK = re.compile(
    r"^\*\*(Definition|Axiom|Theorem|Lemma|Proposition|Corollary)\s+"
    r"([^*]+?)\.?\*\*$"
)


def slug(text: str) -> str:
    text = re.sub(r"\\\([^)]*\\\)", "", text)
    text = re.sub(r"[^A-Za-z0-9]+", "-", text).strip("-").lower()
    return text or "declaration"


def scan(path: pathlib.Path) -> list[dict[str, object]]:
    rows: list[dict[str, object]] = []
    heading = ""
    for line_number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
        if line.startswith("## "):
            heading = line[3:].strip()
        match = BLOCK.match(line.strip())
        if not match:
            continue
        kind, title = match.groups()
        rows.append(
            {
                "id": f"{path.stem}:{slug(title)}",
                "source": path.name,
                "line": line_number,
                "section": heading,
                "kind": kind.lower(),
                "title": title.strip(),
                "lean_module": None,
                "lean_declaration": None,
                "status": "missing",
            }
        )
    return rows


def main() -> int:
    previous: dict[str, dict[str, object]] = {}
    if OUTPUT.exists():
        loaded = yaml.safe_load(OUTPUT.read_text(encoding="utf-8")) or {}
        previous = {row["id"]: row for row in loaded.get("declarations", [])}

    rows: list[dict[str, object]] = []
    for path in sorted(SOURCE.glob("gpt-*.md")):
        for row in scan(path):
            old = previous.get(str(row["id"]))
            if old:
                for key in ("lean_module", "lean_declaration", "status", "notes"):
                    if key in old:
                        row[key] = old[key]
            rows.append(row)

    document = {
        "version": 1,
        "source_of_truth": "docs/number-systems",
        "allowed_statuses": [
            "missing",
            "statement-mapped-proof-sorry",
            "definition-mapped",
            "proved",
            "intentionally-postponed",
        ],
        "declarations": rows,
    }
    OUTPUT.write_text(yaml.safe_dump(document, sort_keys=False, allow_unicode=True), encoding="utf-8")
    print(f"Wrote {OUTPUT.relative_to(ROOT)} with {len(rows)} declarations")
    return 0


if __name__ == "__main__":
    sys.exit(main())
