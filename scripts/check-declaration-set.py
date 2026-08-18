#!/usr/bin/env python3
"""Declaration-set tripwire (§7.4.1).

Collects every fully qualified declaration name in the tree and diffs it against
a git ref. A name present before and absent after is a dropped declaration, and
must appear in the row's §C.1 ledger with a reason.

This is the tripwire, not the audit: it turns a silent drop into a stopped
commit instead of waiting for the per-row ledger. Deleting a theorem that
nothing imports breaks no build, so the build cannot be relied on to catch it.

    scripts/check-declaration-set.py                 # working tree vs HEAD
    scripts/check-declaration-set.py --against REF   # working tree vs REF
    scripts/check-declaration-set.py --allow NAME    # expected removal, repeatable

Names are compared fully qualified. Short names collide across namespaces and
would mask a loss as a survivor.
"""
from __future__ import annotations

import argparse
import re
import subprocess
import sys
from pathlib import Path

ROOTS = ("LRA", "test")

DECL = re.compile(
    r"^(?:@\[[^\]]*\]\s*)?"
    r"(?:noncomputable\s+|private\s+|protected\s+|partial\s+|unsafe\s+|scoped\s+|local\s+)*"
    r"(?:abbrev|def|theorem|lemma|structure|class\s+abbrev|class|inductive|instance|axiom|opaque)"
    r"\s+([A-Za-z_][A-Za-z0-9_'.!?]*)"
)
NAMESPACE = re.compile(r"^namespace\s+([A-Za-z_][A-Za-z0-9_'.]*)")
SECTION_END = re.compile(r"^end\s+([A-Za-z_][A-Za-z0-9_'.]*)")


def strip_comments(text: str) -> str:
    """Remove block comments so commented-out code is not counted."""
    return re.sub(r"/-.*?-/", "", text, flags=re.S)


def declarations(text: str) -> set[str]:
    """Fully qualified declaration names in one module."""
    found: set[str] = set()
    stack: list[str] = []
    for line in strip_comments(text).splitlines():
        opened = NAMESPACE.match(line)
        if opened:
            stack.append(opened.group(1))
            continue
        closed = SECTION_END.match(line)
        if closed:
            if stack and stack[-1] == closed.group(1):
                stack.pop()
            continue
        declared = DECL.match(line)
        if declared:
            prefix = ".".join(stack)
            name = declared.group(1)
            found.add(f"{prefix}.{name}" if prefix else name)
    return found


def from_worktree() -> dict[str, str]:
    out: dict[str, str] = {}
    for root in ROOTS:
        for path in sorted(Path(root).rglob("*.lean")):
            for name in declarations(path.read_text(encoding="utf-8")):
                out.setdefault(name, str(path))
    return out


def from_ref(ref: str) -> dict[str, str]:
    listing = subprocess.run(
        ["git", "ls-tree", "-r", "--name-only", ref, *ROOTS],
        capture_output=True, text=True, check=True).stdout.split()
    out: dict[str, str] = {}
    for path in listing:
        if not path.endswith(".lean"):
            continue
        text = subprocess.run(["git", "show", f"{ref}:{path}"],
                              capture_output=True, text=True).stdout
        for name in declarations(text):
            out.setdefault(name, path)
    return out


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--against", default="HEAD",
                        help="git ref to compare the working tree against")
    parser.add_argument("--allow", action="append", default=[],
                        help="fully qualified name whose removal is expected")
    args = parser.parse_args()

    before = from_ref(args.against)
    after = from_worktree()
    allowed = set(args.allow)

    dropped = sorted(set(before) - set(after) - allowed)
    added = sorted(set(after) - set(before))

    print(f"declarations at {args.against}: {len(before)}")
    print(f"declarations in worktree     : {len(after)}")
    print(f"added                        : {len(added)}")
    print(f"dropped                      : {len(dropped)}"
          + (f" (+{len(allowed & set(before))} allowed)" if allowed else ""))

    if dropped:
        print("\nDROPPED DECLARATIONS -- each needs a ledger entry naming its "
              "surviving owner, or --allow if the removal is intended:\n")
        for name in dropped:
            print(f"  {name}\n      was: {before[name]}")
        return 1

    print("\nNo declaration lost.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
