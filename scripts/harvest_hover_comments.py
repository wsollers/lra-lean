#!/usr/bin/env python3
"""Harvest Lean hover-comment metadata into a reviewable JSON file.

The output is intentionally data-first.  Mechanical fields are populated from
Lean source files; pedagogical fields are left as editable review data.  The
companion `apply_hover_comments.py` script only rewrites comments for entries
marked `reviewed` unless explicitly told to include drafts.
"""

from __future__ import annotations

import argparse
from dataclasses import asdict, dataclass
import importlib.util
import json
from pathlib import Path
import re
import sys
from typing import Any


REPO_ROOT = Path(__file__).resolve().parents[1]
CHECK_HOVER_DOCS = REPO_ROOT / "scripts" / "check-hover-docs.py"
DEFAULT_OUTPUT = REPO_ROOT / "docs" / "commentary" / "hover_comments.json"


def load_hover_checker() -> Any:
    spec = importlib.util.spec_from_file_location("check_hover_docs", CHECK_HOVER_DOCS)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {CHECK_HOVER_DOCS}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


HOVER = load_hover_checker()


@dataclass
class HoverCommentEntry:
    id: str
    name: str
    kind: str
    file: str
    line: int
    declaration: str
    formal_statement: str
    existing_doc: str
    detected_connectives: list[str]
    suggested_moves: list[str]
    generated_comment: str
    meaning: str
    type_theoretic_form: list[str]
    proof_use: list[str]
    after_unfold: list[str]
    common_confusions: list[str]
    related_moves: list[str]
    status: str


def repo_relative(path: Path) -> str:
    return path.resolve().relative_to(REPO_ROOT).as_posix()


def clean_doc(raw: str) -> str:
    text = raw
    if text.startswith("/--"):
        text = text[3:]
    if text.endswith("-/"):
        text = text[:-2]
    return text.strip()


def detect_connectives(statement: str) -> list[str]:
    connectives: list[str] = []
    patterns = {
        "∀": r"∀|\bforall\b",
        "→": r"→|->",
        "↔": r"↔|<->",
        "∧": r"∧|/\\",
        "∨": r"∨|\\/",
        "∃": r"∃|\bexists\b",
    }
    for symbol, pattern in patterns.items():
        if re.search(pattern, statement):
            connectives.append(symbol)
    if re.search(r"\bProp\b", statement):
        connectives.append("Prop")
    return connectives


def suggested_moves(connectives: list[str], kind: str) -> list[str]:
    moves: list[str] = []
    if "∀" in connectives or "→" in connectives:
        moves.append("intro")
    if "↔" in connectives:
        moves.extend(["constructor", ".mp", ".mpr"])
    if "∧" in connectives:
        moves.extend(["constructor", "cases", "rcases"])
    if "∨" in connectives:
        moves.extend(["Or.inl", "Or.inr", "cases", "rcases"])
    if "∃" in connectives:
        moves.extend(["use", "rcases"])
    if kind in {"def", "abbrev"}:
        moves.append("unfold")
    return list(dict.fromkeys(moves))


def comment_template(entry: HoverCommentEntry) -> str:
    if entry.meaning.startswith(f"`{entry.name}`"):
        meaning_line = entry.meaning
    else:
        meaning_line = f"`{entry.name}` {entry.meaning or 'TODO'}"
    type_form = "\n".join(f"  {line}" for line in entry.type_theoretic_form) or "  TODO"
    proof_use = "\n".join(f"  {line}" for line in entry.proof_use) or "  TODO"
    after_unfold = "\n".join(f"  {line}" for line in entry.after_unfold) or "  TODO"
    confusions = "\n".join(f"  {line}" for line in entry.common_confusions) or "  TODO"
    moves = ", ".join(entry.related_moves or entry.suggested_moves) or "TODO"
    return (
        "/--\n"
        f"{meaning_line}\n\n"
        "Type-theoretic form:\n\n"
        f"{type_form}\n\n"
        "Proof use:\n\n"
        f"{proof_use}\n\n"
        "After unfold / common proof state:\n\n"
        f"{after_unfold}\n\n"
        "Common confusions:\n\n"
        f"{confusions}\n\n"
        f"Related proof moves: {moves}\n\n"
        "Formal statement:\n\n"
        "```lean\n"
        f"{entry.formal_statement}\n"
        "```\n"
        "-/"
    )


def first_doc_sentence(existing_doc: str) -> str:
    body = existing_doc.strip()
    if not body:
        return ""
    before_logical = body.split("Logical form:", 1)[0].strip()
    return " ".join(line.strip() for line in before_logical.splitlines()).strip()


def entry_for(path: Path, declaration: Any) -> HoverCommentEntry:
    text = path.read_text(encoding="utf-8")
    existing_doc = ""
    if declaration.doc is not None:
        existing_doc = clean_doc(text[declaration.doc.start : declaration.doc.end])
    formal_statement = HOVER.logical_form(declaration)
    connectives = detect_connectives(formal_statement)
    moves = suggested_moves(connectives, declaration.kind)
    meaning = first_doc_sentence(existing_doc)
    entry_id = f"{repo_relative(path)}:{declaration.line}:{declaration.name}"
    entry = HoverCommentEntry(
        id=entry_id,
        name=declaration.name,
        kind=declaration.kind,
        file=repo_relative(path),
        line=declaration.line,
        declaration=declaration.source,
        formal_statement=formal_statement,
        existing_doc=existing_doc,
        detected_connectives=connectives,
        suggested_moves=moves,
        generated_comment="",
        meaning=meaning,
        type_theoretic_form=[],
        proof_use=[],
        after_unfold=[],
        common_confusions=[],
        related_moves=moves,
        status="draft",
    )
    entry.generated_comment = comment_template(entry)
    return entry


def lean_files(root: Path) -> list[Path]:
    return sorted(root.rglob("*.lean")) if root.is_dir() else [root]


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=REPO_ROOT / "LRA")
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument(
        "--preserve-custom",
        action="store_true",
        help="Preserve editable fields from an existing output JSON by declaration name.",
    )
    args = parser.parse_args()

    previous: dict[str, dict[str, Any]] = {}
    if args.preserve_custom and args.output.exists():
        data = json.loads(args.output.read_text(encoding="utf-8"))
        previous = {
            entry.get("id", f"{entry['file']}:{entry['line']}:{entry['name']}"): entry
            for entry in data.get("declarations", [])
        }

    entries: list[HoverCommentEntry] = []
    for path in lean_files(args.root):
        text = path.read_text(encoding="utf-8")
        for declaration in HOVER.declarations_in(text):
            entry = entry_for(path, declaration)
            old = previous.get(entry.id)
            if old:
                for key in [
                    "meaning",
                    "type_theoretic_form",
                    "proof_use",
                    "after_unfold",
                    "common_confusions",
                    "related_moves",
                    "status",
                ]:
                    if old.get(key):
                        setattr(entry, key, old[key])
                entry.generated_comment = comment_template(entry)
            entries.append(entry)

    payload = {
        "schema_version": 1,
        "comment_template": [
            "Meaning",
            "Type-theoretic form",
            "Proof use",
            "After unfold / common proof state",
            "Common confusions",
            "Related proof moves",
            "Formal statement",
        ],
        "declarations": [asdict(entry) for entry in entries],
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"Wrote {len(entries)} declaration entries to {repo_relative(args.output)}.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
