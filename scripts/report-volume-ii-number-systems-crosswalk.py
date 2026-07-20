#!/usr/bin/env python3
"""Generate a Volume II / number-systems Markdown / Lean crosswalk.

The report is intentionally conservative.  It reads the sibling
`lra-volume-ii` chapter inventories as the book-side source of labels, reads
the generated number-system Markdown declaration inventory, and scans Lean
Volume II declarations plus file-level metadata.  It does not mutate either
manifest and it does not claim proof coverage from fuzzy matches.
"""

from __future__ import annotations

import argparse
import collections
import dataclasses
import pathlib
import re
import sys
from typing import Callable, Iterable, TypeVar

import yaml

ROOT = pathlib.Path(__file__).resolve().parents[1]
DEFAULT_VOLUME_REPO = ROOT.parent / "lra-volume-ii"
DOCS = ROOT / "docs" / "number-systems"
DECLARATIONS = DOCS / "declarations.yaml"
DEFAULT_OUTPUT = DOCS / "volume-ii-crosswalk.md"
LEAN_ROOT = ROOT / "LRA" / "VolumeII"

DECL_PATTERN = re.compile(
    r"^\s*(structure|class|def|theorem|lemma|axiom|inductive)\s+([A-Za-z_][A-Za-z0-9_']*)"
)
VOLUME_LABEL_PATTERN = re.compile(r"Volume II label:\s*([A-Za-z0-9_.:-]+)")
SOURCE_PATTERN = re.compile(r"Source:\s*docs/number-systems/([A-Za-z0-9_.-]+\.md)")

STOP_WORDS = {
    "a",
    "an",
    "and",
    "are",
    "as",
    "by",
    "for",
    "from",
    "in",
    "into",
    "is",
    "it",
    "its",
    "of",
    "on",
    "or",
    "over",
    "the",
    "to",
    "under",
    "via",
    "with",
}

PRIORITY_KEYWORDS = {
    "identity/equality/equivalence": [
        "identity",
        "equality",
        "equivalence",
        "substitution",
    ],
    "order and order compatibility": [
        "order",
        "ordered",
        "trichotomy",
        "antisymmetric",
        "transitive",
        "least",
        "positive",
    ],
    "density and approximation": [
        "density",
        "dense",
        "between",
        "arbitrary closeness",
        "approximation",
        "rational between",
    ],
    "archimedean and bounds": [
        "archimedean",
        "integer part",
        "bounded",
        "bound",
    ],
    "irrationality and gaps": [
        "irrational",
        "square root",
        "sqrt",
        "gap",
        "incomplete",
        "no rational",
    ],
    "division and reciprocal": [
        "division",
        "divisibility",
        "euclidean",
        "reciprocal",
        "inverse",
    ],
}


@dataclasses.dataclass(frozen=True)
class VolumeItem:
    subject: str
    label: str
    kind: str
    title: str
    file: str | None
    proof_file: str | None
    chapter: pathlib.Path


@dataclasses.dataclass(frozen=True)
class MarkdownItem:
    identifier: str
    source: str
    kind: str
    title: str
    lean_module: str | None
    lean_declaration: str | None
    status: str


@dataclasses.dataclass(frozen=True)
class LeanItem:
    module: str
    declaration: str
    kind: str
    file: pathlib.Path
    volume_labels: tuple[str, ...]
    sources: tuple[str, ...]


def normalize(text: str) -> str:
    text = text.replace("\\mathbb", " ")
    text = text.replace("\\operatorname", " ")
    text = re.sub(r"\\[A-Za-z]+", " ", text)
    text = re.sub(r"[^A-Za-z0-9]+", " ", text).lower()
    return " ".join(text.split())


def tokens(text: str) -> set[str]:
    return {token for token in normalize(text).split() if token not in STOP_WORDS}


def slugish(text: str) -> str:
    return "-".join(normalize(text).split())


def score(left: str, right: str) -> float:
    left_tokens = tokens(left)
    right_tokens = tokens(right)
    if not left_tokens or not right_tokens:
        return 0.0
    shorter = left_tokens if len(left_tokens) <= len(right_tokens) else right_tokens
    longer = right_tokens if shorter is left_tokens else left_tokens
    if len(shorter) >= 2 and shorter <= longer:
        return 1.0
    intersection = left_tokens & right_tokens
    union = left_tokens | right_tokens
    if len(intersection) < 2 and min(len(left_tokens), len(right_tokens)) > 1:
        return 0.0
    return len(intersection) / len(union)


def relative_to_root(path: pathlib.Path) -> pathlib.Path:
    try:
        return path.resolve().relative_to(ROOT)
    except ValueError:
        return path


def load_volume_items(volume_repo: pathlib.Path) -> list[VolumeItem]:
    volume_root = volume_repo / "volume-ii"
    if not volume_root.exists():
        raise FileNotFoundError(f"Volume II root not found: {volume_root}")

    items: list[VolumeItem] = []
    for chapter in sorted(volume_root.rglob("chapter.yaml")):
        document = yaml.safe_load(chapter.read_text(encoding="utf-8")) or {}
        subject = str(document.get("subject") or chapter.parent.name)
        for row in document.get("environments", []) or []:
            label = str(row.get("label") or "").strip()
            if not label:
                continue
            items.append(
                VolumeItem(
                    subject=subject,
                    label=label,
                    kind=str(row.get("type") or label.split(":", 1)[0]),
                    title=str(row.get("display_title") or label),
                    file=row.get("file"),
                    proof_file=row.get("proof_file"),
                    chapter=chapter,
                )
            )
    return items


def load_markdown_items() -> list[MarkdownItem]:
    document = yaml.safe_load(DECLARATIONS.read_text(encoding="utf-8")) or {}
    items: list[MarkdownItem] = []
    for row in document.get("declarations", []) or []:
        items.append(
            MarkdownItem(
                identifier=str(row.get("id")),
                source=str(row.get("source")),
                kind=str(row.get("kind")),
                title=str(row.get("title")),
                lean_module=row.get("lean_module"),
                lean_declaration=row.get("lean_declaration"),
                status=str(row.get("status")),
            )
        )
    return items


def module_name(path: pathlib.Path) -> str:
    relative = path.relative_to(ROOT).with_suffix("")
    return ".".join(relative.parts)


def scan_lean_items() -> list[LeanItem]:
    items: list[LeanItem] = []
    for path in sorted(LEAN_ROOT.rglob("*.lean")):
        text = path.read_text(encoding="utf-8")
        volume_labels = tuple(VOLUME_LABEL_PATTERN.findall(text))
        sources = tuple(SOURCE_PATTERN.findall(text))
        module = module_name(path)
        for line in text.splitlines():
            match = DECL_PATTERN.match(line)
            if not match:
                continue
            kind, declaration = match.groups()
            items.append(
                LeanItem(
                    module=module,
                    declaration=declaration,
                    kind=kind,
                    file=path,
                    volume_labels=volume_labels,
                    sources=sources,
                )
            )
    return items


T = TypeVar("T")


def best_matches(
    needle: str,
    candidates: Iterable[T],
    title_of: Callable[[T], str],
    threshold: float,
    limit: int = 3,
) -> list[tuple[float, T]]:
    scored = [(score(needle, title_of(candidate)), candidate) for candidate in candidates]
    scored = [(value, candidate) for value, candidate in scored if value >= threshold]
    scored.sort(key=lambda item: item[0], reverse=True)
    return scored[:limit]


def count_by(items: Iterable[object], key) -> list[tuple[str, int]]:
    counter = collections.Counter(key(item) for item in items)
    return sorted(counter.items())


def format_count_table(rows: list[tuple[str, int]]) -> list[str]:
    return [f"- `{name}`: {count}" for name, count in rows]


def volume_path(volume_repo: pathlib.Path, item: VolumeItem) -> str:
    base = item.chapter.parent
    if item.file:
        path = base / item.file
    else:
        path = item.chapter
    try:
        return path.resolve().relative_to(volume_repo).as_posix()
    except ValueError:
        return path.as_posix()


def markdown_path(item: MarkdownItem) -> str:
    return f"docs/number-systems/{item.source}"


def lean_path(item: LeanItem) -> str:
    return relative_to_root(item.file).as_posix()


def lean_subject_compatible(subject: str, item: LeanItem) -> bool:
    module = item.module
    if subject == "complex-numbers":
        return ".Complex" in module or ".NumberSystemTower" in module
    if subject == "extended-real-numbers":
        return ".Reals." in module or module.endswith(".Reals")
    if subject == "rationals":
        return ".Rationals." in module or module.endswith(".Rationals") or ".NumberSystems." in module
    if subject == "reals":
        return ".Reals." in module or module.endswith(".Reals") or ".NumberSystems." in module
    if subject == "integers":
        return ".Integers." in module or module.endswith(".Integers") or ".NumberSystems." in module
    if subject == "natural-numbers":
        return ".NaturalNumbers." in module or module.endswith(".NaturalNumbers")
    if subject == "whole-numbers":
        return ".WholeNumbers." in module or module.endswith(".WholeNumbers")
    if subject == "peano-systems":
        return ".PeanoSystems." in module or module.endswith(".PeanoSystems")
    if subject == "arithmetic-operations-relations":
        return ".NumberSystems." in module or ".Foundations." in module or ".Foundation." in module
    if subject == "identity-equality-equivalence":
        return ".Foundations." in module or ".Foundation." in module
    if subject in {"embedding-number-systems", "constructing-number-systems", "number-lines"}:
        return ".NumberSystems." in module or ".NumberSystemTower." in module or ".Reals." in module
    return True


def priority_gap_rows(
    volume_items: list[VolumeItem],
    markdown_items: list[MarkdownItem],
    lean_items: list[LeanItem],
    volume_repo: pathlib.Path,
) -> list[str]:
    lines: list[str] = []
    for group, keywords in PRIORITY_KEYWORDS.items():
        selected = [
            item
            for item in volume_items
            if any(keyword in normalize(f"{item.label} {item.title}") for keyword in keywords)
        ]
        missing_markdown: list[VolumeItem] = []
        missing_lean: list[VolumeItem] = []
        for item in selected:
            markdown = best_matches(item.title, markdown_items, lambda candidate: candidate.title, 0.62, 1)
            lean = best_matches(
                f"{item.label} {item.title}",
                [candidate for candidate in lean_items if lean_subject_compatible(item.subject, candidate)],
                lambda candidate: f"{candidate.declaration} {' '.join(candidate.volume_labels)}",
                0.45,
                1,
            )
            if not markdown:
                missing_markdown.append(item)
            if not lean:
                missing_lean.append(item)

        lines.extend(
            [
                f"### {group.title()}",
                "",
                f"- Volume II labels found: `{len(selected)}`",
                f"- No likely Markdown match: `{len(missing_markdown)}`",
                f"- No likely Lean declaration/module-label match: `{len(missing_lean)}`",
                "",
            ]
        )
        examples = missing_markdown[:12]
        if examples:
            lines.append("Likely missing from Markdown:")
            for item in examples:
                lines.append(
                    f"- `{item.label}` — {item.title} "
                    f"({item.subject}; `{volume_path(volume_repo, item)}`)"
                )
            lines.append("")
        lean_examples = missing_lean[:12]
        if lean_examples:
            lines.append("Likely missing from Lean:")
            for item in lean_examples:
                lines.append(
                    f"- `{item.label}` — {item.title} "
                    f"({item.subject}; `{volume_path(volume_repo, item)}`)"
                )
            lines.append("")
    return lines


def high_confidence_rows(
    volume_items: list[VolumeItem],
    markdown_items: list[MarkdownItem],
    lean_items: list[LeanItem],
    volume_repo: pathlib.Path,
) -> list[str]:
    lines: list[str] = []
    for item in volume_items:
        markdown = best_matches(item.title, markdown_items, lambda candidate: candidate.title, 0.75, 1)
        lean = best_matches(
            f"{item.label} {item.title}",
            [candidate for candidate in lean_items if lean_subject_compatible(item.subject, candidate)],
            lambda candidate: f"{candidate.declaration} {' '.join(candidate.volume_labels)}",
            0.58,
            1,
        )
        if not markdown and not lean:
            continue
        markdown_text = "none"
        if markdown:
            value, match = markdown[0]
            markdown_text = f"`{match.identifier}` ({value:.2f})"
        lean_text = "none"
        if lean:
            value, match = lean[0]
            lean_text = f"`{match.module}.{match.declaration}` ({value:.2f})"
        lines.append(
            f"- `{item.label}` — {item.title} | Markdown: {markdown_text} | Lean: {lean_text} | "
            f"Volume file: `{volume_path(volume_repo, item)}`"
        )
    return lines[:200]


def subject_gap_rows(
    volume_items: list[VolumeItem],
    markdown_items: list[MarkdownItem],
) -> list[str]:
    lines = [
        "| Subject | Volume II labels | Likely Markdown matches | Likely missing |",
        "| --- | ---: | ---: | ---: |",
    ]
    subjects = sorted({item.subject for item in volume_items})
    for subject in subjects:
        selected = [item for item in volume_items if item.subject == subject]
        likely = 0
        for item in selected:
            if best_matches(item.title, markdown_items, lambda candidate: candidate.title, 0.62, 1):
                likely += 1
        lines.append(f"| `{subject}` | {len(selected)} | {likely} | {len(selected) - likely} |")
    return lines


def markdown_report(
    volume_repo: pathlib.Path,
    volume_items: list[VolumeItem],
    markdown_items: list[MarkdownItem],
    lean_items: list[LeanItem],
) -> str:
    exact_lean_label_matches = {
        label
        for item in lean_items
        for label in item.volume_labels
    }
    exact_volume_label_count = sum(1 for item in volume_items if item.label in exact_lean_label_matches)
    markdown_status_counts = count_by(markdown_items, lambda item: item.status)
    lean_kind_counts = count_by(lean_items, lambda item: item.kind)
    volume_kind_counts = count_by(volume_items, lambda item: item.kind)

    return "\n".join(
        [
            "# Volume II / Number-Systems Crosswalk",
            "",
            f"Volume II repo: `{volume_repo}`",
            f"Markdown declaration manifest: `{relative_to_root(DECLARATIONS).as_posix()}`",
            f"Lean root scanned: `{relative_to_root(LEAN_ROOT).as_posix()}`",
            "",
            "## Summary",
            "",
            f"- Volume II chapter labels: `{len(volume_items)}`",
            f"- Number-system Markdown declaration blocks: `{len(markdown_items)}`",
            f"- Lean Volume II declarations scanned: `{len(lean_items)}`",
            f"- Exact Lean file metadata matches to Volume II labels: `{exact_volume_label_count}`",
            "",
            "Volume II label kinds:",
            *format_count_table(volume_kind_counts),
            "",
            "Markdown manifest statuses:",
            *format_count_table(markdown_status_counts),
            "",
            "Lean declaration kinds:",
            *format_count_table(lean_kind_counts),
            "",
            "## Subject Coverage Against Markdown",
            "",
            *subject_gap_rows(volume_items, markdown_items),
            "",
            "## Priority Gap Buckets",
            "",
            *priority_gap_rows(volume_items, markdown_items, lean_items, volume_repo),
            "## High-Confidence Crosswalk Candidates",
            "",
            "These are fuzzy title/name matches.  They are review candidates, not proof-status claims.",
            "",
            *(
                high_confidence_rows(volume_items, markdown_items, lean_items, volume_repo)
                or ["- No high-confidence candidates found."]
            ),
            "",
            "## Interpretation",
            "",
            "- `lra-volume-ii` remains more granular than the current number-system Markdown package.",
            "- A missing fuzzy match may still be covered by a broader Lean interface or theorem bundle.",
            "- Exact coverage should be established by adding stable Volume II labels to Markdown blocks and Lean declaration metadata.",
            "",
        ]
    )


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--volume-repo",
        default=str(DEFAULT_VOLUME_REPO),
        help="Path to the lra-volume-ii repository.",
    )
    parser.add_argument(
        "--output",
        default=str(DEFAULT_OUTPUT),
        help="Markdown report path.",
    )
    args = parser.parse_args()

    volume_repo = pathlib.Path(args.volume_repo).resolve()
    output = pathlib.Path(args.output)
    if not output.is_absolute():
        output = ROOT / output

    try:
        volume_items = load_volume_items(volume_repo)
    except FileNotFoundError as error:
        print(str(error), file=sys.stderr)
        return 2
    markdown_items = load_markdown_items()
    lean_items = scan_lean_items()

    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(
        markdown_report(volume_repo, volume_items, markdown_items, lean_items),
        encoding="utf-8",
    )
    print(f"Wrote {relative_to_root(output)}")
    print(f"Volume II labels: {len(volume_items)}")
    print(f"Markdown declarations: {len(markdown_items)}")
    print(f"Lean declarations: {len(lean_items)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
