#!/usr/bin/env python3
"""Apply reviewed hover comments from `docs/commentary/hover_comments.json`.

By default this script is conservative: only JSON entries with
`"status": "reviewed"` are applied.  Use `--drafts` for local experiments.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
from pathlib import Path
import sys
from typing import Any


REPO_ROOT = Path(__file__).resolve().parents[1]
CHECK_HOVER_DOCS = REPO_ROOT / "scripts" / "check-hover-docs.py"
DEFAULT_INPUT = REPO_ROOT / "docs" / "commentary" / "hover_comments.json"


def load_hover_checker() -> Any:
    spec = importlib.util.spec_from_file_location("check_hover_docs", CHECK_HOVER_DOCS)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {CHECK_HOVER_DOCS}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


HOVER = load_hover_checker()


def repo_relative(path: Path) -> str:
    return path.resolve().relative_to(REPO_ROOT).as_posix()


def normalized_comment(comment: str) -> str:
    stripped = comment.strip()
    if not stripped.startswith("/--") or not stripped.endswith("-/"):
        raise ValueError("generated_comment must be a Lean doc comment delimited by /-- and -/")
    return stripped + "\n"


def selected_entries(data: dict[str, Any], include_drafts: bool) -> list[dict[str, Any]]:
    entries: list[dict[str, Any]] = []
    for entry in data.get("declarations", []):
        if include_drafts or entry.get("status") == "reviewed":
            entries.append(entry)
    return entries


def declaration_index(path: Path) -> dict[str, Any]:
    text = path.read_text(encoding="utf-8")
    return {
        f"{repo_relative(path)}:{declaration.line}:{declaration.name}": declaration
        for declaration in HOVER.declarations_in(text)
    }


def apply_to_file(path: Path, entries: list[dict[str, Any]], check_only: bool) -> int:
    text = path.read_text(encoding="utf-8")
    declarations = declaration_index(path)
    edits: list[tuple[int, int, str]] = []

    for entry in entries:
        entry_id = entry.get("id", f"{entry['file']}:{entry['line']}:{entry['name']}")
        declaration = declarations.get(entry_id)
        if declaration is None:
            raise RuntimeError(f"{entry_id} not found")
        comment = normalized_comment(entry["generated_comment"])
        if declaration.doc is None:
            replacement = comment
            edits.append((declaration.start, declaration.start, replacement))
        else:
            edits.append((declaration.doc.start, declaration.doc.end, comment.rstrip()))

    new_text = text
    for start, end, replacement in sorted(edits, reverse=True):
        new_text = new_text[:start] + replacement + new_text[end:]

    if new_text != text and not check_only:
        path.write_text(new_text, encoding="utf-8", newline="")
    return len(edits)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, default=DEFAULT_INPUT)
    parser.add_argument("--drafts", action="store_true", help="Apply draft entries as well as reviewed entries.")
    parser.add_argument("--check", action="store_true", help="Validate what would be applied without writing.")
    args = parser.parse_args()

    data = json.loads(args.input.read_text(encoding="utf-8"))
    entries = selected_entries(data, args.drafts)
    by_file: dict[Path, list[dict[str, Any]]] = {}
    for entry in entries:
        by_file.setdefault(REPO_ROOT / entry["file"], []).append(entry)

    applied = 0
    for path, file_entries in sorted(by_file.items()):
        applied += apply_to_file(path, file_entries, args.check)

    action = "Validated" if args.check else "Applied"
    print(f"{action} {applied} hover comment entr{'y' if applied == 1 else 'ies'}.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
