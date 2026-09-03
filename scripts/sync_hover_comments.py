#!/usr/bin/env python3
"""Regenerate and reapply IDE hover comments for Lean declarations.

This is the idempotent entrypoint for the hover-comment workflow:

1. harvest the current `LRA/` declaration set into `hover_comments.json`
2. preserve editable review fields for still-matching declarations
3. reapply the generated doc comments across the source tree

Repeated runs should converge to the same source and JSON state.
"""

from __future__ import annotations

import argparse
from pathlib import Path
import subprocess
import sys


REPO_ROOT = Path(__file__).resolve().parents[1]
HARVEST = REPO_ROOT / "scripts" / "harvest_hover_comments.py"
APPLY = REPO_ROOT / "scripts" / "apply_hover_comments.py"
DEFAULT_ROOT = REPO_ROOT / "LRA"
DEFAULT_OUTPUT = REPO_ROOT / "docs" / "commentary" / "hover_comments.json"


def run_step(args: list[str]) -> None:
    subprocess.run(args, cwd=REPO_ROOT, check=True)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=DEFAULT_ROOT)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument(
        "--no-preserve-custom",
        action="store_true",
        help="Do not preserve editable fields from the existing hover comment dataset.",
    )
    parser.add_argument(
        "--reviewed-only",
        action="store_true",
        help="After regenerating the dataset, apply only reviewed entries.",
    )
    parser.add_argument(
        "--check",
        action="store_true",
        help="Regenerate the dataset and validate the apply step without writing source files.",
    )
    args = parser.parse_args()
    root = args.root if args.root.is_absolute() else REPO_ROOT / args.root
    output = args.output if args.output.is_absolute() else REPO_ROOT / args.output

    harvest_cmd = [
        sys.executable,
        str(HARVEST),
        "--root",
        str(root),
        "--output",
        str(output),
    ]
    if not args.no_preserve_custom:
        harvest_cmd.append("--preserve-custom")

    apply_cmd = [
        sys.executable,
        str(APPLY),
        "--input",
        str(output),
    ]
    if args.reviewed_only:
        apply_cmd.append("--reviewed-only")
    if args.check:
        apply_cmd.append("--check")

    run_step(harvest_cmd)
    run_step(apply_cmd)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
