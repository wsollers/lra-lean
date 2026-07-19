#!/usr/bin/env python3
"""Check every \lean{...} declaration in the Blueprint with Lean itself.

This avoids adding the external checkdecls package to the Volume II Lake
workspace. The script generates a temporary Lean file containing `#check`
commands, imports the project root, and invokes `lake env lean`.
"""

from __future__ import annotations

import pathlib
import re
import subprocess
import sys
import tempfile

ROOT = pathlib.Path(__file__).resolve().parents[1]
BLUEPRINT_SOURCE = ROOT / "blueprint" / "src"
LEAN_PATTERN = re.compile(r"\\lean\{([^}]*)\}")


def declarations() -> list[str]:
    names: set[str] = set()
    for path in BLUEPRINT_SOURCE.rglob("*.tex"):
        text = path.read_text(encoding="utf-8")
        for match in LEAN_PATTERN.finditer(text):
            for raw_name in match.group(1).split(","):
                name = raw_name.strip()
                if name:
                    names.add(name)
    return sorted(names)


def main() -> int:
    names = declarations()
    if not names:
        print("No Blueprint Lean declarations found.")
        return 0

    source_lines = ["import LRA.VolumeII", ""]
    source_lines.extend(f"#check {name}" for name in names)
    source_lines.append("")

    with tempfile.TemporaryDirectory() as temporary_directory:
        check_file = pathlib.Path(temporary_directory) / "BlueprintDeclarations.lean"
        check_file.write_text("\n".join(source_lines), encoding="utf-8")
        command = ["lake", "env", "lean", str(check_file)]
        print(f"Checking {len(names)} Blueprint declarations with Lean.")
        completed = subprocess.run(command, cwd=ROOT, check=False)
        return completed.returncode


if __name__ == "__main__":
    sys.exit(main())
