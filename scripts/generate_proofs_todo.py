#!/usr/bin/env python3
"""Generate LRA/<Folder>/ProofsToDo.md for every audited folder under LRA/
and a global LRA/ProofsToDo.md.

Audited folders are every immediate subdirectory of ``LRA/`` except
``Pilot`` and any folder whose name starts with ``Volume``.

Pipeline
--------

    lake env lean --run scripts/DumpProofsToDo.lean   # writes build/proofs-todo-environment.tsv
    python3 scripts/generate_proofs_todo.py            # writes LRA/<Folder>/ProofsToDo.md and LRA/ProofsToDo.md

Each entry gets seven fields:

* ``Name`` -- as written in source (dot-notation declarations, e.g.
  ``theorem Foo.bar``, keep their prefix). An *anonymous* ``instance``
  (``instance : SomeClass T := ...``, no name in source at all) shows
  whatever name Lean's compiler synthesized for it, since there is no
  written name to show instead.
* ``Kind`` -- ``Theorem`` or ``Instance``. Most entries are ``theorem``s and
  ``lemma``s; this repository's algebraic "laws" pattern (a
  ``class``/``class abbrev`` bundling ``Prop``-valued fields, e.g.
  ``AdditiveIdentityLaws``) also expresses proof obligations as
  ``Prop``-valued ``instance`` declarations, which are genuine proofs (they
  can contain ``sorry`` just like a theorem) even though they are also
  registered for typeclass search. The Lean dumper decides ``Kind``
  authoritatively, via `Meta.isInstance` plus `Meta.isProp` on the
  declaration's type -- see `isInstanceLaw` in
  `scripts/DumpProofsToDo.lean`.
* ``State`` -- ``Completed`` or ``Sorry``. The Lean dumper is authoritative:
  a theorem is ``Sorry`` iff its *compiled* proof term contains ``sorryAx``
  at any depth, which cannot be spoofed by the word "sorry" appearing in a
  comment or string, unlike a text grep.
* ``Predicate logic`` -- a symbolic, at-a-glance statement (``∀``, ``∃``,
  ``→``, ``∧``, ``∈``, ...) using the theorem's own real binder and
  hypothesis names, never renamed to generic placeholders, with chained
  hypotheses uncurried into a conjunction (``A → B → C`` reads as
  ``(A ∧ B) → C``). The Lean dumper is authoritative here: Lean's own
  elaborator-aware pretty printer (`Meta.ppExpr`) on a version of the type
  that `scripts/DumpProofsToDo.lean`'s `uncurryHypotheses` has already
  uncurried, so implicit arguments are resolved and notation renders
  exactly as Lean displays it. Falls back to a mechanical, conservative
  rewrite of the raw source signature when the Lean dumper has nothing for
  a given row (offline preview, or a single declaration Lean's pretty
  printer choked on) -- see `render_predicate_logic_from_signature` and
  `uncurry_arrows`.
* ``Predicate logic (unfolded)`` -- the same, but with a curated allow-list
  of custom definitions (`unfoldAllowList` in the Lean dumper) recursively
  delta-unfolded first, so e.g. a hypothesis using `BddAbove S` shows its
  actual `∃ M, ∀ x, x ∈ S → x ≤ M` body instead of the predicate's name.
  Falls back to the uncurried field, clearly labelled as such, when offline
  or when the Lean dumper's unfold step itself errored for that row.
* ``Transliterated theorem`` -- a lightweight mathematical normalization of
  the source signature. It keeps the theorem-shaped data already present,
  but suppresses Lean infrastructure binders/classes, renames ordinary set
  variables to `A`, `B`, ... and turns named hypotheses into implication
  antecedents. This is intentionally deterministic and conservative: it is
  not prose, just a more mathematician-facing formula.
* ``Logical form (Lean)`` -- the declaration's own signature, verbatim, in
  Lean's own surface syntax. This deliberately mirrors the ``Logical form:``
  fenced block that this repo's own ``scripts/check-hover-docs.py`` already
  requires in hover-doc comments -- same idea, same content in spirit -- so
  it can be reused as a starting point when a hover doc is later written for
  a declaration that does not have one yet.

This script (not the Lean dumper) is authoritative for: source line numbers
(used only to order theorems *within* a file -- Lean forbids forward
references, so source order is always a valid local topological order), the
intra-folder import graph (used to topologically order files, so every
proof can be worked in list order without a forward dependency), the raw
``Logical form (Lean)`` text, and Markdown rendering.

Use ``--check`` to verify the checked-in files are up to date without
writing (mirrors ``scripts/generate_proof_order.py --check``).

Use ``--offline`` to preview the checklist without a Lean build: state and
both predicate-logic fields are then reconstructed from source text alone
("Unknown (offline preview)" for state; no definition-unfolding is possible
without Lean) rather than from the compiled environment. Every file
produced this way says so in its header. This is a convenience for
iterating on layout; it is never a substitute for running the real
generator before committing.
"""

from __future__ import annotations

import argparse
import csv
import os
import re
import subprocess
import sys
import textwrap
from collections import defaultdict, deque
from dataclasses import dataclass, field
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parents[1]
LRA_ROOT = REPO_ROOT / "LRA"
DEFAULT_TSV_PATH = REPO_ROOT / "build" / "proofs-todo-environment.tsv"

EXCLUDED_EXACT = {"Pilot"}
EXCLUDED_PREFIX = "Volume"

PROOF_KEYWORDS = ("theorem", "lemma", "proposition", "corollary")
INSTANCE_KEYWORD = "instance"
AXIOM_KEYWORD = "axiom"
ALL_KEYWORDS = PROOF_KEYWORDS + (INSTANCE_KEYWORD, AXIOM_KEYWORD)

# The keyword itself is captured (group 1) so `scan_source_module` can tell a
# `theorem`/`lemma`/... declaration apart from an `instance` declaration --
# see `SourceTheorem.kind`. An *anonymous* instance (`instance : C T := ...`,
# no name at all -- legal Lean, common in this repo's "laws" pattern) simply
# does not match this regex, since the name group is mandatory: it is picked
# up later from the TSV alone, via the same "reported by the Lean dumper but
# not found by source scan" fallback already used for any unmatched row.
DECL_RE = re.compile(
    r"(?m)^[ \t]*(?:@\[[^\]]*\]\s*)*"
    r"(?:(?:private|protected|noncomputable|unsafe)\s+)*"
    r"(" + "|".join(ALL_KEYWORDS) + r")\s+"
    r"(?:«([^»]+)»|([A-Za-z_][\w'.]*))"
)

BRACKET_OPEN = "([{⟨⦃"
BRACKET_CLOSE = ")]}⟩⦄"
CLOSE_OF_OPEN = dict(zip(BRACKET_OPEN, BRACKET_CLOSE))


# ---------------------------------------------------------------------------
# Comment masking (same technique as scripts/generate_proof_order.py, so
# nested block comments and line comments never confuse the declaration
# scanner). Character offsets and line breaks are preserved.
# ---------------------------------------------------------------------------


def mask_comments(source: str) -> str:
    chars = list(source)
    i = 0
    block_depth = 0
    while i < len(chars):
        if block_depth == 0 and source.startswith("--", i):
            end = source.find("\n", i)
            if end == -1:
                end = len(chars)
            for j in range(i, end):
                chars[j] = " "
            i = end
        elif source.startswith("/-", i):
            block_depth += 1
            chars[i] = chars[i + 1] = " "
            i += 2
        elif block_depth and source.startswith("-/", i):
            block_depth -= 1
            chars[i] = chars[i + 1] = " "
            i += 2
        elif block_depth:
            if chars[i] not in "\r\n":
                chars[i] = " "
            i += 1
        else:
            i += 1
    return "".join(chars)


def top_level_occurrences(text: str, token: str) -> list[int]:
    """Byte offsets of `token` outside any bracket nesting."""
    depth = 0
    results = []
    i, n = 0, len(text)
    while i < n:
        ch = text[i]
        if ch in BRACKET_OPEN:
            depth += 1
        elif ch in BRACKET_CLOSE:
            depth = max(0, depth - 1)
        if depth == 0 and text.startswith(token, i):
            results.append(i)
            i += len(token)
            continue
        i += 1
    return results


def first_top_level_colon(text: str) -> int | None:
    """Position of the first depth-0 `:` that is not part of `::` or `:=`.

    Leading binder groups in a Lean declaration signature are always
    bracket-wrapped (`(x : T)`, `{x : T}`, `[Inst]`, `⦃x : T⦄`) -- Lean does
    not allow a bare unparenthesized binder before the return type -- so any
    `:` strictly between two binder groups is necessarily nested inside one
    of those brackets (depth > 0). The *first* depth-0 colon is therefore
    always exactly the "binders end, return type begins" marker. Anything
    after it may itself contain further depth-0 colons (e.g. a return type
    that is itself a `∀ x : T, ...`), which must NOT be treated as another
    split point -- hence first, not last.
    """
    depth = 0
    i, n = 0, len(text)
    while i < n:
        ch = text[i]
        if ch in BRACKET_OPEN:
            depth += 1
        elif ch in BRACKET_CLOSE:
            depth = max(0, depth - 1)
        elif ch == ":" and depth == 0:
            prev_colon = i > 0 and text[i - 1] == ":"
            next_colon = i + 1 < n and text[i + 1] == ":"
            if not prev_colon and not next_colon:
                return i
        i += 1
    return None


def extract_signature(declaration_text: str, matched_name_end: int) -> str:
    """The declaration's own signature, verbatim: everything between its name
    and the first depth-0 `:=` (start of the proof), whitespace-collapsed to
    one line.

    This is deliberately the *raw* Lean text -- no ∀-rewriting -- so it is
    interchangeable with this repo's own governed hover-doc convention
    (`scripts/check-hover-docs.py`'s `Logical form:` fenced block, which is
    likewise "the declaration up to its proof", verbatim). It intentionally
    does not replicate that script's `last`-occurrence rule for theorem-like
    declarations (meant to skip past a `let`/`letI` embedded in the
    *proposition* itself): testing against every folder in this repository
    found no such case, while a proof with an ordinary `have h := e` or
    `let x := e` tactic step -- common -- would make a last-occurrence rule
    swallow most of the proof body instead of stopping at the signature.
    First depth-0 `:=` is simpler and held up across the whole corpus.
    """
    rest = declaration_text[matched_name_end:]
    assigns = top_level_occurrences(rest, ":=")
    signature = rest[: assigns[0]] if assigns else rest
    return re.sub(r"\s+", " ", signature).strip()


def uncurry_arrows(conclusion: str) -> str:
    """Best-effort ``(P ∧ Q) → R`` grouping of a *flat* top-level arrow chain.

    This is the fallback-path counterpart of `scripts/DumpProofsToDo.lean`'s
    `uncurryHypotheses`, which does the same thing correctly by walking real
    `Expr` structure with proper binder scoping. Text has no such scoping,
    so this is deliberately conservative: it only fires when `conclusion`
    contains no top-level `∀`/`∃`/`,` at all -- i.e. no further nested
    quantifier whose own body might itself start with an unrelated arrow
    chain. Without that guard, `∀ A, P A → Q A → R A` would wrongly become
    `(∀ A, P A ∧ Q A) → R A` instead of the intended `∀ A, (P A ∧ Q A) → R
    A` -- a different statement, not just a different rendering. Skipping
    is safer than guessing; this only ever improves a flat chain like
    `P → Q → R` with nothing left to get wrong.
    """
    if any(top_level_occurrences(conclusion, tok) for tok in ("∀", "∃", ",")):
        return conclusion
    arrows = top_level_occurrences(conclusion, "→")
    if len(arrows) < 2:
        return conclusion
    segments = []
    start = 0
    for pos in arrows:
        segments.append(conclusion[start:pos].strip())
        start = pos + len("→")
    segments.append(conclusion[start:].strip())
    premises, final = segments[:-1], segments[-1]
    return f"({' ∧ '.join(premises)}) → {final}"


def render_predicate_logic_from_signature(signature: str) -> str:
    """Best-effort ``∀ (binders), (P ∧ Q) → R`` rendering of a raw signature.

    Only used as a fallback: when the Lean dumper did not report a
    pretty-printed type for a declaration (offline preview, or a single
    declaration Lean's pretty printer choked on). Splits on the first
    depth-0 `:` (binders end, return type begins -- see
    `first_top_level_colon`) and prefixes a `∀` over the binder groups, so a
    signature written as `(x : T) (h : P x) : Q x` reads as
    `∀ (x : T) (h : P x), Q x` instead of restating the declaration syntax;
    `uncurry_arrows` then groups a flat hypothesis-arrow-chain in the
    conclusion into a conjunction where it can do so safely.
    """
    colon = first_top_level_colon(signature)
    if colon is None:
        return uncurry_arrows(signature)
    binders = signature[:colon].strip()
    conclusion = uncurry_arrows(signature[colon + 1 :].strip())
    if binders:
        return f"∀ {binders}, {conclusion}"
    return conclusion


def has_compiled_surface_leak(value: str) -> bool:
    """True when Lean's standalone pretty-printer exposed elaborated internals.

    The environment dump is still authoritative for `uses_sorry` and for the
    unfolded structure, but these strings are poor human-facing checklist text
    when they contain instance dictionary projections such as `inst.mem` or
    raw core connectives such as `And`/`Not`.
    """
    return bool(
        re.search(
            r"\b(?:And|Not|Eq|Iff)\b|(?:^|[\s(])inst(?:_\d+)?\.(?:mem|sdiff|union|inter|subset)",
            value,
        )
    )


def choose_predicate_logic(row: CompiledTheorem, source: SourceTheorem) -> str:
    """Prefer source syntax when compiled pretty-printing leaks internals."""
    compiled = row.pretty_type_uncurried.strip()
    if not compiled or has_compiled_surface_leak(compiled):
        return source.predicate_logic_fallback
    return compiled


def matching_paren(text: str, start: int) -> int | None:
    depth = 0
    for index in range(start, len(text)):
        if text[index] == "(":
            depth += 1
        elif text[index] == ")":
            depth -= 1
            if depth == 0:
                return index
    return None


def split_compiled_arg(text: str) -> tuple[str, str] | None:
    text = text.lstrip()
    if not text:
        return None
    if text[0] == "(":
        end = matching_paren(text, 0)
        if end is None:
            return None
        return text[1:end], text[end + 1 :]
    depth = 0
    for index, char in enumerate(text):
        if char in BRACKET_OPEN:
            depth += 1
        elif char in BRACKET_CLOSE:
            depth = max(0, depth - 1)
        elif depth == 0 and char.isspace():
            return text[:index], text[index + 1 :]
    return text, ""


def compiled_atom_to_notation(name: str, args: list[str]) -> str | None:
    def wrap_if_compound(expr: str) -> str:
        expr = expr.strip()
        if expr.startswith("(") and expr.endswith(")"):
            return expr
        if any(token in expr for token in ("∀", "∃", "→", "↔", "∧", "∨")):
            return f"({expr})"
        return expr

    rendered = [humanize_compiled_logic(arg) for arg in args]
    if name == "And" and len(rendered) == 2:
        return f"({wrap_if_compound(rendered[0])} ∧ {wrap_if_compound(rendered[1])})"
    if name == "Not" and len(rendered) == 1:
        return f"¬ {rendered[0]}"
    if name == "Eq" and len(rendered) == 2:
        return f"{rendered[0]} = {rendered[1]}"
    if name == "Iff" and len(rendered) == 2:
        return f"{rendered[0]} ↔ {rendered[1]}"
    if re.fullmatch(r"(?:inst(?:_\d+)?|[A-Za-z0-9_.]+toLE)\.1", name) and len(rendered) == 2:
        return f"{rendered[0]} ≤ {rendered[1]}"
    if re.fullmatch(r"[A-Za-z0-9_.]+toLT\.1", name) and len(rendered) == 2:
        return f"{rendered[0]} < {rendered[1]}"
    if re.fullmatch(r"(?:Set\.)?instMembership(?:\.(?:1|mem))?", name) and len(rendered) == 2:
        return f"{rendered[1]} ∈ {rendered[0]}"
    if re.fullmatch(r"inst(?:_\d+)?\.mem", name) and len(rendered) == 2:
        return f"{rendered[1]} ∈ {rendered[0]}"
    if re.fullmatch(r"(?:Set\.)?instSDiff(?:\.(?:1|sdiff))?", name) and len(rendered) == 2:
        return f"{rendered[0]} \\ {rendered[1]}"
    if re.fullmatch(r"inst(?:_\d+)?\.sdiff", name) and len(rendered) == 2:
        return f"{rendered[0]} \\ {rendered[1]}"
    if re.fullmatch(r"(?:Set\.)?instUnion(?:\.(?:1|union))?", name) and len(rendered) == 2:
        return f"{rendered[0]} ∪ {rendered[1]}"
    if re.fullmatch(r"inst(?:_\d+)?\.union", name) and len(rendered) == 2:
        return f"{rendered[0]} ∪ {rendered[1]}"
    if re.fullmatch(r"(?:Set\.)?instInter(?:\.(?:1|inter))?", name) and len(rendered) == 2:
        return f"{rendered[0]} ∩ {rendered[1]}"
    if re.fullmatch(r"inst(?:_\d+)?\.inter", name) and len(rendered) == 2:
        return f"{rendered[0]} ∩ {rendered[1]}"
    return None


def rewrite_compiled_prefix_at(text: str, start: int) -> tuple[str, int] | None:
    match = re.match(
        r"(And|Not|Eq|Iff|(?:inst(?:_\d+)?|[A-Za-z0-9_.]+toLE)\.1|[A-Za-z0-9_.]+toLT\.1|"
        r"(?:Set\.)?instMembership(?:\.(?:1|mem))?|inst(?:_\d+)?\.mem|"
        r"(?:Set\.)?instSDiff(?:\.(?:1|sdiff))?|inst(?:_\d+)?\.sdiff|"
        r"(?:Set\.)?instUnion(?:\.(?:1|union))?|inst(?:_\d+)?\.union|"
        r"(?:Set\.)?instInter(?:\.(?:1|inter))?|inst(?:_\d+)?\.inter)\b",
        text[start:],
    )
    if not match:
        return None
    name = match.group(1)
    arity = 1 if name == "Not" else 2
    rest_start = start + len(name)
    args = []
    rest = text[rest_start:]
    for _ in range(arity):
        split = split_compiled_arg(rest)
        if split is None:
            return None
        arg, rest = split
        args.append(arg)
    rendered = compiled_atom_to_notation(name, args)
    if rendered is None:
        return None
    consumed = len(text) - len(rest)
    return rendered, consumed


def humanize_compiled_logic(value: str) -> str:
    """Best-effort cleanup for standalone Lean pretty-printer internals."""
    result = value
    for _ in range(8):
        changed = False
        output: list[str] = []
        index = 0
        while index < len(result):
            rewrite = rewrite_compiled_prefix_at(result, index)
            if rewrite is not None:
                rendered, consumed = rewrite
                output.append(rendered)
                index = consumed
                changed = True
            else:
                output.append(result[index])
                index += 1
        result = "".join(output)
        if not changed:
            break
    result = re.sub(r"\s*→\s*", " → ", result)
    result = re.sub(r"\s*↔\s*", " ↔ ", result)
    result = re.sub(r"\s*∧\s*", " ∧ ", result)
    result = re.sub(r"\s+", " ", result)
    return result.strip()


# ---------------------------------------------------------------------------
# Mathematical transliteration
# ---------------------------------------------------------------------------


@dataclass
class BinderGroup:
    opener: str
    content: str


@dataclass
class FormalEnvironment:
    ambient_types: list[str]
    ambient_symbols: list[str]
    objects: list[str]
    hypotheses: list[str]


@dataclass
class StructuredStatement:
    ambient: str
    objects: list[str]
    prove: str


def split_binder_groups(text: str) -> list[BinderGroup]:
    groups: list[BinderGroup] = []
    index = 0
    while index < len(text):
        while index < len(text) and text[index].isspace():
            index += 1
        if index >= len(text) or text[index] not in BRACKET_OPEN:
            break
        opener = text[index]
        closer = CLOSE_OF_OPEN[opener]
        depth = 0
        start = index
        while index < len(text):
            char = text[index]
            if char == opener:
                depth += 1
            elif char == closer:
                depth -= 1
                if depth == 0:
                    groups.append(BinderGroup(opener=opener, content=text[start + 1 : index].strip()))
                    index += 1
                    break
            index += 1
        else:
            break
    return groups


def first_top_level_comma(text: str) -> int | None:
    depth = 0
    for index, char in enumerate(text):
        if char in BRACKET_OPEN:
            depth += 1
        elif char in BRACKET_CLOSE:
            depth = max(0, depth - 1)
        elif char == "," and depth == 0:
            return index
    return None


def normalize_typeclass_expr(content: str) -> str:
    colon = first_top_level_colon(content)
    if colon is not None:
        return content[colon + 1 :].strip()
    return content.strip()


def ambient_symbol_for_typeclass(class_expr: str) -> str | None:
    normalized = class_expr.strip()
    symbol_map = {
        "LE": "≤",
        "LT": "<",
        "Preorder": "≤",
        "PartialOrder": "≤",
        "LinearOrder": "≤",
        "Membership": "∈",
    }
    head = normalized.split(None, 1)[0] if normalized else ""
    return symbol_map.get(head)


def ambient_candidates_from_object_type(binder_type: str) -> list[str]:
    normalized = binder_type.strip()
    candidates: list[str] = []
    direct_types = (
        "ℝ",
        "ℕ",
        "ℤ",
        "ℚ",
        "ℂ",
        "R",
        "N",
        "Z",
        "Q",
        "C",
        "Real",
        "Nat",
        "Int",
        "Rat",
        "Complex",
    )
    if normalized in direct_types:
        candidates.append(normalized)
    set_match = re.fullmatch(r"Set\s+(.+)", normalized)
    if set_match:
        inner = set_match.group(1).strip()
        if inner in direct_types:
            candidates.append(inner)
    for piece in (part.strip() for part in normalized.split("→")):
        if piece in direct_types:
            candidates.append(piece)
    return list(dict.fromkeys(candidates))


def extract_formal_environment(signature: str) -> FormalEnvironment:
    colon = first_top_level_colon(signature)
    binder_text = signature[:colon].strip() if colon is not None else signature.strip()
    groups = split_binder_groups(binder_text)
    ambient_types: list[str] = []
    ambient_symbols: list[str] = []
    objects: list[str] = []
    hypotheses: list[str] = []

    for group in groups:
        if group.opener == "[":
            class_expr = normalize_typeclass_expr(group.content)
            symbol = ambient_symbol_for_typeclass(class_expr)
            if symbol and symbol not in ambient_symbols:
                ambient_symbols.append(symbol)
            continue
        split = split_binder_content(group.content)
        if split is None:
            continue
        names, binder_type = split
        if binder_type.startswith("Type"):
            for name in names:
                if name not in ambient_types:
                    ambient_types.append(name)
            continue
        if group.opener == "(" and is_proposition_shaped(binder_type):
            hypotheses.append(f"{' '.join(names)} : {binder_type}")
            continue
        objects.append(f"{' '.join(names)} : {binder_type}")
        if not ambient_types:
            for candidate in ambient_candidates_from_object_type(binder_type):
                if candidate not in ambient_types:
                    ambient_types.append(candidate)

    return FormalEnvironment(
        ambient_types=ambient_types,
        ambient_symbols=ambient_symbols,
        objects=objects,
        hypotheses=hypotheses,
    )


def format_ambient(environment: FormalEnvironment) -> str:
    pieces = environment.ambient_types + environment.ambient_symbols
    if not pieces:
        return "(implicit ambient)"
    return f"({', '.join(pieces)})"


def strip_forall_prefix(statement: str) -> str:
    text = statement.strip()
    if not text.startswith("∀"):
        return text
    comma = first_top_level_comma(text)
    if comma is None:
        return text
    return text[comma + 1 :].strip()


def render_structured_statement(signature: str, unfolded_body: str) -> StructuredStatement:
    environment = extract_formal_environment(signature)
    return StructuredStatement(
        ambient=format_ambient(environment),
        objects=environment.objects,
        prove=unfolded_body.strip(),
    )


def format_structured_statement(statement: StructuredStatement) -> str:
    lines = [
        "Ambient",
        f"  {statement.ambient}",
        "Objects",
    ]
    if statement.objects:
        lines.extend(f"  {obj}" for obj in statement.objects)
    else:
        lines.append("  (none)")
    lines.extend(
        [
            "Prove",
            f"  {statement.prove}",
        ]
    )
    return "\n".join(lines)


def split_binder_content(content: str) -> tuple[list[str], str] | None:
    colon = first_top_level_colon(content)
    if colon is None:
        return None
    names = [name for name in content[:colon].strip().split() if name]
    binder_type = content[colon + 1 :].strip()
    if not names or not binder_type:
        return None
    return names, binder_type


def transliterated_variable_names(names: list[str], binder_type: str, renames: dict[str, str]) -> list[str]:
    set_names = list("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    element_names = ["x", "y", "z", "w", "a", "b", "c"]
    rendered: list[str] = []
    for name in names:
        if name in renames:
            rendered.append(renames[name])
            continue
        if binder_type == "SetObject":
            used = {value for key, value in renames.items() if key != name}
            replacement = next((candidate for candidate in set_names if candidate not in used), name)
        elif binder_type == "Element":
            used = {value for key, value in renames.items() if key != name}
            replacement = next((candidate for candidate in element_names if candidate not in used), name)
        else:
            replacement = name
        renames[name] = replacement
        rendered.append(replacement)
    return rendered


def is_simple_domain_type(binder_type: str) -> bool:
    return bool(re.fullmatch(r"[A-Za-z][\w'.]*", binder_type))


def is_proposition_shaped(binder_type: str) -> bool:
    normalized = binder_type.strip()
    if re.fullmatch(r".+\s→\s.+", normalized):
        pieces = [piece.strip() for piece in normalized.split("→")]
        if pieces and all(piece and not is_proposition_shaped(piece) for piece in pieces):
            return False
    return bool(
        normalized.startswith(("∀", "∃"))
        or any(token in normalized for token in ("→", "↔", "\\/", "/\\", " = ", " ∈ ", " < ", " ≤ "))
        or re.match(r"(?:Is|Has|No|Non|Exists|Forall)[A-Z]\w*(?:\s|$)", normalized)
    )


def should_preserve_theorem_level_prove(unfolded: str, uncurried_predicate: str) -> bool:
    unfolded_text = unfolded.strip()
    predicate_text = uncurried_predicate.strip()
    if not unfolded_text or not predicate_text:
        return False
    if "↔" in predicate_text and "↔" in unfolded_text:
        return True
    return False


def transliterate_inner_quantifiers(expr: str) -> str:
    result = expr
    for _ in range(4):
        rewritten = re.sub(
            r"∀\s+\(([^():]+)\s*:\s*([^)]+)\)",
            lambda match: f"∀ {match.group(1).strip()} ∈ {match.group(2).strip()}",
            result,
        )
        rewritten = re.sub(
            r"\(([^():]+)\s*:\s*([^)]+)\)",
            lambda match: f"{match.group(1).strip()} ∈ {match.group(2).strip()}",
            rewritten,
        )
        rewritten = re.sub(
            r"∃\s+([^():,]+)\s*:\s*([^,]+),",
            lambda match: f"∃ {match.group(1).strip()} ∈ {match.group(2).strip()},",
            rewritten,
        )
        if rewritten == result:
            break
        result = rewritten
    return result


def transliterate_expr(expr: str, renames: dict[str, str], relation_names: set[str]) -> str:
    result = expr.strip()
    result = result.replace("\\/", "∨").replace("/\\", "∧")
    result = transliterate_inner_quantifiers(result)
    for original, replacement in sorted(renames.items(), key=lambda item: len(item[0]), reverse=True):
        result = re.sub(rf"\b{re.escape(original)}\b", replacement, result)
    for relation in sorted(relation_names, key=len, reverse=True):
        result = re.sub(rf"\bBoundedBelow\s+{re.escape(relation)}\s+(\([^()]*\)|[A-Za-z][\w']*)", r"BoundedBelow(\1)", result)
        result = re.sub(rf"\bBoundedAbove\s+{re.escape(relation)}\s+(\([^()]*\)|[A-Za-z][\w']*)", r"BoundedAbove(\1)", result)
        result = re.sub(rf"\bLeastElement\s+{re.escape(relation)}\s+(\([^()]*\)|[A-Za-z][\w']*)\s+(\([^()]*\)|[A-Za-z][\w']*)", r"LeastElement(\2, \1)", result)
        result = re.sub(rf"\bGreatestElement\s+{re.escape(relation)}\s+(\([^()]*\)|[A-Za-z][\w']*)\s+(\([^()]*\)|[A-Za-z][\w']*)", r"GreatestElement(\2, \1)", result)
    result = re.sub(r"\s+", " ", result)
    result = re.sub(r"\(\s+", "(", result)
    result = re.sub(r"\s+\)", ")", result)
    result = re.sub(r"\b(BoundedBelow|BoundedAbove)\(\(([^()]*)\)\)", r"\1(\2)", result)
    result = re.sub(r"\b(LeastElement|GreatestElement)\(([^(),]+), \(([^()]*)\)\)", r"\1(\2, \3)", result)
    return result.strip()


def transliterate_signature(signature: str) -> str:
    colon = first_top_level_colon(signature)
    if colon is None:
        return signature

    binder_text = signature[:colon].strip()
    conclusion = signature[colon + 1 :].strip()
    groups = split_binder_groups(binder_text)
    renames: dict[str, str] = {}
    relation_names: set[str] = set()
    quantifiers: list[str] = []
    hypotheses: list[str] = []

    for group in groups:
        if group.opener == "[":
            continue
        split = split_binder_content(group.content)
        if split is None:
            continue
        names, binder_type = split
        if binder_type.startswith("Type"):
            continue
        if binder_type == "LRA.Relation.Endorelation Element":
            relation_names.update(names)
            continue
        if binder_type in {"SetObject", "Element"}:
            rendered_names = transliterated_variable_names(names, binder_type, renames)
            domain = "U" if binder_type == "SetObject" else "Element"
            quantifiers.append(f"∀ {' '.join(rendered_names)} ∈ {domain}")
            continue
        if group.opener == "(" and is_simple_domain_type(binder_type):
            rendered_names = transliterated_variable_names(names, binder_type, renames)
            quantifiers.append(f"∀ {' '.join(rendered_names)} ∈ {binder_type}")
            continue
        if len(names) == 1 and group.opener == "(" and is_proposition_shaped(binder_type):
            hypotheses.append(transliterate_expr(binder_type, renames, relation_names))

    rendered_conclusion = transliterate_expr(conclusion, renames, relation_names)
    body = f"({' ∧ '.join(hypotheses)}) → {rendered_conclusion}" if hypotheses else rendered_conclusion
    if quantifiers:
        return f"({' '.join(quantifiers)}), {body}"
    return body


# ---------------------------------------------------------------------------
# Source scanning
# ---------------------------------------------------------------------------


@dataclass
class SourceTheorem:
    name: str
    kind: str  # proof keyword, "instance", or "axiom"
    line: int
    context_signature: str
    signature_lean: str
    body_lean: str
    predicate_logic_fallback: str
    transliterated_theorem: str


@dataclass
class SourceModule:
    module: str
    relative_path: str
    local_imports: tuple[str, ...]
    theorems: tuple[SourceTheorem, ...]


def module_name(path: Path) -> str:
    return ".".join(path.relative_to(REPO_ROOT).with_suffix("").parts)


def module_path(module: str) -> Path:
    return REPO_ROOT / (module.replace(".", "/") + ".lean")


VARIABLE_DECL_RE = re.compile(r"(?m)^[ \t]*variables?\s+([^\n]+)$")


def context_signature_before(source_prefix: str) -> str:
    raw_groups = split_binder_groups(
        " ".join(match.group(1).strip() for match in VARIABLE_DECL_RE.finditer(source_prefix))
    )
    if not raw_groups:
        return ""
    return " ".join(f"{group.opener}{group.content}{CLOSE_OF_OPEN[group.opener]}" for group in raw_groups)


def scan_source_module(path: Path, import_scope_prefix: str) -> SourceModule:
    source = path.read_text(encoding="utf-8")
    masked = mask_comments(source)

    matches = list(DECL_RE.finditer(masked))
    theorems = []
    for index, match in enumerate(matches):
        keyword = match.group(1)
        name = match.group(2) or match.group(3)
        kind = keyword
        next_start = matches[index + 1].start() if index + 1 < len(matches) else len(masked)
        declaration_text = masked[match.start() : next_start]
        context_signature = context_signature_before(masked[: match.start()])
        signature = extract_signature(declaration_text, match.end() - match.start())
        assigns = top_level_occurrences(declaration_text, ":=")
        body = declaration_text[assigns[0] + len(":=") :].strip() if assigns else ""
        body = re.sub(r"\s+", " ", body).strip()
        fallback = render_predicate_logic_from_signature(signature)
        transliterated = transliterate_signature(signature)
        line = masked.count("\n", 0, match.start()) + 1
        theorems.append(
            SourceTheorem(
                name=name,
                kind=kind,
                line=line,
                context_signature=context_signature,
                signature_lean=signature,
                body_lean=body,
                predicate_logic_fallback=fallback,
                transliterated_theorem=transliterated,
            )
        )

    imports = tuple(
        m.group(1)
        for m in re.finditer(
            rf"(?m)^import\s+({re.escape(import_scope_prefix)}(?:\.[\w.]+)?)\s*$", source
        )
    )

    return SourceModule(
        module=module_name(path),
        relative_path=path.relative_to(REPO_ROOT).as_posix(),
        local_imports=imports,
        theorems=tuple(theorems),
    )


# ---------------------------------------------------------------------------
# TSV (compiled-environment ground truth)
# ---------------------------------------------------------------------------


@dataclass
class CompiledTheorem:
    fq_name: str
    module: str
    kind: str  # "theorem", "instance", or "axiom"
    uses_sorry: bool | None  # None only in --offline mode
    pretty_type_uncurried: str  # "" if Lean's pretty printer failed for this row
    pretty_type_unfolded: str  # "" if unfolding/pretty-printing failed
    unfold_status: str  # "ok", "error:<message>", or "" (offline)


def short_name(fq_name: str) -> str:
    return fq_name.rpartition(".")[2]


def load_tsv(path: Path) -> dict[str, list[CompiledTheorem]]:
    """Returns compiled theorems grouped by module, each list in dump order
    (which is compilation order, i.e. source order, for same-kind
    declarations within one module)."""
    return load_tsv_text(path.read_text(encoding="utf-8"))


def synthesize_offline(modules: list[SourceModule]) -> dict[str, list[CompiledTheorem]]:
    """Fabricate compiled-environment rows from source scanning alone, for
    --offline preview when no Lean build is available. Definition-unfolding
    has no source-text equivalent, so `pretty_type_unfolded` is always left
    blank here -- the renderer falls back to the same text as the uncurried
    field and says so."""
    by_module: dict[str, list[CompiledTheorem]] = defaultdict(list)
    for mod in modules:
        for theorem in mod.theorems:
            by_module[mod.module].append(
                CompiledTheorem(
                    fq_name=f"{mod.module}.{theorem.name}",
                    module=mod.module,
                    kind=theorem.kind,
                    uses_sorry=None,
                    pretty_type_uncurried="",
                    pretty_type_unfolded="",
                    unfold_status="",
                )
            )
    return by_module


# ---------------------------------------------------------------------------
# Reconciliation: pair each source-scanned theorem with its compiled row.
# Matched by (module, short name), FIFO per name so repeated short names
# across namespaces in one file still pair up in declaration order.
# ---------------------------------------------------------------------------


@dataclass
class Entry:
    fq_name: str
    name: str
    kind: str  # display label for declaration kind
    state: str
    predicate_logic: str
    predicate_logic_unfolded: str
    transliterated_theorem: str
    logical_form_lean: str
    source_relative_path: str
    source_line: int | None


def display_kind(kind: str) -> str:
    if kind == "instance":
        return "Instance"
    if kind == "axiom":
        return "Axiom"
    if kind == "lemma":
        return "Lemma"
    if kind == "proposition":
        return "Proposition"
    if kind == "corollary":
        return "Corollary"
    return "Theorem"


def is_proof_family_kind(kind: str) -> bool:
    return kind in PROOF_KEYWORDS


DISPLAY_THEOREM_FAMILY_KINDS = {"Theorem", "Lemma", "Proposition", "Corollary"}


def is_counted_theorem_entry(entry: Entry) -> bool:
    return entry.kind in DISPLAY_THEOREM_FAMILY_KINDS


PROJECTION_WRAPPER_BODY_RE = re.compile(
    r"^(?:by\s+)?(?:exact\s+)?[A-Z][A-Za-z0-9_]*\.[A-Za-z0-9_'.]+(?:\s+end\b.*)?$"
)


def is_trivial_projection_wrapper(mod: SourceModule, theorem: SourceTheorem) -> bool:
    """True for law-wrapper theorems that merely project an existing class field.

    These are convenience accessors such as `AddCommutative := 
    AdditiveCommutativeLaws.AddCommutative`, not standalone proof obligations.
    They should not appear as primary work items in `ProofsToDo.md`.
    """
    if not is_proof_family_kind(theorem.kind):
        return False
    if not mod.relative_path.endswith("/Laws/Definition.lean"):
        return False
    return bool(PROJECTION_WRAPPER_BODY_RE.fullmatch(theorem.body_lean))


def resolve_unfolded(row: CompiledTheorem, uncurried_predicate: str) -> str:
    """The 'Predicate logic (unfolded)' text for one compiled row.

    Falls back to the same text as the uncurried predicate-logic field --
    clearly labelled, never silently identical -- when there is nothing
    better: offline preview (no Lean build was run, so no unfolding was
    attempted at all) or when `scripts/DumpProofsToDo.lean`'s unfold step
    itself errored for this declaration (surfaced so you know to check the
    unfold allow-list rather than trust a stale-looking value).
    """
    if row.uses_sorry is None:
        return f"{uncurried_predicate} [offline preview: unfolding not attempted]"
    if row.unfold_status.startswith("error:"):
        return f"{uncurried_predicate} [unfold error: {row.unfold_status[len('error:'):].strip()}]"
    unfolded = row.pretty_type_unfolded.strip()
    return humanize_compiled_logic(unfolded) if unfolded else uncurried_predicate


def render_unfolded_statement(signature: str, row: CompiledTheorem, uncurried_predicate: str) -> str:
    unfolded = resolve_unfolded(row, uncurried_predicate)
    if row.uses_sorry is None or row.unfold_status.startswith("error:"):
        return unfolded
    if should_preserve_theorem_level_prove(unfolded, uncurried_predicate):
        prove = strip_forall_prefix(uncurried_predicate)
    else:
        prove = strip_forall_prefix(unfolded)
    structured = render_structured_statement(signature, prove)
    return format_structured_statement(structured)


def theorem_environment_signature(theorem: SourceTheorem) -> str:
    if theorem.context_signature:
        return f"{theorem.context_signature} {theorem.signature_lean}"
    return theorem.signature_lean


def reconcile(
    modules: list[SourceModule], compiled_by_module: dict[str, list[CompiledTheorem]]
) -> tuple[list[tuple[SourceModule, list[Entry]]], list[str]]:
    warnings: list[str] = []
    result: list[tuple[SourceModule, list[Entry]]] = []

    for mod in modules:
        queues: dict[str, deque[CompiledTheorem]] = defaultdict(deque)
        for row in compiled_by_module.get(mod.module, []):
            queues[short_name(row.fq_name)].append(row)

        filtered_projection_names = {
            theorem.name.rpartition(".")[2]
            for theorem in mod.theorems
            if is_trivial_projection_wrapper(mod, theorem)
        }
        entries: list[Entry] = []
        for theorem in mod.theorems:
            if is_trivial_projection_wrapper(mod, theorem):
                continue
            # A declaration written as `theorem Foo.bar ...` (dot notation,
            # declaring `bar` inside namespace `Foo` regardless of any
            # currently-open `namespace` block) has a source-visible name
            # that includes the `Foo.` prefix, but the compiled fq_name's
            # tail component is just `bar`. Match on the tail; keep the
            # full written name for display.
            match_key = theorem.name.rpartition(".")[2]
            row = queues[match_key].popleft() if queues[match_key] else None
            if row is None:
                warnings.append(
                    f"{mod.relative_path}:{theorem.line}: '{theorem.name}' matched by source "
                    "scan but not reported by the Lean dumper (skipped, not compiled?)"
                )
                continue
            if row.kind == "axiom":
                state = "Axiom"
            elif row.uses_sorry is None:
                state = "Unknown (offline preview)"
            else:
                state = "Sorry" if row.uses_sorry else "Completed"
            predicate = choose_predicate_logic(row, theorem)
            entries.append(
                Entry(
                    fq_name=row.fq_name,
                    name=theorem.name,
                    kind=display_kind(theorem.kind if row.kind != "axiom" else row.kind),
                    state=state,
                    predicate_logic=predicate,
                    predicate_logic_unfolded=render_unfolded_statement(
                        theorem_environment_signature(theorem), row, predicate
                    ),
                    transliterated_theorem=theorem.transliterated_theorem,
                    logical_form_lean=theorem.signature_lean,
                    source_relative_path=mod.relative_path,
                    source_line=theorem.line,
                )
            )

        # Anything the Lean dumper reported that source scanning never found
        # a declaration for (e.g. router-file theorems, or a keyword our
        # regex doesn't recognise). Still surfaced -- nothing is silently
        # dropped -- appended after the file's scanned theorems. Lean
        # forbids forward references, so appending at file-end is always a
        # topologically safe placement even without a known source line.
        for name, remaining in queues.items():
            for row in remaining:
                if is_proof_family_kind(row.kind) and name in filtered_projection_names:
                    continue
                if row.kind == "instance":
                    note = (
                        "reported by the Lean dumper as an instance but not found by source scan "
                        "(expected for an anonymous `instance : ... := ...` with no written name; "
                        "appended at end of file's block)"
                    )
                elif row.kind == "axiom":
                    note = (
                        "reported by the Lean dumper as an axiom but not found by source scan "
                        "(appended at end of file's block)"
                    )
                else:
                    note = (
                        "reported by the Lean dumper but not found by source scan "
                        "(appended at end of file's block)"
                    )
                warnings.append(f"{mod.relative_path}: '{name}' {note}")
                if row.kind == "axiom":
                    state = "Axiom"
                elif row.uses_sorry is None:
                    state = "Unknown (offline preview)"
                else:
                    state = "Sorry" if row.uses_sorry else "Completed"
                predicate = row.pretty_type_uncurried.strip() or "(signature unavailable)"
                entries.append(
                    Entry(
                        fq_name=row.fq_name,
                        name=name,
                        kind=display_kind(row.kind),
                        state=state,
                        predicate_logic=predicate,
                        predicate_logic_unfolded=render_unfolded_statement(
                            "(signature unavailable)", row, predicate
                        ),
                        transliterated_theorem="(signature unavailable)",
                        logical_form_lean="(signature unavailable -- not found by source scan)",
                        source_relative_path=mod.relative_path,
                        source_line=None,
                    )
                )

        result.append((mod, entries))

    return result, warnings


@dataclass
class BaselineProgress:
    ref: str
    subject: str
    total: int
    completed: int
    remaining: int
    missing: int


RESET_BASELINE_PATTERNS = (
    re.compile(r"\bready for proving\b", re.IGNORECASE),
    re.compile(r"\bmass-sorry\b", re.IGNORECASE),
    re.compile(r"\breset proof inventory\b", re.IGNORECASE),
)


def git_capture(*args: str) -> str | None:
    try:
        result = subprocess.run(
            ["git", "-c", "safe.directory=F:/repos/lra-lean", *args],
            cwd=REPO_ROOT,
            check=True,
            capture_output=True,
            text=True,
            encoding="utf-8",
        )
    except (subprocess.CalledProcessError, FileNotFoundError):
        return None
    return result.stdout


def load_tsv_text(text: str) -> dict[str, list[CompiledTheorem]]:
    by_module: dict[str, list[CompiledTheorem]] = defaultdict(list)
    reader = csv.DictReader(text.splitlines(), delimiter="\t")
    for row in reader:
        by_module[row["module"]].append(
            CompiledTheorem(
                fq_name=row["fq_name"],
                module=row["module"],
                kind=row.get("kind", "theorem").strip() or "theorem",
                uses_sorry=row["uses_sorry"].strip().lower() == "true",
                pretty_type_uncurried=row.get("pretty_type_uncurried", ""),
                pretty_type_unfolded=row.get("pretty_type_unfolded", ""),
                unfold_status=row.get("unfold_status", ""),
            )
        )
    return by_module


def detect_reset_baseline(scope_path: str) -> tuple[str, str] | None:
    log_text = git_capture("log", "--format=%H%x09%s", "--", scope_path)
    if not log_text:
        return None
    for line in log_text.splitlines():
        if "\t" not in line:
            continue
        ref, subject = line.split("\t", 1)
        if any(pattern.search(subject) for pattern in RESET_BASELINE_PATTERNS):
            return ref, subject
    return None


def compiled_rows_for_scope_prefixes(
    prefixes: list[str], tsv_by_module: dict[str, list[CompiledTheorem]]
) -> list[CompiledTheorem]:
    rows: list[CompiledTheorem] = []
    for module, module_rows in tsv_by_module.items():
        if any(module == prefix or module.startswith(prefix + ".") for prefix in prefixes):
            rows.extend(module_rows)
    return rows


def compute_baseline_progress(
    entries: list[Entry], prefixes: list[str], scope_path: str
) -> BaselineProgress | None:
    baseline = detect_reset_baseline(scope_path)
    if baseline is None:
        return None
    ref, subject = baseline
    baseline_tsv = git_capture("show", f"{ref}:build/proofs-todo-environment.tsv")
    if not baseline_tsv:
        return None
    baseline_rows = compiled_rows_for_scope_prefixes(prefixes, load_tsv_text(baseline_tsv))
    baseline_open = [row for row in baseline_rows if row.kind == "theorem" and row.uses_sorry]
    if not baseline_open:
        return None
    current_by_name = {entry.fq_name: entry for entry in entries}
    completed = 0
    missing = 0
    for row in baseline_open:
        current = current_by_name.get(row.fq_name)
        if current is None:
            missing += 1
            continue
        if is_counted_theorem_entry(current) and current.state == "Completed":
            completed += 1
    total = len(baseline_open)
    remaining = total - completed - missing
    return BaselineProgress(
        ref=ref[:8],
        subject=subject,
        total=total,
        completed=completed,
        remaining=remaining,
        missing=missing,
    )


# ---------------------------------------------------------------------------
# Topological ordering of modules within one folder, by local import graph.
# Modules with no unresolved local dependency go first; ties break by
# relative path for determinism. Adapted from
# scripts/generate_proof_order.py's `topological_modules`.
# ---------------------------------------------------------------------------


def topological_modules(modules: list[SourceModule]) -> list[SourceModule]:
    by_name = {mod.module: mod for mod in modules}
    dependencies = {
        mod.module: {imp for imp in mod.local_imports if imp in by_name} for mod in modules
    }
    dependents: dict[str, set[str]] = {name: set() for name in by_name}
    for name, deps in dependencies.items():
        for dep in deps:
            dependents[dep].add(name)

    def key(name: str) -> str:
        return by_name[name].relative_path

    ready = sorted((name for name, deps in dependencies.items() if not deps), key=key)
    ordered: list[SourceModule] = []
    ordered_names: set[str] = set()
    while ready:
        name = ready.pop(0)
        ordered.append(by_name[name])
        ordered_names.add(name)
        for dependent in sorted(dependents[name], key=key):
            dependencies[dependent].discard(name)
            if not dependencies[dependent] and dependent not in ordered_names and dependent not in ready:
                ready.append(dependent)
        ready.sort(key=key)

    if len(ordered) != len(modules):
        unresolved = sorted(set(by_name) - ordered_names)
        raise ValueError(
            "cyclic or unresolved local-module dependencies: " + ", ".join(unresolved)
        )
    return ordered


def recursive_barrel_modules(
    modules: list[SourceModule],
    barrel_module: str,
) -> list[SourceModule] | None:
    """Prefer the natural recursive Lean import order rooted at a folder barrel.

    When ``LRA/<Folder>.lean`` exists, that file is the closest thing the
    current tree has to a subject-level "what Lean presents first" ordering.
    We therefore walk its local imports in written order, recursively, emit
    imported modules before the importer, and only *afterwards* append any
    in-scope modules the barrel never reaches. Those leftovers are still
    important inventory, but they should not displace the main proving path.
    """
    by_name = {mod.module: mod for mod in modules}
    root = by_name.get(barrel_module)
    if root is None:
        return None

    ordered: list[SourceModule] = []
    visited: set[str] = set()

    def visit(module_name: str) -> None:
        if module_name in visited:
            return
        mod = by_name.get(module_name)
        if mod is None:
            return
        visited.add(module_name)
        for imported in mod.local_imports:
            visit(imported)
        ordered.append(mod)

    visit(barrel_module)

    remaining = [mod for mod in modules if mod.module not in visited]
    if remaining:
        ordered.extend(topological_modules(remaining))
    return ordered


# ---------------------------------------------------------------------------
# Folder discovery + rendering
# ---------------------------------------------------------------------------


def audited_folders() -> list[Path]:
    folders = []
    for entry in sorted(LRA_ROOT.iterdir()):
        if not entry.is_dir() or entry.name.startswith("."):
            continue
        if entry.name in EXCLUDED_EXACT or entry.name.startswith(EXCLUDED_PREFIX):
            continue
        folders.append(entry)
    return folders


def folder_module_prefix(folder: Path) -> str:
    return f"LRA.{folder.name}"


def in_scope_source_modules(folder: Path, import_scope_prefix: str | None = None) -> list[SourceModule]:
    prefix = import_scope_prefix or folder_module_prefix(folder)
    paths = sorted(folder.rglob("*.lean"))
    return [scan_source_module(path, prefix) for path in paths]


def render_scope(
    *,
    title: str,
    base_dir: Path,
    ordered: list[tuple[SourceModule, list[Entry]]],
    offline: bool,
    globally_sorted: bool,
    baseline_progress: BaselineProgress | None,
) -> str:
    all_entries = [entry for _, entries in ordered for entry in entries]
    counted_entries = [entry for entry in all_entries if is_counted_theorem_entry(entry)]
    total = len(counted_entries)
    completed = sum(1 for entry in counted_entries if entry.state == "Completed")
    sorry_count = sum(1 for entry in counted_entries if entry.state == "Sorry")
    instance_count = sum(1 for entry in all_entries if entry.kind == "Instance")
    axiom_count = sum(1 for entry in all_entries if entry.kind == "Axiom")
    unknown_count = total - completed - sorry_count
    proof_total = completed + sorry_count + unknown_count
    module_count = sum(1 for _, entries in ordered if entries)

    lines = [f"# {title}", ""]
    if offline:
        lines += [
            "**OFFLINE PREVIEW.** Generated with `--offline`: no Lean build was consulted, so",
            "`State` and both `Predicate logic` fields below are reconstructed from source text",
            "only (no definition-unfolding is possible without Lean) and are *not* authoritative.",
            "Run the real generator before relying on this file.",
            "",
        ]
    lines += [
        "Generated by `scripts/DumpProofsToDo.lean` then `scripts/generate_proofs_todo.py`.",
        "Do not hand-edit; rerun the generator instead.",
        "",
    ]
    if globally_sorted:
        lines += [
            "This file is a fresh repo-wide inventory plus an open-proof work queue.",
            "The open queue uses the global import graph of all audited `LRA/` modules, and",
            "within each file it keeps source order because Lean forbids forward references.",
            "That gives a conservative repo-local work sequence, but it is **not** a",
            "theorem-level semantic dependency graph across unrelated subjects.",
        ]
    else:
        lines += [
            "This file is a fresh folder inventory plus an open-proof work queue.",
            "When `LRA/<Folder>.lean` exists, the open queue follows that barrel file's",
            "recursive import order; otherwise it falls back to this folder's module import",
            "graph. Within each file it keeps source order because Lean forbids forward",
            "references. That gives a conservative repo-local work sequence, but it is",
            "**not** a theorem-level semantic dependency graph across unrelated topics in",
            "the folder.",
        ]
    lines += [""]
    if baseline_progress is not None:
        lines += [
            f"**Progress:** {baseline_progress.completed}/{baseline_progress.total} theorem-family entr"
            f"{'y' if baseline_progress.total == 1 else 'ies'} completed since reset baseline "
            f"`{baseline_progress.ref}` ({baseline_progress.subject}).",
            f"**Baseline reconciliation:** {baseline_progress.remaining} still match baseline as "
            f"`sorry`; {baseline_progress.missing} baseline entr"
            f"{'y' if baseline_progress.missing == 1 else 'ies'}"
            " were moved, renamed, or removed and "
            "are not auto-credited.",
            "",
        ]
    lines += [
        f"**Snapshot:** {completed}/{proof_total} theorem-family entr"
        f"{'y' if proof_total == 1 else 'ies'} currently completed"
        + (
            f" ({sorry_count} sorry, {unknown_count} unknown in offline preview)."
            if offline
            else f" ({sorry_count} sorry remaining)."
        ),
        "",
        f"**Inventory:** {total} theorem/lemma/corollary/proposition entr"
        f"{'y' if total == 1 else 'ies'} across {module_count} module(s) "
        f"({completed} completed, {sorry_count} sorry"
        + (
            f", {unknown_count} unknown"
            if offline
            else ""
        )
        + ").",
        f"**Excluded from counts:** {instance_count} `instance` entr"
        f"{'y' if instance_count == 1 else 'ies'} and {axiom_count} `axiom` entr"
        f"{'y' if axiom_count == 1 else 'ies'}.",
        "",
    ]

    def render_field(label: str, value: str) -> list[str]:
        if "\n" not in value:
            return [f"{label}: {value}"]
        return [f"{label}:", textwrap.indent(value, "  ")]

    def entry_block(entry: Entry) -> str:
        abs_path = REPO_ROOT / entry.source_relative_path
        try:
            rel = abs_path.relative_to(base_dir).as_posix()
        except ValueError:
            rel = os.path.relpath(abs_path, base_dir).replace(os.sep, "/")
        source = f"./{rel}" + (f"#L{entry.source_line}" if entry.source_line is not None else "")
        lines = [
            f"Name: {entry.name}",
            f"Kind: {entry.kind}",
            f"State: {entry.state}",
        ]
        lines.extend(render_field("Predicate logic", entry.predicate_logic))
        lines.extend(render_field("Predicate logic (unfolded)", entry.predicate_logic_unfolded))
        lines.extend(render_field("Transliterated theorem", entry.transliterated_theorem))
        lines.extend(render_field("Logical form (Lean)", entry.logical_form_lean))
        lines.append(f"Source: {source}")
        return "\n".join(lines)

    open_blocks: list[str] = []
    completed_blocks: list[str] = []
    axiom_blocks: list[str] = []
    for _mod, entries in ordered:
        for entry in entries:
            block = entry_block(entry)
            if entry.state == "Axiom":
                axiom_blocks.append(block)
            elif entry.state == "Completed":
                completed_blocks.append(block)
            else:
                open_blocks.append(block)

    if not open_blocks and not completed_blocks and not axiom_blocks:
        lines.append("No proof or axiom declarations found under this scope yet.")
    else:
        lines += [
            "## Open Work Queue",
            "",
            "Unfinished entries (`Sorry`, or `Unknown` in offline preview) are listed first so",
            "this section can be used as the actual proof queue.",
            "",
        ]
        if open_blocks:
            lines.append("\n\n\n\n".join(open_blocks))
        else:
            lines.append("No unfinished theorem declarations are currently present in this scope.")

        lines += [
            "",
            "## Axioms / Assumptions",
            "",
            "Declarations written as `axiom` are recorded here for audit context, but they are",
            "excluded from the active proof queue because there is no proof obligation to discharge.",
            "",
        ]
        if axiom_blocks:
            lines.append("\n\n\n\n".join(axiom_blocks))
        else:
            lines.append("No axiomatic assumptions are currently present in this scope.")

        lines += [
            "",
            "## Completed Inventory",
            "",
            "Completed entries are retained below for full-fresh regeneration and audit context,",
            "but they are not part of the active proof queue.",
            "",
        ]
        if completed_blocks:
            lines.append("\n\n\n\n".join(completed_blocks))
        else:
            lines.append("No completed theorem declarations are currently present in this scope.")

    return "\n".join(lines).rstrip() + "\n"


def render_folder(folder: Path, ordered: list[tuple[SourceModule, list[Entry]]], offline: bool) -> str:
    baseline_progress = None
    if not offline:
        baseline_progress = compute_baseline_progress(
            [entry for _, entries in ordered for entry in entries],
            [folder_module_prefix(folder)],
            (LRA_ROOT / folder.name).as_posix(),
        )
    return render_scope(
        title=f"LRA/{folder.name} Proofs To Do",
        base_dir=folder,
        ordered=ordered,
        offline=offline,
        globally_sorted=False,
        baseline_progress=baseline_progress,
    )


def compiled_rows_for_prefixes(
    prefixes: list[str],
    tsv_by_module: dict[str, list[CompiledTheorem]] | None,
    offline: bool,
) -> dict[str, list[CompiledTheorem]]:
    if offline:
        return {}
    assert tsv_by_module is not None
    return {
        module: rows
        for module, rows in tsv_by_module.items()
        if any(module == prefix or module.startswith(prefix + ".") for prefix in prefixes)
    }


def source_modules_for_folder(folder: Path) -> list[SourceModule]:
    source_modules = in_scope_source_modules(folder)
    barrel_path = REPO_ROOT / "LRA" / f"{folder.name}.lean"
    barrel_module = folder_module_prefix(folder)
    if barrel_path.exists() and all(mod.module != barrel_module for mod in source_modules):
        source_modules.append(scan_source_module(barrel_path, barrel_module))
    return source_modules


def validate_compiled_coverage(
    folders: list[Path],
    tsv_by_module: dict[str, list[CompiledTheorem]] | None,
    offline: bool,
) -> None:
    if offline:
        return
    assert tsv_by_module is not None
    missing_prefixes: list[str] = []
    for folder in folders:
        prefix = folder_module_prefix(folder)
        source_modules = source_modules_for_folder(folder)
        if not any(mod.theorems for mod in source_modules):
            continue
        if not compiled_rows_for_prefixes([prefix], tsv_by_module, offline):
            missing_prefixes.append(prefix)
    if missing_prefixes:
        raise SystemExit(
            "build/proofs-todo-environment.tsv is incomplete for: "
            + ", ".join(missing_prefixes)
            + ". Rerun `lake env lean --run scripts/DumpProofsToDo.lean` without "
            + "`--prefix`, then rerun `python scripts/generate_proofs_todo.py`."
        )


def include_compiled_only_modules(
    source_modules: list[SourceModule],
    compiled_by_module: dict[str, list[CompiledTheorem]],
    prefixes: list[str],
    import_scope_prefix: str,
) -> list[SourceModule]:
    known = {mod.module for mod in source_modules}
    for module in compiled_by_module:
        if module in known:
            continue
        if any(module == prefix or module.startswith(prefix + ".") for prefix in prefixes):
            path = module_path(module)
            if path.exists():
                source_modules.append(scan_source_module(path, import_scope_prefix))
    return source_modules


def process_folder(folder: Path, tsv_by_module: dict[str, list[CompiledTheorem]] | None, offline: bool) -> tuple[str, list[str]]:
    source_modules = source_modules_for_folder(folder)
    barrel_module = folder_module_prefix(folder)
    prefix = barrel_module
    if offline:
        compiled_by_module = synthesize_offline(source_modules)
    else:
        compiled_by_module = compiled_rows_for_prefixes([prefix], tsv_by_module, offline)
        # Modules the Lean dumper reports for this folder but that source
        # scanning never walked (e.g. the folder's own router file, which
        # lives at LRA/<Folder>.lean, a sibling of LRA/<Folder>/, not inside
        # it). Include them so nothing compiled is silently excluded.
        source_modules = include_compiled_only_modules(
            source_modules, compiled_by_module, [prefix], prefix
        )

    ordered_modules = recursive_barrel_modules(source_modules, barrel_module)
    if ordered_modules is None:
        ordered_modules = topological_modules(source_modules)
    ordered, warnings = reconcile(ordered_modules, compiled_by_module)
    return render_folder(folder, ordered, offline), warnings


def process_global(
    folders: list[Path],
    tsv_by_module: dict[str, list[CompiledTheorem]] | None,
    offline: bool,
) -> tuple[str, list[str]]:
    prefixes = [folder_module_prefix(folder) for folder in folders]
    source_modules: list[SourceModule] = []
    for folder in folders:
        # The global checklist needs the full audited `LRA` import graph, not
        # just same-folder edges, or cross-folder dependencies disappear from
        # the topological order.
        source_modules.extend(in_scope_source_modules(folder, "LRA"))

    if offline:
        compiled_by_module = synthesize_offline(source_modules)
    else:
        compiled_by_module = compiled_rows_for_prefixes(prefixes, tsv_by_module, offline)
        source_modules = include_compiled_only_modules(
            source_modules, compiled_by_module, prefixes, "LRA"
        )

    ordered_modules = topological_modules(source_modules)
    ordered, warnings = reconcile(ordered_modules, compiled_by_module)
    baseline_progress = None
    if not offline:
        baseline_progress = compute_baseline_progress(
            [entry for _, entries in ordered for entry in entries],
            prefixes,
            LRA_ROOT.as_posix(),
        )
    return (
        render_scope(
            title="LRA Proofs To Do",
            base_dir=LRA_ROOT,
            ordered=ordered,
            offline=offline,
            globally_sorted=True,
            baseline_progress=baseline_progress,
        ),
        warnings,
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--check", action="store_true", help="fail if any ProofsToDo.md is stale")
    parser.add_argument(
        "--offline",
        action="store_true",
        help="preview without a Lean build (state/predicate logic reconstructed from source text)",
    )
    parser.add_argument(
        "--folder",
        action="append",
        help="only process this LRA/<Folder> (repeatable); default is every audited folder",
    )
    parser.add_argument(
        "--tsv",
        type=Path,
        default=DEFAULT_TSV_PATH,
        help="compiled TSV emitted by DumpProofsToDo.lean "
        f"(default: {DEFAULT_TSV_PATH.relative_to(REPO_ROOT).as_posix()})",
    )
    args = parser.parse_args()

    tsv_by_module = None
    if not args.offline:
        tsv_path = args.tsv if args.tsv.is_absolute() else REPO_ROOT / args.tsv
        if not tsv_path.exists():
            print(
                f"missing {tsv_path.relative_to(REPO_ROOT)}; run "
                "`lake env lean --run scripts/DumpProofsToDo.lean` first "
                "(or pass --offline to preview without it)",
                file=sys.stderr,
            )
            return 1
        tsv_by_module = load_tsv(tsv_path)

    folders = audited_folders()
    if args.folder:
        wanted = set(args.folder)
        folders = [f for f in folders if f.name in wanted]

    validate_compiled_coverage(folders, tsv_by_module, args.offline)

    stale = []
    all_warnings: list[str] = []
    for folder in folders:
        content, warnings = process_folder(folder, tsv_by_module, args.offline)
        all_warnings.extend(warnings)
        output = folder / "ProofsToDo.md"
        if args.check:
            current = output.read_text(encoding="utf-8") if output.exists() else ""
            if current != content:
                stale.append(output.relative_to(REPO_ROOT).as_posix())
        else:
            output.write_text(content, encoding="utf-8", newline="\n")
            print(f"wrote {output.relative_to(REPO_ROOT)}")

    if not args.folder:
        global_content, global_warnings = process_global(folders, tsv_by_module, args.offline)
        all_warnings.extend(global_warnings)
        global_output = LRA_ROOT / "ProofsToDo.md"
        if args.check:
            current = global_output.read_text(encoding="utf-8") if global_output.exists() else ""
            if current != global_content:
                stale.append(global_output.relative_to(REPO_ROOT).as_posix())
        else:
            global_output.write_text(global_content, encoding="utf-8", newline="\n")
            print(f"wrote {global_output.relative_to(REPO_ROOT)}")

    for warning in all_warnings:
        print(f"WARNING: {warning}", file=sys.stderr)

    if args.check:
        if stale:
            print("stale ProofsToDo.md files: " + ", ".join(stale), file=sys.stderr)
            return 1
        print("up to date")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
