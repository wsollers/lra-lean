#!/usr/bin/env python3
"""Reconcile the compiled LRA environment with source declarations.

Run after a successful build:

    lake env lean --run scripts/DumpNamespaceEnvironment.lean
    python scripts/generate_namespace_inventory.py

The Lean dumper identifies every constant by its defining module.  This script
adds source evidence, applies stable API classifications, sorts deterministically,
and writes both namespace-inventory.tsv and namespace-review.md.
"""

from __future__ import annotations

import csv
import hashlib
import re
import subprocess
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
RAW = ROOT / "build" / "namespace-environment.tsv"
INVENTORY = ROOT / "namespace-inventory.tsv"
REVIEW = ROOT / "namespace-review.md"

DECLARATION_RE = re.compile(
    r"^\s*(?:@\[[^]]*\]\s*)*"
    r"(?:(?:private|protected|noncomputable|unsafe)\s+)*"
    r"(?:abbrev|axiom|class(?:\s+abbrev)?|def|inductive|lemma|opaque|structure|theorem)\s+"
    r"(?:«([^»]+)»|([^\s(:{\[]+))"
)


def module_source(module: str) -> Path:
    return ROOT / (module.replace(".", "/") + ".lean")


def strip_lean_comments(text: str) -> str:
    """Remove nested block and line comments while preserving line boundaries."""
    result: list[str] = []
    index = 0
    depth = 0
    in_string = False
    while index < len(text):
        pair = text[index : index + 2]
        char = text[index]
        if depth:
            if pair == "/-":
                depth += 1
                index += 2
            elif pair == "-/":
                depth -= 1
                index += 2
            else:
                if char == "\n":
                    result.append(char)
                index += 1
            continue
        if not in_string and pair == "/-":
            depth = 1
            index += 2
            continue
        if not in_string and pair == "--":
            newline = text.find("\n", index + 2)
            if newline < 0:
                break
            result.append("\n")
            index = newline + 1
            continue
        result.append(char)
        if char == '"' and (index == 0 or text[index - 1] != "\\"):
            in_string = not in_string
        index += 1
    return "".join(result)


def source_names(path: Path) -> set[str]:
    if not path.exists():
        return set()
    names: set[str] = set()
    text = strip_lean_comments(path.read_text(encoding="utf-8"))
    for line in text.splitlines():
        match = DECLARATION_RE.match(line)
        if match:
            declared = match.group(1) or match.group(2)
            names.add(declared.rpartition(".")[2])
    return names


def split_name(name: str) -> tuple[str, str]:
    namespace, separator, short = name.rpartition(".")
    return (namespace if separator else "_root_", short if separator else name)


def classify(row: dict[str, str], authored_names: set[str]) -> str:
    env_class = row["environment_class"]
    if env_class != "authored_candidate":
        return env_class
    short = split_name(row["fq_name"])[1]
    if short in authored_names:
        return "authored"
    if any(
        marker in row["fq_name"]
        for marker in (".match_", ".below", ".brecOn", ".noConfusion", ".eq_")
    ):
        return "generated_companion"
    return "generated_or_elaborated"


def run_git(*args: str) -> str:
    completed = subprocess.run(
        ["git", *args], cwd=ROOT, check=True, capture_output=True, text=True
    )
    return completed.stdout.strip()


def main() -> None:
    if not RAW.exists():
        raise SystemExit(
            "missing build/namespace-environment.tsv; run the Lean dumper first"
        )

    with RAW.open(encoding="utf-8", newline="") as stream:
        raw_rows = list(csv.DictReader(stream, delimiter="\t"))

    source_cache: dict[str, set[str]] = {}
    rows: list[dict[str, str]] = []
    for raw in raw_rows:
        module = raw["module"]
        source_file = module.replace(".", "/") + ".lean"
        authored_names = source_cache.setdefault(
            module, source_names(module_source(module))
        )
        namespace, short = split_name(raw["fq_name"])
        evidence = classify(raw, authored_names)
        api_status = raw["api_status"]
        if evidence.startswith("private_"):
            api_status = "private"
        rows.append(
            {
                "fq_name": raw["fq_name"],
                "short_name": short,
                "namespace": namespace,
                "kind": raw["kind"],
                "module": module,
                "source_file": source_file,
                "evidence_class": evidence,
                "api_status": api_status,
                "type_summary": raw["type_summary"],
                "universe_params": raw["universe_params"],
                "canonical_owner": raw["fq_name"],
                "disposition": "KEEP_INTERNAL" if api_status != "public" else "KEEP",
                "notes": "compiled environment plus reconciled source scan",
            }
        )

    rows.sort(key=lambda row: row["fq_name"])
    names = [row["fq_name"] for row in rows]
    exact_duplicates = len(names) - len(set(names))
    folded = Counter(name.casefold() for name in names)
    case_collisions = sorted(name for name, count in folded.items() if count > 1)
    source_only = []
    known_by_module: dict[str, set[str]] = {}
    for row in rows:
        if row["evidence_class"] == "authored":
            known_by_module.setdefault(row["module"], set()).add(row["short_name"])
    for module, declared in source_cache.items():
        missing = declared - known_by_module.get(module, set())
        source_only.extend((module, name) for name in sorted(missing))

    fieldnames = list(rows[0]) if rows else []
    with INVENTORY.open("w", encoding="utf-8", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fieldnames, delimiter="\t", lineterminator="\n")
        writer.writeheader()
        writer.writerows(rows)

    digest = hashlib.sha256(INVENTORY.read_bytes()).hexdigest()
    evidence_counts = Counter(row["evidence_class"] for row in rows)
    status_counts = Counter(row["api_status"] for row in rows)
    roots = Counter(
        row["fq_name"].split(".")[1]
        for row in rows
        if row["fq_name"].startswith("LRA.") and len(row["fq_name"].split(".")) > 1
    )
    branch = run_git("branch", "--show-current")
    revision = run_git("rev-parse", "HEAD")
    review = f"""# LRA namespace architecture review

## Review metadata

| Item | Value |
|---|---|
| Revision | `{revision}` |
| Branch | `{branch}` |
| Inventory | `{len(rows):,}` compiled-environment rows |
| SHA-256 | `{digest}` |
| Generator | `scripts/DumpNamespaceEnvironment.lean` then `scripts/generate_namespace_inventory.py` |
| Source-only findings | `{len(source_only)}` (parser candidates; see reconciliation note) |
| Exact duplicate names | `{exact_duplicates}` |
| Case-insensitive collisions | `{len(case_collisions)}` |

## Final architecture

Durable public declarations use semantic owners below `LRA`: `Algebra`,
`Analysis` (`Bounds`, `MetricSpaces`, `MeasureTheory`, `FunctionalAnalysis`),
`Map`, `Identity`, `Interop.Mathlib`, `LinearAlgebra`, `Logic`,
`NumberSystems`, `Order`, `Relation`, `Set`, and `Topology`. Curricular module
paths remain under `LRA/Volume*`; they no longer determine declaration names.
`LRA.Internal` contains explicitly non-API orienting and scratch material.

Immediate-root environment counts: {', '.join(f'`{key}` {value}' for key, value in sorted(roots.items()))}.

## Evidence classification

{chr(10).join(f'- `{key}`: {value:,}' for key, value in sorted(evidence_counts.items()))}

API status: {', '.join(f'`{key}` {value:,}' for key, value in sorted(status_counts.items()))}.

The generator loads the freshly built `LRA` aggregate with `Lean.importModules`,
iterates constants by defining module, and reconciles candidate authored names
against each module's source file. Compiler constructors, recursors, projections,
private declarations, other generated companions, authored declarations, and
internal declarations are classified separately. Source parsing is deliberately
conservative: unmatched parser candidates are evidence-review prompts rather
than fabricated inventory rows. Current unmatched candidates: `{len(source_only)}`.

## Ownership decisions

- The nine real-analysis bound predicates have one owner each under
  `LRA.Analysis.Bounds`; derived extremal theorems remain below
  `LRA.Analysis.Bounds.Extremal`.
- `LRA.Order.Bounds` is the separate backend- and relation-generic theory.
- The Volume IV vector-space definition is the pedagogical owner; the duplicate
  Volume VI definition was removed while its extra linear-map declaration was kept.
- Generic map predicates are canonical; the Polish integer development no
  longer declares local duplicates.
- Sequence/convergence and construction-specific model-isomorphism declarations
  that merely share short names remain distinct because their types and domains
  differ.
- `LRA.Order.TotalOrder` is the sole retained intentional compatibility synonym,
  abbreviating `LRA.Order.LinearOrder`. No `Chain` abbreviation was introduced.
- `LRA.Internal.MathematicalSpaces` retains orienting-only mathematical-space
  material; scratch metric structures/examples are under `LRA.Internal`.

## Map and relation foundations

`LRA.Map.Typed.TypedMap (Domain : Type u) (Codomain : Type v)` is the typed
representation. The foundational set-theoretic representation is a separate
domain/codomain/graph triple plus `IsSetTheoreticMap`, whose clauses enforce
graph closure, total evaluation, and unique values. A parallel bundled
set-theoretic relation triple records graph typing without the function laws.
Evaluation existence/uniqueness and map extensionality are provided.

There is exactly one typed-to-set representation theorem family,
`LRA.Map.SetTheoretic.TypedMapGraphRepresentation`. It requires explicit backend
element and object types, ordered-pair and separation operations and laws,
domain/codomain encodings, encoding injectivity/coverage, an ambient pair set,
and graph-pair existence. It constructs a set-theoretic map and proves its
evaluation agrees with the typed map. There are no bridge coercions or automatic
instances.

## Pilot and imports

Obsolete Lean source under `LRA/Pilot` was deleted after review; its useful bounds
ideas were already covered by the durable generic and analysis theories. Semantic
routers are available for all durable roots, including the seven-router combined
smoke test in `test/LRA/SemanticImportsSmoke.lean`.

## Reproducibility and collision notes

The TSV is sorted by full name and emitted with LF line endings. Run the two
generator commands twice; byte-identical SHA-256 values are required. Exact
duplicates are impossible in a Lean environment and are checked again here.
Case-insensitive collisions: {', '.join(f'`{name}`' for name in case_collisions) if case_collisions else 'none'}.
"""
    REVIEW.write_text(review, encoding="utf-8", newline="\n")
    print(f"wrote {len(rows)} rows; sha256={digest}; source-only candidates={len(source_only)}")
    for module, name in source_only:
        print(f"SOURCE_ONLY\t{module}\t{name}")


if __name__ == "__main__":
    main()
