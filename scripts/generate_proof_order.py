#!/usr/bin/env python3
"""Generate Volume I Order's dependency-ordered theorem proof guide.

The generator treats the Lean sources as authoritative for theorem inventory,
module dependencies, source order, source links, and new theorem summaries.  It
preserves the reviewed mathematical prose already present in ProofOrder.md so
that a regeneration does not discard human improvements.  A newly discovered
theorem receives a ``Let ... Then ...`` statement assembled from its formal
parameters and the prose portion of its Lean documentation comment.

Run from the repository root:

    python scripts/generate_proof_order.py
    python scripts/generate_proof_order.py --check

Use ``--refresh-prose`` only when intentionally retranslating every statement
from the current Lean documentation comments.
"""

from __future__ import annotations

import argparse
import re
import sys
from dataclasses import dataclass
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[1]
ORDER_ROOT = REPO_ROOT / "LRA" / "VolumeI" / "Order"
DEFAULT_OUTPUT = ORDER_ROOT / "ProofOrder.md"
MODULE_PREFIX = "LRA.VolumeI.Order."


@dataclass(frozen=True)
class Theorem:
    name: str
    line: int
    signature: str
    summary: str


@dataclass(frozen=True)
class Module:
    path: Path
    relative_path: str
    import_name: str
    imports: tuple[str, ...]
    theorems: tuple[Theorem, ...]


# These declarations need a slightly more explicit wording than the first
# sentence of their historical documentation comment supplies.
STATEMENT_OVERRIDES = {
    "UpperBoundOfUnionIff": (
        "An element is an upper bound of the union of two subsets if and only "
        "if it is an upper bound of each subset separately."
    ),
    "LowerBoundOfUnionIff": (
        "An element is a lower bound of the union of two subsets if and only "
        "if it is a lower bound of each subset separately."
    ),
    "MeetEqualsLeftIffRelated": (
        "The meet of two elements equals the left element if and only if the "
        "left element is related to the right element."
    ),
}


def mask_comments(source: str) -> str:
    """Replace Lean comments with spaces while retaining offsets and lines."""

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


def preceding_doc_comment(source: str, theorem_offset: int) -> str:
    prefix = source[:theorem_offset]
    end = prefix.rfind("-/")
    if end == -1 or prefix[end + 2 :].strip():
        return ""
    start = prefix.rfind("/--", 0, end)
    if start == -1:
        return ""
    return prefix[start + 3 : end].strip()


def prose_summary(comment: str, theorem_name: str) -> str:
    """Extract the ordinary-language statement from a Lean doc comment."""

    if theorem_name in STATEMENT_OVERRIDES:
        return STATEMENT_OVERRIDES[theorem_name]

    text = comment.replace("\r\n", "\n")
    statement = re.search(
        r"(?:^|\n)\s*Statement:\s*(.*?)(?=\n\s*Logical form:|\Z)",
        text,
        flags=re.DOTALL,
    )
    if statement:
        text = statement.group(1)
    else:
        text = re.split(r"\n\s*Logical form:", text, maxsplit=1)[0]
        text = re.sub(
            rf"^\s*`?{re.escape(theorem_name)}`?\s*\n+", "", text
        )

    text = re.sub(r"```.*?```", "", text, flags=re.DOTALL)
    text = re.sub(r"`([^`]*)`", r"\1", text)
    text = re.sub(r"\s+", " ", text).strip(" -\n")
    if not text:
        raise ValueError(
            f"{theorem_name} has no prose theorem statement in its doc comment"
        )
    if text[-1] not in ".!?":
        text += "."
    return text[0].upper() + text[1:]


def theorem_signature(masked: str, start: int, next_start: int) -> str:
    declaration = masked[start:next_start]
    proof = re.search(r"\s:=\s*(?:by\b|by\?)", declaration)
    if proof:
        declaration = declaration[: proof.start()]
    return re.sub(r"\s+", " ", declaration).strip()


def parse_theorems(path: Path) -> tuple[Theorem, ...]:
    source = path.read_text(encoding="utf-8")
    masked = mask_comments(source)
    matches = list(
        re.finditer(r"(?m)^[ \t]*theorem\s+([A-Za-z_][\w'.]*)\b", masked)
    )
    result: list[Theorem] = []
    for index, match in enumerate(matches):
        end = matches[index + 1].start() if index + 1 < len(matches) else len(masked)
        name = match.group(1)
        result.append(
            Theorem(
                name=name,
                line=source.count("\n", 0, match.start()) + 1,
                signature=theorem_signature(masked, match.start(), end),
                summary=prose_summary(preceding_doc_comment(source, match.start()), name),
            )
        )
    return tuple(result)


def module_name(path: Path) -> str:
    relative = path.relative_to(REPO_ROOT).with_suffix("")
    return ".".join(relative.parts)


def parse_module(path: Path) -> Module:
    source = path.read_text(encoding="utf-8")
    imports = tuple(
        match.group(1)
        for match in re.finditer(r"(?m)^import\s+(LRA\.VolumeI\.Order\.[\w.]+)", source)
    )
    return Module(
        path=path,
        relative_path=path.relative_to(ORDER_ROOT).as_posix(),
        import_name=module_name(path),
        imports=imports,
        theorems=parse_theorems(path),
    )


def existing_guide(output: Path) -> tuple[dict[str, str], list[str]]:
    if not output.exists():
        return {}, []
    text = output.read_text(encoding="utf-8")
    prose: dict[str, str] = {}
    for match in re.finditer(
        r"(?m)^- \[[ xX]\] \*\*([^*]+)\*\* — (.*?) "
        r"\(\[source\]\([^\n]+\)\)$",
        text,
    ):
        prose[match.group(1)] = match.group(2).strip()
    order = re.findall(r"(?m)^### \d+\. `([^`]+)`$", text)
    return prose, order


def topological_modules(
    modules: list[Module], preferred_order: list[str]
) -> list[Module]:
    """Order theorem-bearing modules after their local imported dependencies."""

    by_name = {module.import_name: module for module in modules}
    preferred_rank = {name: index for index, name in enumerate(preferred_order)}
    dependencies = {
        module.import_name: {item for item in module.imports if item in by_name}
        for module in modules
    }
    dependents: dict[str, set[str]] = {name: set() for name in by_name}
    for name, requirements in dependencies.items():
        for requirement in requirements:
            dependents[requirement].add(name)

    def key(name: str) -> tuple[int, str]:
        relative = by_name[name].relative_path
        return (preferred_rank.get(relative, len(preferred_rank)), relative)

    ready = sorted((name for name, deps in dependencies.items() if not deps), key=key)
    ordered: list[Module] = []
    while ready:
        name = ready.pop(0)
        ordered.append(by_name[name])
        for dependent in sorted(dependents[name], key=key):
            dependencies[dependent].discard(name)
            if not dependencies[dependent] and dependent not in {
                item.import_name for item in ordered
            } and dependent not in ready:
                ready.append(dependent)
        ready.sort(key=key)

    if len(ordered) != len(modules):
        unresolved = sorted(set(by_name) - {module.import_name for module in ordered})
        raise ValueError("cyclic or unresolved module dependencies: " + ", ".join(unresolved))
    return ordered


def has_word(signature: str, *words: str) -> bool:
    return any(re.search(rf"\b{re.escape(word)}\b", signature) for word in words)


def mathematical_context(signature: str) -> str:
    """Translate common formal binders into a compact mathematical preamble."""

    clauses: list[str] = []
    type_names = re.findall(r"[\{(]([A-Z][A-Za-z0-9_]*)\s*:\s*Type", signature)
    element_types = [
        name
        for name in type_names
        if name not in {"SetObject", "SourceSet", "TargetSet", "Index", "IndexType"}
    ]
    symbols = ["P", "Q", "R"]
    if element_types:
        displayed = ", ".join(
            rf"\({symbols[i] if i < len(symbols) else name}\)"
            for i, name in enumerate(element_types)
        )
        clauses.append(f"{displayed} be {'sets' if len(element_types) > 1 else 'a set'}")
    elif has_word(signature, "Int"):
        clauses.append(r"\(\mathbb Z\) carry its usual order")
    elif has_word(signature, "Real"):
        clauses.append(r"\(\mathbb R\) carry its usual order")
    else:
        clauses.append("the displayed ordered structure be given")

    if has_word(signature, "Index", "IndexType"):
        clauses.append(r"\(I\) be an index set")
    if has_word(signature, "SetObject", "SourceSet", "TargetSet"):
        clauses.append("the represented subsets belong to their displayed set families")

    relation_names = re.findall(
        r"\b(?:relation|sourceRelation|targetRelation|firstRelation|secondRelation)\b",
        signature,
    )
    if relation_names:
        clauses.append("equip the carriers with the displayed binary relations")

    if re.search(r"\b(?:map|function|embedding|isomorphism)\b", signature):
        clauses.append("the displayed map act between those carriers")

    return "Let " + ", ".join(clauses) + "."


def translated_statement(theorem: Theorem) -> str:
    context = mathematical_context(theorem.signature)
    summary = theorem.summary
    if summary.startswith("Let "):
        return summary
    if summary.startswith("Then "):
        return f"{context} {summary}"
    return f"{context} Then {summary[0].lower() + summary[1:]}"


def normalize_statement(statement: str) -> str:
    """Clean mechanical artifacts from preserved generated prose."""

    statement = statement.replace("Let let ", "Let ")
    statement = statement.replace(", let ", ", ")
    return statement


def generate(output: Path, refresh_prose: bool) -> str:
    existing_prose, preferred_order = existing_guide(output)
    modules = [
        parse_module(path)
        for path in sorted(ORDER_ROOT.rglob("*.lean"))
        if path.name != "ProofOrder.lean"
    ]
    modules = [module for module in modules if module.theorems]
    modules = topological_modules(modules, preferred_order)
    theorem_count = sum(len(module.theorems) for module in modules)

    lines = [
        "# Volume I Order Proof Order",
        "",
        "This checklist contains every Lean `theorem` declaration recursively under `LRA/VolumeI/Order`. Modules are ordered by their import dependencies, and theorems within each module retain source order.",
        "",
        "Each entry is a human mathematical statement rather than a repetition of the Lean declaration. The prose introduces the ambient sets and structures with “Let …” and states the mathematical claim in ordinary terminology. The source link remains available for the exact formal signature and implementation-level capabilities.",
        "",
        f"**Inventory:** {theorem_count} theorems in {len(modules)} modules.",
        "",
        "## Ordering rules",
        "",
        "1. Complete modules from top to bottom.",
        "2. Within each module, complete entries from top to bottom.",
        "3. Imported definitions and earlier theorem entries may be used in later proofs.",
        "4. Failure-mode theorems are proof obligations and remain in dependency order.",
        "",
        "## Theorem checklist",
        "",
    ]

    for module_index, module in enumerate(modules, start=1):
        lines.append(f"### {module_index}. `{module.relative_path}`")
        lines.append("")
        for theorem in module.theorems:
            statement = (
                translated_statement(theorem)
                if refresh_prose or theorem.name not in existing_prose
                else existing_prose[theorem.name]
            )
            statement = normalize_statement(statement)
            if not statement.startswith("Let "):
                statement = translated_statement(theorem)
                statement = normalize_statement(statement)
            source = f"./{module.relative_path}#L{theorem.line}"
            lines.append(
                f"- [ ] **{theorem.name}** — {statement} ([source]({source}))"
            )
        lines.append("")

    return "\n".join(lines).rstrip() + "\n"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="fail if the guide is stale")
    parser.add_argument(
        "--refresh-prose",
        action="store_true",
        help="retranslate all prose instead of preserving reviewed statements",
    )
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()
    output = args.output.resolve()
    generated = generate(output, args.refresh_prose)

    if args.check:
        current = output.read_text(encoding="utf-8") if output.exists() else ""
        if current != generated:
            print(f"stale generated guide: {output}", file=sys.stderr)
            return 1
        print(f"up to date: {output}")
        return 0

    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(generated, encoding="utf-8", newline="\n")
    print(f"wrote {output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
