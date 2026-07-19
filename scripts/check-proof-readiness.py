#!/usr/bin/env python3
"""Reject placeholder mathematics in proof-ready Lean modules.

The checker is intentionally conservative. It does not reject theorem proofs that
contain `sorry`; it rejects vacuous theorem statements, fake definitions, and
`sorry` used to manufacture definitions or structures.
"""

from __future__ import annotations

import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
LEAN_ROOT = ROOT / "LRA"

DECL_RE = re.compile(
    r"(?ms)^\s*(?P<kind>noncomputable\s+def|def|abbrev|structure|inductive|class|"
    r"theorem|lemma|proposition|corollary)\s+(?P<name>[A-Za-z_][A-Za-z0-9_'.]*)"
    r"(?P<body>.*?)(?=^\s*(?:noncomputable\s+def|def|abbrev|structure|inductive|class|"
    r"theorem|lemma|proposition|corollary|namespace|end)\b|\Z)"
)

PROOF_KINDS = {"theorem", "lemma", "proposition", "corollary"}
DEFINITION_KINDS = {"def", "noncomputable def", "abbrev", "structure", "inductive", "class"}


def normalize(text: str) -> str:
    text = re.sub(r"/\-.*?\-/", "", text, flags=re.S)
    text = re.sub(r"--.*", "", text)
    return text


def check(path: pathlib.Path) -> list[str]:
    errors: list[str] = []
    text = path.read_text(encoding="utf-8")
    clean = normalize(text)

    for match in DECL_RE.finditer(clean):
        kind = match.group("kind")
        name = match.group("name")
        body = match.group("body")
        location = f"{path.relative_to(ROOT)}:{clean.count(chr(10), 0, match.start()) + 1}"

        if kind in PROOF_KINDS:
            signature = body.split(":=", 1)[0]
            if re.search(r":\s*True\s*$", signature.strip()):
                errors.append(f"{location}: {kind} {name} has vacuous conclusion `True`")

        if kind in DEFINITION_KINDS:
            if re.search(r":=\s*True\b", body):
                errors.append(f"{location}: {kind} {name} is a fake definition `:= True`")
            if re.search(r":=\s*by\s*\n?\s*sorry\b", body):
                errors.append(
                    f"{location}: {kind} {name} is manufactured by `sorry`; "
                    "define the object and leave only proof obligations sorry"
                )

    return errors


def main() -> int:
    errors: list[str] = []
    for path in sorted(LEAN_ROOT.rglob("*.lean")):
        errors.extend(check(path))

    if errors:
        print("Proof-readiness check failed:")
        for error in errors:
            print(f"  - {error}")
        return 1

    print("Proof-readiness check passed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
