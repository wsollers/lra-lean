#!/usr/bin/env python3
"""Check the Volume I/II Mathlib import policy.

Volume I and Volume II are intended to stay bare Lean except for explicitly
allowed compatibility adapters.  Keep the allow list here so local builds and
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
    pathlib.PurePosixPath("LRA/VolumeII/Switches/NumberSystems.lean"),
    pathlib.PurePosixPath("LRA/VolumeII/Switches/Sets/BackendEnvironment.lean"),
    pathlib.PurePosixPath("LRA/VolumeI/Set/MathlibPredicateSet"),
    pathlib.PurePosixPath("LRA/VolumeI/Set/MathlibZFSet"),
]

ALLOWED_FILENAMES = {
    "MathlibBridge.lean",
    "MathlibAdapters.lean",
    "FailureModes.lean",
}


def relative_posix(path: pathlib.Path) -> pathlib.PurePosixPath:
    return pathlib.PurePosixPath(path.relative_to(ROOT).as_posix())


def is_allowed(path: pathlib.Path) -> bool:
    relative = relative_posix(path)
    return relative.name in ALLOWED_FILENAMES or any(
        relative == prefix or prefix in relative.parents
        for prefix in ALLOWED_PREFIXES
    )


def lean_files() -> list[pathlib.Path]:
    files: list[pathlib.Path] = []
    for root in CHECK_ROOTS:
        if root.is_dir():
            files.extend(sorted(root.rglob("*.lean")))
        elif root.is_file():
            files.append(root)
    return files


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

    if failures:
        for failure in failures:
            print(failure, file=sys.stderr)
        print(
            "ERROR: Mathlib import found in VolumeI/VolumeII outside the allow list.",
            file=sys.stderr,
        )
        print("Allowed prefixes:", file=sys.stderr)
        for prefix in ALLOWED_PREFIXES:
            print(f"  - {prefix}", file=sys.stderr)
        print("Allowed filenames:", file=sys.stderr)
        for filename in sorted(ALLOWED_FILENAMES):
            print(f"  - {filename}", file=sys.stderr)
        return 1

    print("No disallowed Mathlib imports in VolumeI / VolumeII.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
