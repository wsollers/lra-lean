<!--
GENERATED FILE — DO NOT EDIT BY HAND.

Source repo: wsollers/lra-governance
Source commit: 24580f56384be0e7d70066be9a19799f9d1c3e0c
Generated from:
- docs/governance/...
- docs/architecture/...
- docs/governance/repo-overlays/lra-lean.md

Regenerate from lra-governance.
Emergency downstream edits must be ported upstream before regeneration.
-->

# LRA Repository Instructions

This file is intended for `.github/instructions/lra.instructions.md`. Keep it
concise and refer to canonical governance docs rather than copying large docs.

## Global Agent Rules

- Treat generated instruction files as derived artifacts.
- Follow the owning repository boundary for every task.
- Do not include secrets, credentials, tokens, or machine-local private values.
- Do not modify mathematical content during governance or wrapper-generation tasks.
- Do not touch the retired `Learning-Real-Analysis` monorepo.
- Keep context small: use governance docs as targeted references, not preload material.
- Open only the workflow, standard, schema, or overlay needed for the current task.
- Port emergency downstream instruction repairs back to `lra-governance`.

## Repo Overlay

# lra-lean Overlay

Stub overlay for Lean formalization.

Owned concerns:

- Lean-specific proof architecture,
- Mathlib policy,
- Lean module and namespace rules,
- Lean CI and validation.

## Agent Scope

Lean guidance applies only to `lra-lean`.
It must not be injected into volume content instructions.

Use the Docker build path for reproducible validation. Do not use LaTeX render
checks as substitutes for Lean validation.

## Implementation Standards

Lean code should be readable formal mathematics, not compressed tactic output.
Follow the existing module style: package declarations under clear namespaces,
use descriptive theorem, definition, hypothesis, and witness names, and keep
proof structure legible enough for a maintainer to match it back to the source
mathematics. Prefer small named lemmas and explicit local structure over dense
anonymous tactic blocks when the proof has reusable mathematical content.

File and module organization should mirror the formal subject matter. New
modules belong under the appropriate `LRA/Volume*/...` tree, imported through
the relevant volume root, and exposed through stable names that make downstream
verification and explorer extraction straightforward.

## Build And Validation

CI builds the repo through `Dockerfile`, then runs Lake inside the container:

```bash
docker build -t lra-lean .
docker run --rm -v "$PWD:/workspace" -w /workspace lra-lean lake build \
  LRAVolumeI LRAVolumeII
```

Local Windows validation should prefer `.\build.ps1 docker-build` followed by
`.\build.ps1 build-all`, which builds the active libraries declared in
`lakefile.lean`. Native `lake build` is acceptable only when the pinned
`lean-toolchain` is installed locally. When adding a Lean volume, add its
`lean_lib` to `lakefile.lean` before extending CI to build it.

## Volume II Verification Map

For Volume II formalization work, each declaration that mirrors a volume
artifact should record a stable mapping back to the LaTeX label. Prefer a
small, grep-friendly metadata comment near the declaration or module section
that includes:

- the Volume II label,
- the Lean module,
- the declaration name,
- the verification status.

The status must distinguish an accepted statement with unfinished proof work
from a checked declaration. Report `checked` only when the declaration is
accepted by the local Lean build without placeholders for that declaration.
This metadata is the source that downstream explorer extraction may use to
populate verification fields.

## Provider Notes

Keep provider-specific guidance concise and defer durable policy to governance docs.
