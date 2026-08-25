#!/usr/bin/env python3
"""Harvest Lean hover-comment metadata into a reviewable JSON file.

The output is intentionally data-first.  Mechanical fields are populated from
Lean source files; pedagogical fields are left as editable review data.  The
companion `apply_hover_comments.py` script only rewrites comments for entries
marked `reviewed` unless explicitly told to include drafts.
"""

from __future__ import annotations

import argparse
import csv
from dataclasses import asdict, dataclass
import importlib.util
import json
from pathlib import Path
import re
import sys
from typing import Any


REPO_ROOT = Path(__file__).resolve().parents[1]
CHECK_HOVER_DOCS = REPO_ROOT / "scripts" / "check-hover-docs.py"
PROOFS_TODO_GENERATOR = REPO_ROOT / "scripts" / "generate_proofs_todo.py"
PROOFS_TODO_TSV = REPO_ROOT / "build" / "proofs-todo-environment.tsv"
DEFAULT_OUTPUT = REPO_ROOT / "docs" / "commentary" / "hover_comments.json"
GENERATED_SECTION_MARKERS = [
    "Predicate logic:",
    "Predicate logic (unfolded):",
    "Logical form (Lean):",
    "Type-theoretic form:",
    "Proof use:",
    "After unfold / common proof state:",
    "Common confusions:",
    "Related proof moves:",
]


def load_hover_checker() -> Any:
    spec = importlib.util.spec_from_file_location("check_hover_docs", CHECK_HOVER_DOCS)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {CHECK_HOVER_DOCS}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


HOVER = load_hover_checker()


def load_proofs_todo_generator() -> Any:
    spec = importlib.util.spec_from_file_location("generate_proofs_todo", PROOFS_TODO_GENERATOR)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {PROOFS_TODO_GENERATOR}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


PROOFS_TODO = load_proofs_todo_generator()
SOURCE_MODULE_CACHE: dict[str, Any] = {}


@dataclass
class HoverCommentEntry:
    id: str
    name: str
    kind: str
    file: str
    line: int
    declaration: str
    formal_statement: str
    predicate_logic: str
    predicate_logic_unfolded: str
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


def stable_entry_key(file: str, name: str) -> str:
    return f"{file}:{name}"


def module_name_for_path(path: Path) -> str:
    return repo_relative(path).removesuffix(".lean").replace("/", ".")


def source_module_for_path(path: Path) -> Any:
    key = repo_relative(path)
    cached = SOURCE_MODULE_CACHE.get(key)
    if cached is not None:
        return cached
    module = PROOFS_TODO.scan_source_module(path, "LRA")
    SOURCE_MODULE_CACHE[key] = module
    return module


def source_theorem_for(path: Path, declaration: Any) -> Any | None:
    module = source_module_for_path(path)
    matches = [
        theorem
        for theorem in module.theorems
        if theorem.name == declaration.name and theorem.line == declaration.line
    ]
    if len(matches) == 1:
        return matches[0]
    by_name = [theorem for theorem in module.theorems if theorem.name == declaration.name]
    if len(by_name) == 1:
        return by_name[0]
    if by_name:
        return min(by_name, key=lambda theorem: abs(theorem.line - declaration.line))
    return None


def looks_generated_hover_doc(existing_doc: str) -> bool:
    body = existing_doc.strip()
    if not body:
        return False
    return all(marker in body for marker in GENERATED_SECTION_MARKERS)


def looks_generated_meaning(meaning: str) -> bool:
    body = meaning.strip()
    if not body:
        return False
    return any(marker in body for marker in GENERATED_SECTION_MARKERS)


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


def normalize_text_block(text: str) -> str:
    return text.replace("\r\n", "\n").replace("\r", "\n").strip()


def load_compiled_rows() -> dict[str, list[dict[str, str]]]:
    if not PROOFS_TODO_TSV.exists():
        return {}
    with PROOFS_TODO_TSV.open(encoding="utf-8", newline="") as handle:
        reader = csv.DictReader(handle, delimiter="\t")
        rows_by_module: dict[str, list[dict[str, str]]] = {}
        for row in reader:
            rows_by_module.setdefault(row["module"], []).append(row)
        return rows_by_module


COMPILED_ROWS = load_compiled_rows()


def compiled_row_for(
    rows_by_module: dict[str, list[dict[str, str]]],
    module_name: str,
    declaration_name: str,
) -> dict[str, str] | None:
    rows = rows_by_module.get(module_name, [])
    if not rows:
        return None
    exact = [row for row in rows if row["fq_name"] == f"{module_name}.{declaration_name}"]
    if len(exact) == 1:
        return exact[0]
    suffix = [row for row in rows if row["fq_name"].endswith(f".{declaration_name}")]
    if len(suffix) == 1:
        return suffix[0]
    bare = [row for row in rows if row["fq_name"].split(".")[-1] == declaration_name]
    if len(bare) == 1:
        return bare[0]
    if exact:
        return exact[0]
    if suffix:
        return suffix[0]
    if bare:
        return bare[0]
    return None


def predicate_logic_fields(
    module_name: str,
    declaration_name: str,
    fallback: str,
    signature_lean: str,
) -> tuple[str, str]:
    row = compiled_row_for(COMPILED_ROWS, module_name, declaration_name)
    if row is None:
        fallback_clean = normalize_text_block(fallback)
        return (
            fallback_clean,
            f"{fallback_clean} (source fallback; no compiled unfold data available)",
        )
    predicate = normalize_text_block(
        PROOFS_TODO.humanize_compiled_logic(row.get("pretty_type_uncurried", "") or fallback)
    )
    unfolded_raw = row.get("pretty_type_unfolded", "") or predicate
    if row.get("unfold_status") not in {"ok", "fallback"}:
        return (
            predicate,
            f"{predicate} (compiled unfold unavailable; showing predicate logic)",
        )
    compiled_row = PROOFS_TODO.CompiledTheorem(
        fq_name=row.get("fq_name", f"{module_name}.{declaration_name}"),
        module=row.get("module", module_name),
        kind=row.get("kind", "theorem").strip() or "theorem",
        uses_sorry=(row.get("uses_sorry", "").strip().lower() == "true"),
        pretty_type_uncurried=row.get("pretty_type_uncurried", ""),
        pretty_type_unfolded=unfolded_raw,
        unfold_status=row.get("unfold_status", ""),
    )
    predicate_unfolded = normalize_text_block(
        PROOFS_TODO.render_unfolded_statement(signature_lean, compiled_row, predicate)
    )
    return predicate, predicate_unfolded


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
    def indent_block(text: str, prefix: str = "  ") -> str:
        return "\n".join(f"{prefix}{line}" if line else prefix.rstrip() for line in text.splitlines())

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
        "Predicate logic:\n\n"
        f"{indent_block(entry.predicate_logic)}\n\n"
        "Predicate logic (unfolded):\n\n"
        f"{indent_block(entry.predicate_logic_unfolded)}\n\n"
        "Logical form (Lean):\n\n"
        "```lean\n"
        f"{entry.formal_statement}\n"
        "```\n\n"
        "Type-theoretic form:\n\n"
        f"{type_form}\n\n"
        "Proof use:\n\n"
        f"{proof_use}\n\n"
        "After unfold / common proof state:\n\n"
        f"{after_unfold}\n\n"
        "Common confusions:\n\n"
        f"{confusions}\n\n"
        f"Related proof moves: {moves}\n\n"
        "-/"
    )


def first_doc_sentence(existing_doc: str) -> str:
    body = existing_doc.strip()
    if not body:
        return ""
    for marker in (
        "Predicate logic:",
        "Predicate logic (unfolded):",
        "Logical form (Lean):",
        "Logical form:",
        "Type-theoretic form:",
    ):
        body = body.split(marker, 1)[0].strip()
    before_logical = body
    return " ".join(line.strip() for line in before_logical.splitlines()).strip()


def entry_for(path: Path, declaration: Any) -> HoverCommentEntry:
    text = path.read_text(encoding="utf-8")
    existing_doc = ""
    if declaration.doc is not None:
        existing_doc = clean_doc(text[declaration.doc.start : declaration.doc.end])
        if looks_generated_hover_doc(existing_doc):
            existing_doc = ""
    formal_statement = HOVER.logical_form(declaration)
    source_theorem = source_theorem_for(path, declaration)
    predicate_logic, predicate_logic_unfolded = predicate_logic_fields(
        module_name_for_path(path),
        declaration.name,
        formal_statement,
        PROOFS_TODO.theorem_environment_signature(source_theorem)
        if source_theorem is not None
        else formal_statement,
    )
    if source_theorem is not None and declaration.kind in {"theorem", "lemma", "proposition", "corollary", "axiom"}:
        transliterated = normalize_text_block(source_theorem.transliterated_theorem)
        if transliterated:
            predicate_logic = transliterated
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
        predicate_logic=predicate_logic,
        predicate_logic_unfolded=predicate_logic_unfolded,
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
        for entry in data.get("declarations", []):
            previous[entry.get("id", f"{entry['file']}:{entry['line']}:{entry['name']}")] = entry
            previous[stable_entry_key(entry["file"], entry["name"])] = entry

    entries: list[HoverCommentEntry] = []
    for path in lean_files(args.root):
        text = path.read_text(encoding="utf-8")
        for declaration in HOVER.declarations_in(text):
            entry = entry_for(path, declaration)
            old = previous.get(entry.id) or previous.get(stable_entry_key(entry.file, entry.name))
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
                    if key == "meaning" and looks_generated_meaning(old.get(key, "")):
                        continue
                    if old.get(key):
                        setattr(entry, key, old[key])
                entry.generated_comment = comment_template(entry)
            entries.append(entry)

    payload = {
        "schema_version": 1,
        "comment_template": [
            "Meaning",
            "Predicate logic",
            "Predicate logic (unfolded)",
            "Logical form (Lean)",
            "Type-theoretic form",
            "Proof use",
            "After unfold / common proof state",
            "Common confusions",
            "Related proof moves",
        ],
        "declarations": [asdict(entry) for entry in entries],
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(
        json.dumps(payload, indent=2, ensure_ascii=False) + "\n",
        encoding="utf-8",
        newline="\n",
    )
    print(f"Wrote {len(entries)} declaration entries to {repo_relative(args.output)}.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
