#!/usr/bin/env python3
"""Add a license/copyright header to Lean 4 files (run when you're ready).

Inserts a `/-! ... -/` module docstring at the very top of each file:

  /-!
  SPDX-License-Identifier: BSD-2-Clause
  Copyright (c) <year> <author>. All rights reserved.

  <one-line description>
  -/

Why `/-!` and not `--`: the strip script preserves `/-! -/` (and `/-- -/`) by
default, so this header and your `/-- thm:slug -/` labels both survive future
maintenance runs. A `--`-style SPDX header would get stripped.

Idempotent: skips any file that already has 'SPDX-License-Identifier' or
'Copyright (c)' near the top. The one-line description is seeded from the file's
path (e.g. 'Peano System (Volume II)') for you to edit — search for
'EDIT:' afterwards to refine them.

Dry-run by default. Pass --write to apply. Run on a clean git tree.

Usage:
  python scripts/add_license_header.py LRA --author "Your Name"
  python scripts/add_license_header.py LRA --author "Your Name" --year 2026 --write
"""
import sys, os, argparse, datetime, re

SKIP_DIRS = {'.lake', '.git', 'lake-packages', 'build', '.github'}


def describe(path: str) -> str:
    # turn .../VolumeII/PeanoSystems/PeanoSystem.lean into "Peano System (Volume II)"
    parts = os.path.normpath(path).split(os.sep)
    stem = os.path.splitext(parts[-1])[0]
    words = re.sub(r'(?<!^)(?=[A-Z])', ' ', stem).strip()  # PeanoSystem -> Peano System
    vol = next((p for p in parts if p.startswith('Volume')), '')
    volnice = re.sub(r'(?<!^)(?=[A-Z])', ' ', vol).strip() if vol else ''
    return f"EDIT: {words}" + (f" ({volnice})" if volnice else "")


def already_headed(src: str) -> bool:
    head = '\n'.join(src.split('\n')[:15])
    return 'SPDX-License-Identifier' in head or 'Copyright (c)' in head


def header(author: str, year: int, desc: str) -> str:
    return (
        "/-!\n"
        f"SPDX-License-Identifier: BSD-2-Clause\n"
        f"Copyright (c) {year} {author}. All rights reserved.\n"
        "\n"
        f"{desc}\n"
        "-/\n\n"
    )


def process(path, author, year, write):
    src = open(path, encoding='utf-8').read()
    if already_headed(src):
        return False
    new = header(author, year, describe(path)) + src.lstrip('\n')
    if write:
        open(path, 'w', encoding='utf-8', newline='\n').write(new)
    return True


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('root')
    ap.add_argument('--author', required=True, help='copyright holder, e.g. "Your Name"')
    ap.add_argument('--year', type=int, default=datetime.date.today().year)
    ap.add_argument('--write', action='store_true')
    args = ap.parse_args()

    if os.path.isfile(args.root):
        targets = [args.root]
    else:
        targets = []
        for dp, dns, fns in os.walk(args.root):
            dns[:] = [d for d in dns if d not in SKIP_DIRS]
            targets += [os.path.join(dp, f) for f in fns if f.endswith('.lean')]

    added = 0
    for t in sorted(targets):
        if process(t, args.author, args.year, args.write):
            added += 1
            print(f"{'wrote ' if args.write else 'would add'}  {t}")
    print(f"\n{added}/{len(targets)} files {'headed' if args.write else 'pending'} · "
          f"{'written' if args.write else 'dry-run (use --write)'}")
    if added:
        print("Then: search the tree for 'EDIT:' to refine each one-line description.")


if __name__ == '__main__':
    main()
