#!/usr/bin/env python3
"""Audit and populate hover documentation for public LRA declarations.

Lean only places `/-- ... -/` documentation comments in editor hover text.  This
checker covers production modules under `LRA/` and also enforces the governed
`Logical form:` fenced Lean block.  With `--fix`, existing prose is preserved;
only the missing logical-form section or a complete missing doc comment is
inserted.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
from pathlib import Path
import re
import sys


DECLARATION_RE = re.compile(
    r"^(?P<attributes>(?:@\[[^\n]*?\]\s*)*)"
    r"(?P<modifiers>(?:(?:protected|noncomputable|unsafe|partial)\s+)*)"
    r"(?P<private>private\s+)?"
    r"(?P<kind>theorem|lemma|corollary|def|abbrev|structure|class(?:\s+abbrev)?|"
    r"inductive|axiom|opaque)\s+"
    r"(?P<name>[^\s(:{\[]+)"
)


@dataclass(frozen=True)
class CommentSpan:
    start: int
    end: int
    is_doc: bool


@dataclass(frozen=True)
class Declaration:
    start: int
    end: int
    line: int
    kind: str
    name: str
    source: str
    doc: CommentSpan | None


def mask_comments(text: str) -> tuple[str, list[CommentSpan]]:
    """Replace comments with spaces while retaining offsets and line breaks."""
    masked = list(text)
    spans: list[CommentSpan] = []
    depth = 0
    outer_start = 0
    outer_is_doc = False
    index = 0
    in_string = False

    while index < len(text):
        if depth:
            if text.startswith("/-", index):
                depth += 1
                masked[index : index + 2] = "  "
                index += 2
            elif text.startswith("-/", index):
                depth -= 1
                masked[index : index + 2] = "  "
                index += 2
                if depth == 0:
                    spans.append(CommentSpan(outer_start, index, outer_is_doc))
            else:
                if text[index] != "\n":
                    masked[index] = " "
                index += 1
            continue

        if in_string:
            if text[index] == "\\" and index + 1 < len(text):
                index += 2
            else:
                if text[index] == '"':
                    in_string = False
                index += 1
            continue

        if text.startswith("--", index):
            line_end = text.find("\n", index)
            if line_end < 0:
                line_end = len(text)
            for cursor in range(index, line_end):
                masked[cursor] = " "
            index = line_end
        elif text.startswith("/-", index):
            depth = 1
            outer_start = index
            outer_is_doc = text.startswith("/--", index) and not text.startswith("/-!", index)
            masked[index : index + 2] = "  "
            index += 2
        elif text[index] == '"':
            in_string = True
            index += 1
        else:
            index += 1

    return "".join(masked), spans


def only_attributes_and_space(fragment: str) -> bool:
    """Whether a doc comment is immediately attached to a declaration."""
    cursor = 0
    while cursor < len(fragment):
        whitespace = re.match(r"\s+", fragment[cursor:])
        if whitespace:
            cursor += whitespace.end()
            continue
        if fragment.startswith("@[", cursor):
            depth = 1
            cursor += 2
            while cursor < len(fragment) and depth:
                if fragment[cursor] == "[":
                    depth += 1
                elif fragment[cursor] == "]":
                    depth -= 1
                cursor += 1
            if depth:
                return False
            continue
        return False
    return True


def declarations_in(text: str) -> list[Declaration]:
    masked, comment_spans = mask_comments(text)
    line_starts = [0]
    line_starts.extend(match.end() for match in re.finditer(r"\n", text))
    candidates: list[tuple[int, int, re.Match[str]]] = []

    for line_number, start in enumerate(line_starts, start=1):
        line_end = masked.find("\n", start)
        if line_end < 0:
            line_end = len(masked)
        # Public commands in this repository are intentionally column-zero.
        line = masked[start:line_end]
        match = DECLARATION_RE.match(line)
        if match and not match.group("private"):
            candidates.append((start, line_number, match))

    declarations: list[Declaration] = []
    for candidate_index, (start, line_number, match) in enumerate(candidates):
        next_start = candidates[candidate_index + 1][0] if candidate_index + 1 < len(candidates) else len(text)
        # Stop at the first later column-zero command/comment. Continuation lines
        # in the project style are indented, including constructors and fields.
        end = next_start
        search = start + len(text[start:].split("\n", 1)[0])
        while search < next_start:
            if text[search : search + 1] == "\n":
                following = search + 1
                if following < next_start and not text[following].isspace():
                    end = following
                    break
            search += 1
        source = text[start:end].rstrip()

        doc = None
        for span in reversed(comment_spans):
            if span.end > start:
                continue
            if span.is_doc and only_attributes_and_space(text[span.end:start]):
                doc = span
            break

        declarations.append(
            Declaration(
                start=start,
                end=end,
                line=line_number,
                kind=match.group("kind"),
                name=match.group("name"),
                source=source,
                doc=doc,
            )
        )
    return declarations


def split_pascal_or_snake(name: str) -> str:
    final_name = name.split(".")[-1].strip("_`)('")
    spaced = final_name.replace("_", " ")
    spaced = re.sub(r"(?<=[a-z0-9])(?=[A-Z])", " ", spaced)
    spaced = re.sub(r"(?<=[A-Z])(?=[A-Z][a-z])", " ", spaced)
    return spaced[:1].upper() + spaced[1:] if spaced else "This declaration"


def prose_for(declaration: Declaration) -> str:
    readable = split_pascal_or_snake(declaration.name)
    display_name = declaration.name.strip("`")
    if declaration.kind in {"theorem", "lemma", "corollary"}:
        return f"`{display_name}` states {readable.lower()}."
    if declaration.kind == "axiom":
        return f"`{display_name}` asserts {readable.lower()}."
    if declaration.kind == "structure":
        return f"`{display_name}` packages the data and laws for {readable.lower()}."
    if declaration.kind.startswith("class"):
        return f"`{display_name}` packages the class contract for {readable.lower()}."
    if declaration.kind == "inductive":
        return f"`{display_name}` is generated by the displayed constructors for {readable.lower()}."
    if declaration.kind == "abbrev":
        return f"`{display_name}` abbreviates the displayed type or object for {readable.lower()}."
    return f"`{display_name}` defines the displayed object for {readable.lower()}."


def strip_leading_attributes(source: str) -> str:
    return re.sub(r"^(?:@\[[^\n]*?\]\s*)+", "", source).lstrip()


def find_assignment(source: str, *, last: bool = False) -> int | None:
    """Find an outer `:=`, ignoring strings and comments.

    The final outer assignment is the proof delimiter for theorem-like
    declarations whose proposition contains a local `let` or `letI` binding.
    Definition-like declarations still use the first outer assignment.
    """
    depth = 0
    comment_depth = 0
    in_string = False
    index = 0
    assignments: list[int] = []
    while index + 1 < len(source):
        if comment_depth:
            if source.startswith("/-", index):
                comment_depth += 1
                index += 2
            elif source.startswith("-/", index):
                comment_depth -= 1
                index += 2
            else:
                index += 1
            continue
        if in_string:
            if source[index] == "\\":
                index += 2
            else:
                if source[index] == '"':
                    in_string = False
                index += 1
            continue
        if source.startswith("/-", index):
            comment_depth = 1
            index += 2
        elif source.startswith("--", index):
            newline = source.find("\n", index)
            index = len(source) if newline < 0 else newline
        elif source[index] == '"':
            in_string = True
            index += 1
        elif source[index] in "([{":
            depth += 1
            index += 1
        elif source[index] in ")]}":
            depth = max(0, depth - 1)
            index += 1
        elif depth == 0 and source.startswith(":=", index):
            assignments.append(index)
            index += 2
        else:
            index += 1
    if not assignments:
        return None
    return assignments[-1] if last else assignments[0]


def logical_form(declaration: Declaration) -> str:
    source = strip_leading_attributes(declaration.source).rstrip()
    theorem_like = declaration.kind in {"theorem", "lemma", "corollary", "axiom"}
    assignment = find_assignment(source, last=theorem_like)
    is_prop_definition = bool(re.search(r":\s*Prop\s*:=", source, flags=re.DOTALL))

    if assignment is not None and theorem_like:
        source = source[:assignment].rstrip()
    elif assignment is not None and not is_prop_definition:
        rhs = source[assignment + 2 :].lstrip()
        # Short transparent equations are useful hover content.  Large
        # implementations and tactic bodies are represented by their contract.
        if rhs.startswith("by") or source.count("\n") > 12:
            source = source[:assignment].rstrip()

    return source


def has_logical_form(text: str, span: CommentSpan) -> bool:
    comment = text[span.start:span.end]
    return "Logical form:" in comment and "```lean" in comment


def logical_section(declaration: Declaration) -> str:
    return "\n\nLogical form:\n\n```lean\n" + logical_form(declaration) + "\n```\n"


def fix_file(path: Path) -> tuple[int, int]:
    text = path.read_text(encoding="utf-8")
    # Also repair spacing left by an earlier expansion of `/-- prose. -/`.
    cleaned_text = re.sub(r"[ \t]+\n\nLogical form:", "\n\nLogical form:", text)
    spacing_changed = cleaned_text != text
    text = cleaned_text
    declarations = declarations_in(text)
    missing_doc = 0
    missing_logical = 0
    edits: list[tuple[int, int, str]] = []

    for declaration in declarations:
        if declaration.doc is None:
            missing_doc += 1
            comment = (
                "/--\n"
                + prose_for(declaration)
                + logical_section(declaration)
                + "-/\n"
            )
            edits.append((declaration.start, declaration.start, comment))
        elif not has_logical_form(text, declaration.doc):
            missing_logical += 1
            closing = declaration.doc.end - 2
            insertion = closing
            # Many concise comments use `/-- prose. -/`.  Consume the space
            # before the closing delimiter so adding a block does not create
            # trailing whitespace on the prose line.
            while insertion > declaration.doc.start and text[insertion - 1] in " \t":
                insertion -= 1
            edits.append((insertion, closing, logical_section(declaration)))

    for start, end, replacement in sorted(edits, reverse=True):
        text = text[:start] + replacement + text[end:]
    if edits or spacing_changed:
        path.write_text(text, encoding="utf-8", newline="\n")
    return missing_doc, missing_logical


def audit_file(path: Path) -> tuple[list[Declaration], list[Declaration]]:
    text = path.read_text(encoding="utf-8")
    missing_doc: list[Declaration] = []
    missing_logical: list[Declaration] = []
    for declaration in declarations_in(text):
        if declaration.doc is None:
            missing_doc.append(declaration)
        elif not has_logical_form(text, declaration.doc):
            missing_logical.append(declaration)
    return missing_doc, missing_logical


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, default=Path("LRA"))
    parser.add_argument("--fix", action="store_true")
    args = parser.parse_args()

    paths = sorted(args.root.rglob("*.lean")) if args.root.is_dir() else [args.root]
    if args.fix:
        fixed_docs = fixed_forms = 0
        for path in paths:
            docs, forms = fix_file(path)
            fixed_docs += docs
            fixed_forms += forms
        print(f"Inserted {fixed_docs} doc comments and {fixed_forms} logical-form sections.")

    all_missing_docs: list[tuple[Path, Declaration]] = []
    all_missing_forms: list[tuple[Path, Declaration]] = []
    declaration_count = 0
    for path in paths:
        text = path.read_text(encoding="utf-8")
        declarations = declarations_in(text)
        declaration_count += len(declarations)
        missing_docs, missing_forms = audit_file(path)
        all_missing_docs.extend((path, declaration) for declaration in missing_docs)
        all_missing_forms.extend((path, declaration) for declaration in missing_forms)

    for path, declaration in all_missing_docs:
        print(f"{path}:{declaration.line}: {declaration.kind} {declaration.name}: missing doc comment")
    for path, declaration in all_missing_forms:
        print(f"{path}:{declaration.line}: {declaration.kind} {declaration.name}: missing Logical form")

    missing_count = len(all_missing_docs) + len(all_missing_forms)
    print(
        f"Checked {declaration_count} public declarations in {len(paths)} Lean files; "
        f"{missing_count} hover-documentation issue(s)."
    )
    return 1 if missing_count else 0


if __name__ == "__main__":
    sys.exit(main())
