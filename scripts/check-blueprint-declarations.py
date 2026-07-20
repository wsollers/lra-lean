#!/usr/bin/env python3
"""Validate mapped number-system Blueprint declarations against Lean sources."""

from __future__ import annotations

import pathlib
import re
import sys

import yaml

ROOT = pathlib.Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "docs" / "number-systems" / "declarations.yaml"

DECLARATION_PATTERN = re.compile(
    r"^\s*(?:noncomputable\s+)?(?:private\s+)?"
    r"(def|theorem|lemma|axiom|structure|inductive|class|abbrev)\s+"
    r"([A-Za-z_][A-Za-z0-9_'.]*)",
    re.MULTILINE,
)
NAMESPACE_PATTERN = re.compile(r"^\s*namespace\s+([A-Za-z_][A-Za-z0-9_'.]*)\s*$")
END_PATTERN = re.compile(r"^\s*end(?:\s+[A-Za-z_][A-Za-z0-9_'.]*)?\s*$")
MAPPED_STATUSES = {
    "statement-mapped-proof-sorry",
    "definition-mapped",
    "proved",
}


def module_path(module: str) -> pathlib.Path:
    parts = module.split(".")
    file_path = ROOT.joinpath(*parts).with_suffix(".lean")
    if file_path.exists():
        return file_path
    init_path = ROOT.joinpath(*parts, "Init.lean")
    return init_path


def declarations_in(path: pathlib.Path) -> set[str]:
    names: set[str] = set()
    namespace_stack: list[str] = []
    for line in path.read_text(encoding="utf-8").splitlines():
        namespace = NAMESPACE_PATTERN.match(line)
        if namespace:
            namespace_stack.extend(part for part in namespace.group(1).split(".") if part)
            continue
        if END_PATTERN.match(line):
            if namespace_stack:
                namespace_stack.pop()
            continue
        declaration = DECLARATION_PATTERN.match(line)
        if not declaration:
            continue
        name = declaration.group(2)
        names.add(name)
        if "." not in name and namespace_stack:
            names.add(".".join(namespace_stack + [name]))
    return names


def main() -> int:
    if not MANIFEST.exists():
        print(f"Missing generated manifest: {MANIFEST.relative_to(ROOT)}", file=sys.stderr)
        return 1

    document = yaml.safe_load(MANIFEST.read_text(encoding="utf-8")) or {}
    failures: list[str] = []
    cache: dict[pathlib.Path, set[str]] = {}

    for row in document.get("declarations", []):
        status = row.get("status")
        module = row.get("lean_module")
        declaration = row.get("lean_declaration")
        if status not in MAPPED_STATUSES:
            continue
        if not module or not declaration:
            failures.append(f"{row.get('id')}: mapped status lacks Lean module/declaration")
            continue
        path = module_path(str(module))
        if not path.exists():
            failures.append(f"{row.get('id')}: Lean module not found: {module}")
            continue
        if path not in cache:
            cache[path] = declarations_in(path)
        declared = str(declaration)
        suffix = declared.rsplit(".", 1)[-1]
        if declared not in cache[path] and suffix not in cache[path]:
            failures.append(f"{row.get('id')}: declaration not found in {module}: {declaration}")

    if failures:
        print("Blueprint declaration mapping failures:", file=sys.stderr)
        for failure in failures:
            print(f"  - {failure}", file=sys.stderr)
        return 1

    print(f"Checked Blueprint declaration mappings in {MANIFEST.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
