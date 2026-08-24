#!/usr/bin/env python3
"""Apply hover comments from `docs/commentary/hover_comments.json`.

By default this script applies every harvested/generated entry so IDE hover
text works immediately after regeneration.  Use `--reviewed-only` if you want
to restrict application to JSON entries with `"status": "reviewed"`.
Existing attached declaration doc comments are wiped before regenerated
comments are inserted, so stale prose cannot survive a regeneration pass.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
from pathlib import Path
import re
import sys
from typing import Any


REPO_ROOT = Path(__file__).resolve().parents[1]
CHECK_HOVER_DOCS = REPO_ROOT / "scripts" / "check-hover-docs.py"
DEFAULT_INPUT = REPO_ROOT / "docs" / "commentary" / "hover_comments.json"
ATTRIBUTE_LINE_RE = re.compile(r"^[ \t]*@\[[^\n]*\][ \t]*$", re.MULTILINE)


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
    stripped = comment.replace("\r\n", "\n").replace("\r", "\n").strip()
    if not stripped.startswith("/--") or not stripped.endswith("-/"):
        raise ValueError("generated_comment must be a Lean doc comment delimited by /-- and -/")
    return stripped + "\n"


def selected_entries(data: dict[str, Any], reviewed_only: bool) -> list[dict[str, Any]]:
    entries: list[dict[str, Any]] = []
    for entry in data.get("declarations", []):
        if not reviewed_only or entry.get("status") == "reviewed":
            entries.append(entry)
    return entries


def declaration_index(path: Path) -> dict[str, Any]:
    text = path.read_text(encoding="utf-8")
    return {
        f"{repo_relative(path)}:{declaration.line}:{declaration.name}": declaration
        for declaration in HOVER.declarations_in(text)
    }


def declaration_name_index(path: Path) -> dict[str, list[Any]]:
    text = path.read_text(encoding="utf-8")
    by_name: dict[str, list[Any]] = {}
    for declaration in HOVER.declarations_in(text):
        by_name.setdefault(declaration.name, []).append(declaration)
    return by_name


def insertion_start(text: str, declaration: Any) -> int:
    start = declaration.doc.start if declaration.doc is not None else declaration.start
    cursor = start
    while True:
        whitespace_start = cursor
        while whitespace_start > 0 and text[whitespace_start - 1] in " \t\r\n":
            whitespace_start -= 1

        line_start = text.rfind("\n", 0, whitespace_start)
        line_start = 0 if line_start < 0 else line_start + 1
        line = text[line_start:whitespace_start]
        if ATTRIBUTE_LINE_RE.fullmatch(line):
            cursor = line_start
            continue
        return cursor


def doc_removal_end(text: str, declaration: Any) -> int:
    if declaration.doc is None:
        raise ValueError("doc_removal_end requires an attached doc comment")
    cursor = declaration.doc.end
    text_length = len(text)
    while cursor < text_length:
        line_end = text.find("\n", cursor)
        if line_end == -1:
            line_end = text_length
        else:
            line_end += 1
        line = text[cursor:line_end]
        if line.strip():
            break
        cursor = line_end
    return cursor


def apply_to_file(path: Path, entries: list[dict[str, Any]], check_only: bool) -> int:
    text = path.read_text(encoding="utf-8")
    declarations = declaration_index(path)
    declarations_by_name = declaration_name_index(path)
    edits: list[tuple[int, int, str]] = []

    for entry in entries:
        entry_id = entry.get("id", f"{entry['file']}:{entry['line']}:{entry['name']}")
        declaration = declarations.get(entry_id)
        if declaration is None:
            same_name = declarations_by_name.get(entry["name"], [])
            if len(same_name) == 1:
                declaration = same_name[0]
            elif same_name:
                declaration = min(
                    same_name,
                    key=lambda candidate: abs(candidate.line - int(entry.get("line", candidate.line))),
                )
            else:
                raise RuntimeError(f"{entry_id} not found")
        comment = normalized_comment(entry["generated_comment"])
        if declaration.doc is not None:
            edits.append((declaration.doc.start, doc_removal_end(text, declaration), ""))
        start = insertion_start(text, declaration)
        edits.append((start, start, comment))

    new_text = text
    for start, end, replacement in sorted(edits, reverse=True):
        new_text = new_text[:start] + replacement + new_text[end:]
    new_text = new_text.replace("\r\n", "\n").replace("\r", "\n")

    if new_text != text and not check_only:
        path.write_text(new_text, encoding="utf-8", newline="\n")
    return len(edits)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, default=DEFAULT_INPUT)
    parser.add_argument(
        "--reviewed-only",
        action="store_true",
        help="Apply only entries marked reviewed instead of the full harvested dataset.",
    )
    parser.add_argument("--check", action="store_true", help="Validate what would be applied without writing.")
    args = parser.parse_args()

    data = json.loads(args.input.read_text(encoding="utf-8"))
    entries = selected_entries(data, args.reviewed_only)
    by_file: dict[Path, list[dict[str, Any]]] = {}
    for entry in entries:
        by_file.setdefault(REPO_ROOT / entry["file"], []).append(entry)

    applied = 0
    skipped: list[str] = []
    for path, file_entries in sorted(by_file.items()):
        try:
            applied += apply_to_file(path, file_entries, args.check)
        except (FileNotFoundError, PermissionError):
            skipped.append(repo_relative(path))

    action = "Validated" if args.check else "Applied"
    print(f"{action} {applied} hover comment entr{'y' if applied == 1 else 'ies'}.")
    if skipped:
        print(
            "Skipped locked or missing file"
            + ("" if len(skipped) == 1 else "s")
            + ": "
            + ", ".join(skipped)
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
