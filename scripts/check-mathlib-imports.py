#!/usr/bin/env python3
"""Check the Volume I/II Mathlib import policy.

Volume I and Volume II keep core definitions and theorem aggregates bare Lean.
Mathlib is quarantined to examples, failure modes, adapters, and explicitly
named interoperability leaves.  Keep the allow list here so local builds and
GitHub Actions enforce the same rule.
"""

from __future__ import annotations

import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]

CHECK_ROOTS = [
    ROOT / "LRA" / "VolumeI",
    ROOT / "LRA" / "VolumeII",
    ROOT / "LRA" / "VolumeI.lean",
    ROOT / "LRA" / "VolumeII.lean",
]

ALLOWED_PREFIXES = [
    pathlib.PurePosixPath("LRA/VolumeI/Logic"),
    pathlib.PurePosixPath("LRA/VolumeII/BasicArithmetic"),
    pathlib.PurePosixPath("LRA/VolumeII/Switches/NumberSystems.lean"),
    pathlib.PurePosixPath("LRA/VolumeII/Switches/Sets/BackendEnvironment.lean"),
    pathlib.PurePosixPath("LRA/VolumeI/Set/MathlibPredicateSet"),
    pathlib.PurePosixPath("LRA/VolumeI/Set/MathlibZFSet"),
]

ALLOWED_PATHS = {
    pathlib.PurePosixPath("LRA/VolumeI/UniversalAlgebra/Models/Satisfaction.lean"),
    pathlib.PurePosixPath("LRA/VolumeI/Order/Interoperability/Mathlib/Bounds.lean"),
    pathlib.PurePosixPath("LRA/VolumeI/Set/ModelTheory/Language.lean"),
    pathlib.PurePosixPath("LRA/VolumeI/Set/ModelTheory/ZFSetModel.lean"),
}

ALLOWED_FILENAMES = {
    "Examples.lean",
    "MathlibBridge.lean",
    "MathlibAdapters.lean",
    "FailureModes.lean",
}

ALLOWED_DIR_PARTS = {
    "Examples",
    "FailureModes",
    "MathlibAdapters",
    "MathlibBridge",
    "Interoperability",
}

CORE_AGGREGATE_ROOTS = [
    ROOT / "LRA" / "VolumeI" / "Map",
    ROOT / "LRA" / "VolumeI" / "Relations",
    ROOT / "LRA" / "VolumeI" / "Order",
]

QUARANTINED_IMPORT_MARKERS = (
    ".Examples",
    ".FailureModes",
    ".MathlibAdapters",
    ".MathlibBridge",
    ".Interoperability.Mathlib",
)


def relative_posix(path: pathlib.Path) -> pathlib.PurePosixPath:
    return pathlib.PurePosixPath(path.relative_to(ROOT).as_posix())


def is_allowed(path: pathlib.Path) -> bool:
    relative = relative_posix(path)
    return (
        relative in ALLOWED_PATHS
        or relative.name in ALLOWED_FILENAMES
        or bool(set(relative.parts) & ALLOWED_DIR_PARTS)
        or any(
            relative == prefix or prefix in relative.parents
            for prefix in ALLOWED_PREFIXES
        )
    )


def lean_files() -> list[pathlib.Path]:
    files: list[pathlib.Path] = []
    for root in CHECK_ROOTS:
        if root.is_dir():
            files.extend(sorted(root.rglob("*.lean")))
        elif root.is_file():
            files.append(root)
    return files


def core_aggregate_files() -> list[pathlib.Path]:
    files: list[pathlib.Path] = []
    for root in CORE_AGGREGATE_ROOTS:
        if not root.exists():
            continue
        files.extend(
            sorted(
                path
                for path in root.rglob("All.lean")
                if not (set(relative_posix(path).parts) & ALLOWED_DIR_PARTS)
            )
        )
    return files


def imported_module(line: str) -> str | None:
    stripped = line.strip()
    if not stripped.startswith("import "):
        return None
    return stripped.split(None, 1)[1]


def main() -> int:
    failures: list[str] = []
    for path in lean_files():
        if is_allowed(path):
            continue
        for line_number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
            if line.startswith("import Mathlib"):
                failures.append(
                    f"{relative_posix(path)}:{line_number}:{line.strip()}"
                )

    aggregate_failures: list[str] = []
    for path in core_aggregate_files():
        for line_number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
            module = imported_module(line)
            if module is None:
                continue
            if module.startswith("Mathlib") or any(
                marker in module for marker in QUARANTINED_IMPORT_MARKERS
            ):
                aggregate_failures.append(
                    f"{relative_posix(path)}:{line_number}:{line.strip()}"
                )

    if failures:
        for failure in failures:
            print(failure, file=sys.stderr)
        print(
            "ERROR: Mathlib import found in VolumeI/VolumeII outside the quarantine allow list.",
            file=sys.stderr,
        )
        print("Allowed prefixes:", file=sys.stderr)
        for prefix in ALLOWED_PREFIXES:
            print(f"  - {prefix}", file=sys.stderr)
        print("Allowed paths:", file=sys.stderr)
        for path in sorted(ALLOWED_PATHS):
            print(f"  - {path}", file=sys.stderr)
        print("Allowed filenames:", file=sys.stderr)
        for filename in sorted(ALLOWED_FILENAMES):
            print(f"  - {filename}", file=sys.stderr)
        return 1

    if aggregate_failures:
        for failure in aggregate_failures:
            print(failure, file=sys.stderr)
        print(
            "ERROR: core All.lean aggregate imports a quarantined example/failure/adapter/Mathlib leaf.",
            file=sys.stderr,
        )
        print(
            "Use AllWithExamples.lean for those imports so core aggregates remain Mathlib-free.",
            file=sys.stderr,
        )
        return 1

    print("No disallowed Mathlib imports in VolumeI / VolumeII.")
    print("No reviewed core All.lean aggregate imports quarantined leaves.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
