#!/usr/bin/env python3
"""Check the Mathlib import policy for the foundational layer.

The foundational subjects and Volume II keep core definitions and theorem
aggregates bare Lean.  Mathlib is quarantined to examples, failure modes,
adapters, interop leaves, and explicitly named exceptions.  Keep the allow list
here so local builds and GitHub Actions enforce the same rule.

The roots below are the foundational *subjects*, not `LRA/VolumeI`.  Pointing
this check at the volume directories was correct until the subject promotion
emptied them; afterwards it silently passed, because it was scanning a tree that
no longer existed.  A quarantine check that names a path can stop checking
anything the moment that path moves, so the roots follow the architecture.
"""

from __future__ import annotations

import argparse
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]

FOUNDATIONAL_SUBJECTS = [
    "Logic",
    "Identity",
    "Set",
    "SetSystems",
    "Relation",
    "Function",
    "Morphism",
    "Operation",
    "Order",
    "UniversalAlgebra",
    "AlgebraicStructures",
]

CHECK_ROOTS = (
    [ROOT / "LRA" / subject for subject in FOUNDATIONAL_SUBJECTS]
    + [ROOT / "LRA" / f"{subject}.lean" for subject in FOUNDATIONAL_SUBJECTS]
    + [
        ROOT / "LRA" / "VolumeII",
        ROOT / "LRA" / "VolumeI.lean",
        ROOT / "LRA" / "VolumeII.lean",
    ]
)

# `LRA/Logic` carries the same exemption `LRA/VolumeI/Logic` did before the
# promotion: its model and semantics layers are stated against Mathlib
# structures.  The Mathlib set backends now live under the explicit quarantine
# tree `LRA/Set/Constructions/Mathlib`, while the order interoperability leaves
# remain under `Interop/`.
ALLOWED_PREFIXES = [
    pathlib.PurePosixPath("LRA/Logic"),
    pathlib.PurePosixPath("LRA/Set/Constructions/Mathlib"),
    pathlib.PurePosixPath("LRA/VolumeII/BasicArithmetic"),
    pathlib.PurePosixPath("LRA/VolumeII/Switches/NumberSystems.lean"),
    pathlib.PurePosixPath("LRA/VolumeII/Switches/Sets/BackendEnvironment.lean"),
]

ALLOWED_PATHS = {
    pathlib.PurePosixPath("LRA/UniversalAlgebra/Satisfaction/Definition.lean"),
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
    "Mathlib",
    "MathlibAdapters",
    "MathlibBridge",
    "Interoperability",
    "Interop",
}

CORE_AGGREGATE_ROOTS = [ROOT / "LRA" / subject for subject in FOUNDATIONAL_SUBJECTS]

QUARANTINED_IMPORT_MARKERS = (
    ".Constructions.Mathlib",
    ".Examples",
    ".FailureModes",
    ".MathlibAdapters",
    ".MathlibBridge",
    ".Interoperability.Mathlib",
    ".Interop.Mathlib",
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


def parse_args(argv: list[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Check that foundational Lean files stay free of quarantined Mathlib imports."
    )
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    parse_args(argv)
    # A check that names paths goes quiet when the paths move, and reports
    # success while doing so.  That is how this file came to be scanning
    # LRA/VolumeI after the promotion emptied it.  Refuse to pass vacuously.
    scanned = lean_files()
    if not scanned:
        print(
            "ERROR: the Mathlib quarantine check found no files to scan. "
            "CHECK_ROOTS no longer resolves to anything on disk.",
            file=sys.stderr,
        )
        return 1
    if not core_aggregate_files() and any(
        (ROOT / "LRA" / subject).is_dir() for subject in FOUNDATIONAL_SUBJECTS
    ):
        # Not an error: All.lean is scheduled for removal, and its absence is
        # the desired end state.  Say so, so the silence is legible.
        print("Note: no core All.lean aggregates found to review.")

    failures: list[str] = []
    for path in scanned:
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
            "ERROR: Mathlib import found in the foundational layer outside the quarantine allow list.",
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

    print("No disallowed Mathlib imports in the foundational subjects or Volume II.")
    print("No reviewed core All.lean aggregate imports quarantined leaves.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
