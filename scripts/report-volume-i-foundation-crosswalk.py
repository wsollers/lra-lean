"""Generate a crosswalk from Volume I set-theory labels to Lean foundations.

The report is intentionally conservative: it classifies an item as represented
only when an obvious Lean declaration exists. Closely related support is marked
partial so the implementation plan does not hide missing book-level blocks.
"""

from __future__ import annotations

import re
from collections import Counter, defaultdict
from dataclasses import dataclass
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[1]
VOLUME_I_ROOT = REPO_ROOT.parent / "lra-volume-i" / "volume-i" / "book-sets"
LEAN_ROOTS = [REPO_ROOT / "LRA" / "Foundation", REPO_ROOT / "LRA" / "VolumeI"]
REPORT_PATH = REPO_ROOT / "docs" / "foundations" / "volume-i-set-theory-crosswalk.md"


LABEL_RE = re.compile(
    r"(?:\\begin\{(?P<env>definition|theorem|proposition|lemma|corollary)\}"
    r"(?:\[(?P<title>[^\]]*)\])?)?"
    r".*?\\label\{(?P<label>(?P<kind>def|thm|prop|lem|cor):[^}]+)\}"
)
DECL_RE = re.compile(
    r"^\s*(?:/--.*?--/\s*)?"
    r"(?P<command>def|abbrev|theorem|lemma|structure|inductive|class)\s+"
    r"(?P<name>[A-Za-z_][A-Za-z0-9_'.]*)",
    re.MULTILINE | re.DOTALL,
)


@dataclass(frozen=True)
class BookLabel:
    subject: str
    file: Path
    line: int
    kind: str
    label: str
    title: str


@dataclass(frozen=True)
class LeanDecl:
    file: Path
    command: str
    name: str


def normalize(text: str) -> str:
    text = text.replace("\\texorpdfstring", " ")
    text = re.sub(r"\\[A-Za-z]+", " ", text)
    text = re.sub(r"[^A-Za-z0-9]+", "", text)
    return text.lower()


def snake_words(text: str) -> set[str]:
    words = re.split(r"[^A-Za-z0-9]+", text)
    return {word.lower() for word in words if word}


def subject_for(path: Path) -> str:
    rel = path.relative_to(VOLUME_I_ROOT)
    return rel.parts[0]


def collect_book_labels() -> list[BookLabel]:
    labels: list[BookLabel] = []
    for path in sorted(VOLUME_I_ROOT.rglob("*.tex")):
      try:
        lines = path.read_text(encoding="utf-8").splitlines()
      except UnicodeDecodeError:
        lines = path.read_text(encoding="latin-1").splitlines()
      for index, line in enumerate(lines, start=1):
        match = LABEL_RE.search(line)
        if not match:
            continue
        title = match.group("title") or ""
        labels.append(
            BookLabel(
                subject=subject_for(path),
                file=path,
                line=index,
                kind=match.group("kind"),
                label=match.group("label"),
                title=re.sub(r"\s+", " ", title).strip(),
            )
        )
    return labels


def collect_lean_decls() -> list[LeanDecl]:
    decls: list[LeanDecl] = []
    for root in LEAN_ROOTS:
        if not root.exists():
            continue
        for path in sorted(root.rglob("*.lean")):
            text = path.read_text(encoding="utf-8")
            for match in DECL_RE.finditer(text):
                decls.append(
                    LeanDecl(
                        file=path,
                        command=match.group("command"),
                        name=match.group("name"),
                    )
                )
    return decls


def manual_status(label: BookLabel) -> tuple[str, str]:
    represented = {
        "def:set-membership",
        "def:empty-set",
        "def:subset",
        "def:proper-subset",
        "def:set-equality",
        "def:union",
        "def:intersection",
        "def:set-difference",
        "def:sym-diff",
        "def:complement",
        "def:power-set",
        "def:inclusion-monotone-set-operation",
        "def:inclusion-antitone-set-operation",
        "def:indexed-union",
        "def:indexed-intersection",
        "def:pairwise-disjoint",
        "def:cover-full",
        "def:subcover",
        "def:finite-cover",
        "def:open-cover",
        "def:fip",
        "def:indexed-family",
        "def:set-cover",
        "thm:indexed-de-morgan",
        "thm:indexed-distributivity",
        "thm:union-monotone-inclusion",
        "thm:intersection-monotone-inclusion",
        "thm:power-set-monotone-inclusion",
        "thm:complement-antitone-inclusion",
        "thm:set-difference-monotone-left",
        "thm:set-difference-antitone-right",
        "thm:de-morgan",
        "def:relation",
        "def:relation-domain",
        "def:relation-range",
        "def:converse-relation",
        "def:relation-composition",
        "def:reflexive",
        "def:irreflexive",
        "def:symmetric",
        "def:antisymmetric",
        "def:asymmetric",
        "def:transitive",
        "def:total-rel",
        "def:equivalence-rel",
        "def:preorder",
        "def:partial-order",
        "def:strict-partial-order-relations",
        "def:total-order",
        "def:function",
        "def:domain",
        "def:image-function",
        "def:image-set",
        "def:preimage",
        "def:fiber",
        "def:injective",
        "def:surjective",
        "def:bijective",
        "def:identity",
        "def:composition",
        "def:restriction",
        "def:ordered-set",
        "def:partially-ordered-set",
        "def:poset",
        "def:toset",
        "def:strict-order",
        "def:order-embedding",
        "def:order-reflecting-map",
    }
    partial = {
        "def:finite-infinite",
        "prop:fip-duality",
        "thm:commutativity",
        "thm:associativity",
        "thm:distributivity",
        "thm:identity-absorption",
        "thm:involution",
        "def:ordered-pair",
        "def:cartesian-product",
        "def:cartesian-product-rel",
        "def:universal-relation",
        "def:relation-identity",
        "def:relation-inclusion",
        "def:relation-equality",
        "def:relation-union",
        "def:relation-intersection",
        "def:relation-difference",
        "def:relation-complement",
        "def:quotient-set",
        "def:canonical-surj",
        "def:functional-relation",
        "def:total-relation-on-domain",
        "def:partial-function",
        "def:function-equality",
        "def:codomain",
        "def:graph",
        "def:empty-function",
        "def:inclusion",
        "def:constant",
        "def:invertible-function",
        "def:inverse",
        "def:left-inverse-function",
        "def:right-inverse-function",
        "def:well-ordered-set",
        "def:order-preserving-map-ordered-sets",
        "def:order-reversing-map",
        "def:order-isomorphism-ordered-sets",
        "def:comparable",
        "def:incomparable",
        "def:upper-bound",
        "def:lower-bound",
        "def:order-minimal-element",
        "def:order-maximal-element",
        "def:order-least-element",
        "def:order-greatest-element",
        "def:induced-order",
        "def:suborder",
        "def:strictly-monotone-map-functions-order",
        "prop:order-embedding-injective-revisited",
    }
    if label.label in represented:
        return "represented", "obvious Lean declaration exists in Foundation/VolumeI"
    if label.label in partial:
        return "partial", "related Lean support exists, but not the full book block"
    if label.kind in {"thm", "prop", "lem", "cor"}:
        return "missing", "book-level theorem/proposition is not yet mirrored"
    return "missing", "no obvious Lean declaration"


def find_obvious_decls(label: BookLabel, decls: list[LeanDecl]) -> list[LeanDecl]:
    label_tokens = snake_words(label.label.split(":", 1)[1])
    title_tokens = snake_words(label.title)
    wanted = label_tokens | title_tokens
    if not wanted:
        return []
    matches: list[LeanDecl] = []
    seen: set[tuple[Path, str]] = set()
    for decl in decls:
        decl_norm = normalize(decl.name)
        decl_words = snake_words(decl.name)
        is_match = (
            normalize(label.label.split(":", 1)[1]) == decl_norm
            or (label.title and normalize(label.title) == decl_norm)
            or len(wanted & decl_words) >= min(2, len(wanted))
        )
        key = (decl.file, decl.name)
        if is_match and key not in seen:
            seen.add(key)
            matches.append(decl)
    return matches[:4]


def rel(path: Path) -> str:
    return path.relative_to(REPO_ROOT).as_posix()


def render(labels: list[BookLabel], decls: list[LeanDecl]) -> str:
    counts = Counter(label.subject for label in labels)
    status_counts: Counter[str] = Counter()
    rows_by_subject: dict[str, list[tuple[BookLabel, str, str, list[LeanDecl]]]] = defaultdict(list)
    for label in labels:
        status, note = manual_status(label)
        status_counts[status] += 1
        rows_by_subject[label.subject].append((label, status, note, find_obvious_decls(label, decls)))

    lines: list[str] = [
        "# Volume I Set Theory to Lean Foundation Crosswalk",
        "",
        "Generated from `F:/repos/lra-volume-i/volume-i/book-sets` and compared against ",
        "`LRA/Foundation` plus `LRA/VolumeI`.",
        "",
        "This is a planning report. `represented` means an obvious declaration exists; ",
        "`partial` means Lean has adjacent machinery but not the full book-level interface or theorem; ",
        "`missing` means no clear mirror exists yet.",
        "",
        "## Summary",
        "",
        f"- Book labels scanned: {len(labels)}",
        f"- Lean declarations scanned: {len(decls)}",
        f"- Represented: {status_counts['represented']}",
        f"- Partial: {status_counts['partial']}",
        f"- Missing: {status_counts['missing']}",
        "",
        "### Labels by Subject",
        "",
    ]
    for subject, count in sorted(counts.items()):
        lines.append(f"- `{subject}`: {count}")

    lines.extend(
        [
            "",
            "## Immediate Foundation Priorities",
            "",
            "1. Finish set algebra declarations and theorem statements: symmetric difference, monotone/antitone set operations, De Morgan, indexed distributivity, covers, subcovers, and finite-intersection property.",
            "2. Expand relation algebra: identity/null/universal relations, relation inclusion/equality/Boolean operations, converse laws, composition laws, transitive/equivalence closures, and many-to-one/many-place classifications.",
            "3. Add equivalence/quotient foundations: equivalence class, quotient set, index, canonical surjection, partition, representative independence, equivalence-partition theorem, and quotient universal property.",
            "4. Split function foundations into total Lean functions and function-as-relation interfaces: functional relation, total-on-domain, partial function, graph, codomain, empty/inclusion/constant maps, inverse and one-sided inverse laws.",
            "5. Add order interfaces from the book: ordered set variants, comparable/incomparable, bounds and extremal elements, order maps/isomorphisms, induced/suborders, sup/inf, lattices, order extensions, and Zorn/Hausdorff choice equivalents.",
            "6. Add cardinality foundations: equipotence, finite/infinite, countable/uncountable, cardinal comparison, function spaces, Cantor, Schroeder-Bernstein, and countability theorems.",
            "",
            "Dense-order requirements are not part of the Volume I set-theory inventory scanned here. They should be introduced where the number-system material needs them, then imported from a deliberately named order/number-system layer.",
            "",
            "## Crosswalk",
            "",
        ]
    )

    for subject in sorted(rows_by_subject):
        lines.extend([f"### {subject}", "", "| Status | Label | Title | Book Source | Lean Candidates | Note |", "|---|---|---|---|---|---|"])
        for label, status, note, matches in rows_by_subject[subject]:
            title = label.title.replace("|", "\\|") or "-"
            source = f"`{label.file.relative_to(VOLUME_I_ROOT).as_posix()}:{label.line}`"
            candidates = ", ".join(f"`{decl.name}`" for decl in matches) or "-"
            lines.append(f"| {status} | `{label.label}` | {title} | {source} | {candidates} | {note} |")
        lines.append("")

    return "\n".join(lines) + "\n"


def main() -> None:
    if not VOLUME_I_ROOT.exists():
        raise SystemExit(f"Volume I source not found: {VOLUME_I_ROOT}")
    labels = collect_book_labels()
    decls = collect_lean_decls()
    REPORT_PATH.parent.mkdir(parents=True, exist_ok=True)
    REPORT_PATH.write_text(render(labels, decls), encoding="utf-8")
    print(f"wrote {REPORT_PATH}")
    print(f"book labels: {len(labels)}")
    print(f"lean declarations: {len(decls)}")


if __name__ == "__main__":
    main()
