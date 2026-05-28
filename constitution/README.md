# constitution/

This directory contains the project-wide mathematical and stylistic
standards for `lra-lean`.

All files in this directory (`.md` files and prompt files) are read
by Codex before generating any content. See `DESIGN.md §2` for the
full policy.

## Contents

| File | Purpose |
|---|---|
| `README.md` | This file — directory index |
| `mathematical-standards.md` | Mathematical correctness rules |
| `style-standards.md` | Lean 4 style and formatting rules |
| `proof-standards.md` | Proof quality and architecture rules |

## Adding a New Standard

Create a new `.md` file in this directory. It will be automatically
picked up by Codex and enforced on the next generation run.

File naming convention: `{topic}-standards.md`
