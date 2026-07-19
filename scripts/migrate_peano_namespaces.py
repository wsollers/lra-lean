#!/usr/bin/env python3
"""Migrate the legacy `Peano` namespace without compatibility aliases.

The migration is path-aware:
- abstract Peano-system declarations move to `LRA.VolumeII.PeanoSystems`;
- concrete natural-number declarations move to `LRA.VolumeII.NaturalNumbers`.

Qualified references are rewritten from a declaration inventory generated from the
source tree before the namespace blocks are changed. Natural-number modules open
the abstract Peano-system namespace so their existing unqualified uses remain
readable and semantic.
"""

from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
LRA_ROOT = ROOT / "LRA"
PEANO_SYSTEMS_ROOT = LRA_ROOT / "VolumeII" / "PeanoSystems"
NATURAL_NUMBERS_ROOT = LRA_ROOT / "VolumeII" / "NaturalNumbers"

DECLARATION_PATTERN = re.compile(
    r"^(?:noncomputable\s+)?(?:def|abbrev|structure|inductive|theorem|lemma|axiom)\s+"
    r"([A-Za-z_][A-Za-z0-9_']*)",
    re.MULTILINE,
)


def lean_files(directory: Path) -> list[Path]:
    return sorted(directory.rglob("*.lean"))


def declaration_map() -> dict[str, str]:
    mapping: dict[str, str] = {}
    for directory, namespace in (
        (PEANO_SYSTEMS_ROOT, "LRA.VolumeII.PeanoSystems"),
        (NATURAL_NUMBERS_ROOT, "LRA.VolumeII.NaturalNumbers"),
    ):
        for path in lean_files(directory):
            text = path.read_text(encoding="utf-8")
            for declaration in DECLARATION_PATTERN.findall(text):
                existing = mapping.get(declaration)
                if existing is not None and existing != namespace:
                    raise RuntimeError(
                        f"Ambiguous legacy declaration Peano.{declaration}: "
                        f"{existing} and {namespace}"
                    )
                mapping[declaration] = namespace
    return mapping


def replace_qualified_references(text: str, mapping: dict[str, str]) -> str:
    # Longest names first prevents a shorter declaration name from capturing a
    # qualified nested name prefix.
    for declaration in sorted(mapping, key=len, reverse=True):
        text = text.replace(
            f"Peano.{declaration}",
            f"{mapping[declaration]}.{declaration}",
        )
    text = text.replace(
        "open Peano",
        "open LRA.VolumeII.PeanoSystems LRA.VolumeII.NaturalNumbers",
    )
    return text


def replace_namespace_block(text: str, namespace: str, open_abstract: bool) -> str:
    replacement = (
        "namespace LRA\n"
        "namespace VolumeII\n"
        f"namespace {namespace}\n"
    )
    if open_abstract:
        replacement += "\nopen LRA.VolumeII.PeanoSystems\n"

    if "namespace Peano" not in text:
        raise RuntimeError("Expected legacy `namespace Peano` block")
    text = text.replace("namespace Peano", replacement, 1)

    end_replacement = (
        f"end {namespace}\n"
        "end VolumeII\n"
        "end LRA"
    )
    if "end Peano" not in text:
        raise RuntimeError("Expected legacy `end Peano` block")
    text = text.replace("end Peano", end_replacement, 1)
    return text


def main() -> None:
    mapping = declaration_map()
    all_files = lean_files(LRA_ROOT)

    for path in all_files:
        original = path.read_text(encoding="utf-8")
        updated = replace_qualified_references(original, mapping)

        if path.is_relative_to(PEANO_SYSTEMS_ROOT):
            updated = replace_namespace_block(
                updated,
                namespace="PeanoSystems",
                open_abstract=False,
            )
        elif path.is_relative_to(NATURAL_NUMBERS_ROOT):
            updated = replace_namespace_block(
                updated,
                namespace="NaturalNumbers",
                open_abstract=True,
            )

        if updated != original:
            path.write_text(updated, encoding="utf-8")

    leftovers: list[str] = []
    for path in all_files:
        text = path.read_text(encoding="utf-8")
        if re.search(r"^namespace Peano\b", text, re.MULTILINE):
            leftovers.append(f"legacy namespace declaration: {path.relative_to(ROOT)}")
        if re.search(r"\bPeano\.[A-Za-z_]", text):
            leftovers.append(f"legacy qualified reference: {path.relative_to(ROOT)}")
        if re.search(r"^open Peano\b", text, re.MULTILINE):
            leftovers.append(f"legacy open command: {path.relative_to(ROOT)}")

    if leftovers:
        raise RuntimeError("\n".join(leftovers))

    print(
        f"Migrated {len(mapping)} declarations from the legacy Peano namespace."
    )


if __name__ == "__main__":
    main()
