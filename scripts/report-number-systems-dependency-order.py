#!/usr/bin/env python3
"""Report number-system Markdown order implied by Lean imports.

The report is intentionally mechanical:

1. ask Lean for source dependencies of a root module with `--src-deps`;
2. scan those Lean files for `Source: docs/number-systems/...` metadata;
3. collapse repeated Markdown sources to their first dependency occurrence;
4. compare that order with `docs/number-systems/manifest.yaml` and the
   Blueprint generator order.

Lean import order is not the whole mathematical proof order, but it is the
least subjective baseline for documentation dependency ordering.
"""

from __future__ import annotations

import argparse
import ast
import pathlib
import re
import subprocess
import sys
from dataclasses import dataclass

import yaml

ROOT = pathlib.Path(__file__).resolve().parents[1]
DOCS = ROOT / "docs" / "number-systems"
DEFAULT_ROOT = ROOT / "LRA" / "VolumeII.lean"
MANIFEST = DOCS / "manifest.yaml"
BLUEPRINT_SCRIPT = ROOT / "scripts" / "build-number-systems-blueprint.py"

SOURCE_PATTERN = re.compile(r"Source:\s*docs/number-systems/([A-Za-z0-9_.-]+\.md)")
IMPORT_PATTERN = re.compile(r"^\s*import\s+([A-Za-z_][A-Za-z0-9_'.]*)\s*$")


@dataclass(frozen=True)
class SourceOccurrence:
    source: str
    lean_file: pathlib.Path


@dataclass(frozen=True)
class OrderConstraint:
    before: str
    after: str
    importer: pathlib.Path
    dependency: pathlib.Path


def relative_to_root(path: pathlib.Path) -> pathlib.Path:
    try:
        return path.resolve().relative_to(ROOT)
    except ValueError:
        return path


def lean_source_dependencies(root_file: pathlib.Path) -> list[pathlib.Path]:
    command = ["lake", "env", "lean", "--src-deps", str(root_file)]
    result = subprocess.run(
        command,
        cwd=ROOT,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        check=False,
    )
    if result.returncode != 0:
        print(result.stderr, file=sys.stderr)
        raise SystemExit(result.returncode)

    paths: list[pathlib.Path] = []
    for raw_line in result.stdout.splitlines():
        line = raw_line.strip()
        if not line or not line.lower().endswith(".lean"):
            continue
        path = pathlib.Path(line)
        if not path.is_absolute():
            path = ROOT / path
        if path.exists() and ROOT in path.resolve().parents:
            paths.append(path.resolve())
    return paths


def module_source_path(module: str) -> pathlib.Path | None:
    parts = module.split(".")
    file_path = ROOT.joinpath(*parts).with_suffix(".lean")
    if file_path.exists():
        return file_path.resolve()
    init_path = ROOT.joinpath(*parts, "Init.lean")
    if init_path.exists():
        return init_path.resolve()
    return None


def imported_modules(path: pathlib.Path) -> list[str]:
    modules: list[str] = []
    for line in path.read_text(encoding="utf-8").splitlines():
        match = IMPORT_PATTERN.match(line)
        if match:
            modules.append(match.group(1))
    return modules


def local_import_closure(root_file: pathlib.Path) -> list[pathlib.Path]:
    seen: set[pathlib.Path] = set()
    ordered: list[pathlib.Path] = []

    def visit(path: pathlib.Path) -> None:
        path = path.resolve()
        if path in seen:
            return
        seen.add(path)
        for module in imported_modules(path):
            if not module.startswith("LRA."):
                continue
            dependency = module_source_path(module)
            if dependency is not None:
                visit(dependency)
        ordered.append(path)

    visit(root_file)
    return ordered


def markdown_sources_in(path: pathlib.Path) -> list[str]:
    text = path.read_text(encoding="utf-8")
    return SOURCE_PATTERN.findall(text)


def lean_order_constraints(files: list[pathlib.Path]) -> list[OrderConstraint]:
    source_by_file = {path: markdown_sources_in(path) for path in files}
    constraints: list[OrderConstraint] = []
    seen: set[tuple[str, str, pathlib.Path, pathlib.Path]] = set()
    for importer in files:
        importer_sources = source_by_file.get(importer, [])
        if not importer_sources:
            continue
        for module in imported_modules(importer):
            if not module.startswith("LRA."):
                continue
            dependency = module_source_path(module)
            if dependency is None:
                continue
            dependency_sources = source_by_file.get(dependency, [])
            for before in dependency_sources:
                for after in importer_sources:
                    if before == after:
                        continue
                    key = (before, after, importer, dependency)
                    if key in seen:
                        continue
                    seen.add(key)
                    constraints.append(
                        OrderConstraint(
                            before=before,
                            after=after,
                            importer=relative_to_root(importer),
                            dependency=relative_to_root(dependency),
                        )
                    )
    return constraints


def lean_induced_markdown_order(root_file: pathlib.Path) -> tuple[list[str], list[SourceOccurrence]]:
    lean_source_dependencies(root_file)
    seen: set[str] = set()
    order: list[str] = []
    occurrences: list[SourceOccurrence] = []
    for dependency in local_import_closure(root_file):
        for source in markdown_sources_in(dependency):
            occurrences.append(SourceOccurrence(source, relative_to_root(dependency)))
            if source not in seen:
                seen.add(source)
                order.append(source)
    return order, occurrences


def manifest_order() -> list[str]:
    document = yaml.safe_load(MANIFEST.read_text(encoding="utf-8")) or {}
    chapters = document.get("chapters", [])
    return [str(row["source"]) for row in sorted(chapters, key=lambda row: row["order"])]


def blueprint_order() -> list[str]:
    module = ast.parse(BLUEPRINT_SCRIPT.read_text(encoding="utf-8"))
    for node in module.body:
        if isinstance(node, ast.Assign):
            if any(isinstance(target, ast.Name) and target.id == "ORDER" for target in node.targets):
                value = ast.literal_eval(node.value)
                return [str(item) for item in value]
    raise RuntimeError("Could not find ORDER in build-number-systems-blueprint.py")


def ordered_intersection(order: list[str], allowed: set[str]) -> list[str]:
    return [item for item in order if item in allowed]


def violated_constraints(
    constraints: list[OrderConstraint],
    candidate: list[str],
) -> list[OrderConstraint]:
    candidate_position = {source: index for index, source in enumerate(candidate)}
    return [
        constraint
        for constraint in constraints
        if constraint.before in candidate_position
        and constraint.after in candidate_position
        and candidate_position[constraint.before] > candidate_position[constraint.after]
    ]


def compare_order(
    name: str,
    reference: list[str],
    constraints: list[OrderConstraint],
    candidate: list[str],
) -> tuple[list[str], list[str]]:
    reference_set = set(reference)
    candidate_set = set(candidate)
    failures: list[str] = []
    notes: list[str] = []

    missing = [source for source in reference if source not in candidate_set]
    extra = [source for source in candidate if source not in reference_set]
    violated = violated_constraints(constraints, candidate)

    if missing:
        failures.append(f"{name} is missing Lean-referenced sources: {', '.join(missing)}")
    if extra:
        notes.append(f"{name} has sources not referenced by Lean root: {', '.join(extra)}")
    if violated:
        preview = "; ".join(
            f"{item.before} before {item.after}"
            for item in violated[:12]
        )
        suffix = "" if len(violated) <= 12 else f"; ... {len(violated) - 12} more"
        failures.append(f"{name} violates Lean import constraints: {preview}{suffix}")

    return failures, notes


def markdown_report(
    root_file: pathlib.Path,
    lean_order: list[str],
    occurrences: list[SourceOccurrence],
    constraints: list[OrderConstraint],
    manifest: list[str],
    blueprint: list[str],
    failures: list[str],
    notes: list[str],
) -> str:
    seen: set[str] = set()
    unique_occurrence_lines: list[str] = []
    for occurrence in occurrences:
        if occurrence.source in seen:
            continue
        seen.add(occurrence.source)
        unique_occurrence_lines.append(
            f"- `{occurrence.source}` first appears via "
            f"[{occurrence.lean_file.as_posix()}]({occurrence.lean_file.as_posix()})"
        )

    manifest_view = ordered_intersection(manifest, set(lean_order))
    blueprint_view = ordered_intersection(blueprint, set(lean_order))
    constraint_lines = [
        f"- `{item.before}` before `{item.after}` "
        f"because [{item.importer.as_posix()}]({item.importer.as_posix()}) imports "
        f"[{item.dependency.as_posix()}]({item.dependency.as_posix()})"
        for item in constraints
    ]

    return "\n".join(
        [
            "# Number-System Dependency Order Report",
            "",
            f"Lean root: `{relative_to_root(root_file).as_posix()}`",
            "",
            "## Lean-Induced Markdown Order",
            "",
            *[f"{index}. `{source}`" for index, source in enumerate(lean_order, 1)],
            "",
            "## First Lean Occurrences",
            "",
            *unique_occurrence_lines,
            "",
            "## Manifest Order Restricted to Lean-Referenced Sources",
            "",
            *[f"{index}. `{source}`" for index, source in enumerate(manifest_view, 1)],
            "",
            "## Blueprint Order Restricted to Lean-Referenced Sources",
            "",
            *[f"{index}. `{source}`" for index, source in enumerate(blueprint_view, 1)],
            "",
            "## Lean Import Constraints",
            "",
            *(constraint_lines or ["- No cross-document Lean import constraints found."]),
            "",
            "## Findings",
            "",
            *(f"- {message}" for message in failures),
            *([] if failures else ["- No manifest or Blueprint violations of Lean import constraints."]),
            "",
            "## Notes",
            "",
            *(f"- {message}" for message in notes),
            *([] if notes else ["- No unreferenced Markdown-order entries found."]),
            "",
        ]
    )


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--root",
        default=str(DEFAULT_ROOT),
        help="Lean root file used for dependency extraction.",
    )
    parser.add_argument(
        "--output",
        default=str(DOCS / "dependency-order-report.md"),
        help="Markdown report path.",
    )
    parser.add_argument(
        "--check",
        action="store_true",
        help="Exit nonzero when manifest or Blueprint order diverges.",
    )
    args = parser.parse_args()

    root_file = pathlib.Path(args.root)
    if not root_file.is_absolute():
        root_file = ROOT / root_file
    output = pathlib.Path(args.output)
    if not output.is_absolute():
        output = ROOT / output

    lean_source_dependencies(root_file)
    files = local_import_closure(root_file)
    lean_order, occurrences = lean_induced_markdown_order(root_file)
    constraints = lean_order_constraints(files)
    manifest = manifest_order()
    blueprint = blueprint_order()
    manifest_failures, manifest_notes = compare_order(
        "manifest.yaml", lean_order, constraints, manifest
    )
    blueprint_failures, blueprint_notes = compare_order(
        "Blueprint ORDER", lean_order, constraints, blueprint
    )
    failures = [*manifest_failures, *blueprint_failures]
    notes = [*manifest_notes, *blueprint_notes]

    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(
        markdown_report(
            root_file,
            lean_order,
            occurrences,
            constraints,
            manifest,
            blueprint,
            failures,
            notes,
        ),
        encoding="utf-8",
    )
    print(f"Wrote {relative_to_root(output)}")

    if failures:
        print("Dependency-order findings:")
        for finding in failures:
            print(f"  - {finding}")
        return 1 if args.check else 0
    print("Manifest and Blueprint satisfy Lean import constraints.")
    if notes:
        print("Notes:")
        for note in notes:
            print(f"  - {note}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
