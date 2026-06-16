#!/usr/bin/env python3
"""Strip comments from Lean 4 source files (proper tokenizer, not regex).

Handles correctly:
  - `--` line comments
  - `/- ... -/` block comments WITH nesting
  - string literals (so `--` / `/-` inside `"..."` are left alone)
  - escapes inside strings (`"a\\"b"`)
  - it does NOT special-case char literals, so prime-in-identifier (`x'`,
    `plus_step'`) is never mistaken for a char literal.

By DEFAULT it PRESERVES:
  - `/-- ... -/` doc comments  (these hold your `/-- thm:slug -/` labels)
  - `/-! ... -/` module docs   (these hold the license/header)
so the script is SAFE TO RE-RUN and will never eat a label or the header.

Pass --nuke-docstrings for the ONE-TIME clean slate that also removes doc and
module comments (use this once to clear the old descriptive docstrings).

Dry-run by default. Pass --write to modify files in place.
ALWAYS run on a clean git tree so you can `git diff` and revert.

Usage:
  python scripts/strip_lean_comments.py LRA                      # dry run, default
  python scripts/strip_lean_comments.py LRA --nuke-docstrings    # dry run, clean-slate
  python scripts/strip_lean_comments.py LRA --nuke-docstrings --write
  python scripts/strip_lean_comments.py LRA --write              # later: safe maintenance run
"""
import sys, os, argparse

SKIP_DIRS = {'.lake', '.git', 'lake-packages', 'build', '.github'}


def strip_comments(src: str, keep_docstrings: bool = True) -> str:
    out = []
    i, n = 0, len(src)
    while i < n:
        c = src[i]
        nx = src[i + 1] if i + 1 < n else ''
        # --- string literal: copy verbatim, respect escapes ---
        if c == '"':
            out.append(c); i += 1
            while i < n:
                d = src[i]; out.append(d)
                if d == '\\' and i + 1 < n:
                    out.append(src[i + 1]); i += 2; continue
                i += 1
                if d == '"':
                    break
            continue
        # --- line comment: drop to end of line, keep the newline ---
        if c == '-' and nx == '-':
            while i < n and src[i] != '\n':
                i += 1
            continue
        # --- block / doc / module comment ---
        if c == '/' and nx == '-':
            third = src[i + 2] if i + 2 < n else ''
            is_doc = third == '-'   # /--
            is_mod = third == '!'   # /-!
            preserve = keep_docstrings and (is_doc or is_mod)
            start = i
            depth = 0
            while i < n:
                if src[i] == '/' and i + 1 < n and src[i + 1] == '-':
                    depth += 1; i += 2; continue
                if src[i] == '-' and i + 1 < n and src[i + 1] == '/':
                    depth -= 1; i += 2
                    if depth == 0:
                        break
                    continue
                if not preserve and src[i] == '\n':
                    out.append('\n')   # keep line breaks so structure survives
                i += 1
            if preserve:
                out.append(src[start:i])
            continue
        out.append(c); i += 1
    return ''.join(out)


def tidy(text: str) -> str:
    lines = [ln.rstrip() for ln in text.split('\n')]
    # collapse runs of blank lines to a single blank line
    cleaned, blank = [], False
    for ln in lines:
        if ln == '':
            if not blank:
                cleaned.append('')
            blank = True
        else:
            cleaned.append(ln); blank = False
    # drop leading blanks
    while cleaned and cleaned[0] == '':
        cleaned.pop(0)
    # exactly one trailing newline
    while cleaned and cleaned[-1] == '':
        cleaned.pop()
    return '\n'.join(cleaned) + '\n'


def process(path: str, keep_docstrings: bool, write: bool):
    src = open(path, encoding='utf-8').read()
    new = tidy(strip_comments(src, keep_docstrings))
    if new == src:
        return None
    if write:
        open(path, 'w', encoding='utf-8', newline='\n').write(new)
    return (len(src.split('\n')), len(new.split('\n')))


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('root', help='file or directory to process (e.g. LRA)')
    ap.add_argument('--nuke-docstrings', action='store_true',
                    help='ALSO remove /-- -/ and /-! -/ (one-time clean slate)')
    ap.add_argument('--write', action='store_true',
                    help='modify files in place (default: dry run)')
    args = ap.parse_args()
    keep = not args.nuke_docstrings

    targets = []
    if os.path.isfile(args.root):
        targets = [args.root]
    else:
        for dp, dns, fns in os.walk(args.root):
            dns[:] = [d for d in dns if d not in SKIP_DIRS]
            targets += [os.path.join(dp, f) for f in fns if f.endswith('.lean')]

    changed = 0
    for t in sorted(targets):
        r = process(t, keep, args.write)
        if r:
            changed += 1
            print(f"{'wrote ' if args.write else 'would change'}  {t}  ({r[0]} -> {r[1]} lines)")
    mode = 'docstrings PRESERVED' if keep else 'docstrings NUKED'
    action = 'written' if args.write else 'dry-run (use --write to apply)'
    print(f"\n{changed}/{len(targets)} files changed · {mode} · {action}")


if __name__ == '__main__':
    main()
