#!/usr/bin/env python3
"""Write a compact Markdown inventory of completed theorems in an LRA subject.

Examples:

    python scripts/dump_completed_theorems.py Set
    python scripts/dump_completed_theorems.py Identity --stdout
    python scripts/dump_completed_theorems.py ModelTheory --output reports/model-theory.md

The script asks Lean to inspect compiled declarations, so completion status is
based on whether the proof term contains `sorryAx`, not a source-text search.
"""

from __future__ import annotations

import argparse
import csv
import subprocess
import sys
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[1]
DEFAULT_OUTPUT_DIR = REPO_ROOT / "build" / "completed-theorems"


def subject_prefix(subject: str) -> str:
    normalized = subject.strip().strip(".")
    if not normalized:
        raise ValueError("subject must not be empty")
    return normalized if normalized.startswith("LRA.") else f"LRA.{normalized}"


def output_stem(prefix: str) -> str:
    return prefix.removeprefix("LRA.").replace(".", "-")


def refresh_inventory(prefix: str, tsv_path: Path) -> None:
    tsv_path.parent.mkdir(parents=True, exist_ok=True)
    command = [
        "lake",
        "env",
        "lean",
        "--run",
        "scripts/DumpProofsToDo.lean",
        "--prefix",
        prefix,
        "--output",
        str(tsv_path.relative_to(REPO_ROOT)),
    ]
    subprocess.run(command, cwd=REPO_ROOT, check=True)


def completed_theorems(tsv_path: Path) -> list[str]:
    with tsv_path.open(encoding="utf-8", newline="") as handle:
        reader = csv.DictReader(handle, delimiter="\t")
        required = {"fq_name", "kind", "uses_sorry"}
        if reader.fieldnames is None or not required.issubset(reader.fieldnames):
            raise ValueError(f"{tsv_path} is not a DumpProofsToDo TSV")
        return sorted(
            row["fq_name"]
            for row in reader
            if row["kind"].strip() == "theorem"
            and row["uses_sorry"].strip().lower() == "false"
        )


def render_markdown(prefix: str, declarations: list[str]) -> str:
    lines = [
        f"# Completed Theorems: {prefix}",
        "",
        "Generated from Lean's compiled environment by "
        "`scripts/dump_completed_theorems.py`.",
        "",
        f"**Count:** {len(declarations)}",
        "",
        "| Declaration | Status |",
        "| --- | --- |",
    ]
    lines.extend(f"| `{name}` | Completed |" for name in declarations)
    return "\n".join(lines) + "\n"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("subject", help="subject name, for example Set, Identity, or LRA.Set")
    parser.add_argument(
        "--output",
        type=Path,
        help="Markdown output path (default: build/completed-theorems/<subject>.md)",
    )
    parser.add_argument("--stdout", action="store_true", help="write Markdown to standard output")
    parser.add_argument(
        "--tsv",
        type=Path,
        help="reuse an existing DumpProofsToDo TSV instead of refreshing it with Lean",
    )
    args = parser.parse_args()

    if args.output and args.stdout:
        parser.error("--output and --stdout cannot be used together")

    try:
        prefix = subject_prefix(args.subject)
        tsv_path = args.tsv or DEFAULT_OUTPUT_DIR / f"{output_stem(prefix)}.tsv"
        if not tsv_path.is_absolute():
            tsv_path = REPO_ROOT / tsv_path
        if args.tsv is None:
            refresh_inventory(prefix, tsv_path)
        elif not tsv_path.exists():
            raise FileNotFoundError(tsv_path)
        markdown = render_markdown(prefix, completed_theorems(tsv_path))
    except (subprocess.CalledProcessError, FileNotFoundError, ValueError) as error:
        print(f"error: {error}", file=sys.stderr)
        return 1

    if args.stdout:
        sys.stdout.write(markdown)
        return 0

    output_path = args.output or DEFAULT_OUTPUT_DIR / f"{output_stem(prefix)}.md"
    if not output_path.is_absolute():
        output_path = REPO_ROOT / output_path
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(markdown, encoding="utf-8", newline="\n")
    print(f"wrote {output_path.relative_to(REPO_ROOT)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
