<!--
GENERATED FILE — DO NOT EDIT BY HAND.

Source repo: wsollers/lra-governance
Source commit: 4bee42dacfdc1158aab182297d91b205598f3f5b
Generated from:
- docs/governance/...
- docs/architecture/...
- docs/governance/repo-overlays/lra-lean.md

Regenerate from lra-governance.
Emergency downstream edits must be ported upstream before regeneration.
-->

# Agent Instructions

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

Repo overlay for Lean formalization.

Owned concerns:

- Lean-specific proof architecture,
- Mathlib policy,
- Lean module and namespace rules,
- configurable number-system constructions,
- theorem-status metadata,
- Lean Blueprint generation,
- Lean CI and validation.

## Agent Scope

Lean guidance applies only to `lra-lean`.
It must not be injected into volume content instructions.

Use the Docker build path for reproducible validation. Do not use LaTeX render
checks as substitutes for Lean validation.

Canonical architecture and layout guidance lives in
`docs/architecture/lra-lean-architecture.md`.

## Namespace Policy

All Volume II declarations belong under the exact root namespace
`LRA.VolumeII`.

Subject namespaces mirror the module tree:

- `LRA.VolumeII.PeanoSystems`;
- `LRA.VolumeII.NaturalNumbers`;
- `LRA.VolumeII.WholeNumbers`;
- `LRA.VolumeII.Integers`;
- `LRA.VolumeII.Rationals`;
- `LRA.VolumeII.Reals`;
- `LRA.VolumeII.NumberSystemTower`.

Construction namespaces are nested beneath their number system. Do not create
compatibility aliases, forwarding namespaces, deprecated module paths, or
duplicate declarations when renaming. Update imports and qualified names in the
same change. A failed stale import is preferred to silent compatibility debt.

## Model and Construction Policy

Each configurable number system uses three explicit layers:

1. a signature containing carrier data, operations, and relations;
2. a proposition-valued law bundle;
3. a model bundling the signature and its law proof.

Use the semantic names:

- `IntegerSignature`, `IntegerLaws`, `IntegerModel`;
- `RationalSignature`, `RationalLaws`, `RationalModel`;
- `RealSignature`, `RealLaws`, `RealModel`.

Generic theorems consume explicit model arguments. Concrete construction modules
prove that their carriers satisfy the shared interface. Do not use global
instances to choose among alternate mathematical universes.

The default construction tower is the canonical integer quotient, canonical
rational fraction quotient, and Dedekind-cut real construction. Alternate
constructions remain separate carrier types and are related by explicit
isomorphism theorems. Do not make alternate constructions definitionally equal
through `abbrev`.

Selectors return bundled models or extensions because construction branches may
have different carrier types. Selection modules are terminal convenience
modules and must not be imported by individual construction modules.

## Quotient and Recursion Architecture

Quotient constructions must use the common representative-independence layer:

1. define a raw representative operation;
2. prove left and right compatibility, or invoke a proved commutative reduction;
3. combine them into full compatibility;
4. lift the operation, predicate, or relation to the quotient.

Peano-recursive operations must use the common iterator architecture. When an
operation depends on a fixed parameter, use the parameterized iterator wrapper
rather than separately rebuilding a family of unary iterators.

Keep recursive existence-and-uniqueness distinct from quotient representative
independence.

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
verification, Blueprint declaration checking, and explorer extraction
straightforward.

Use PascalCase for structures, inductive types, and modules. Use semantic
snake_case for definitions, theorems, lemmas, propositions, and corollaries.
Lean declarations that are mathematically propositions or corollaries may use
the standard `theorem` command when Lean has no distinct command, but their
doc-comment display role must say `Proposition` or `Corollary`.

## Placeholder Proof Policy

Accepted theorem statements may use `sorry` while the user completes proofs.
A declaration containing `sorry` must compile and is recorded as
`statement-accepted-proof-pending`, not as checked.

Ordinary `lake build` must not treat `sorry` warnings as build failures. CI may
publish a separate proof-status report based on axiom footprints, but that
report is informational unless a workflow explicitly targets a no-placeholder
milestone.

Do not replace intended proof obligations with axioms merely to avoid `sorry`.
Use theorem-like declarations with the intended statement and a placeholder
proof.

## Layout Overlay

- Lean source belongs under `LRA/Volume*/...`.
- Active volume roots belong at `LRA/Volume*.lean`.
- Lake library declarations belong in `lakefile.lean`.
- Lean validation and extraction helpers belong under `scripts/`.
- Blueprint sources belong under `blueprint/`.
- GitHub Pages assembly helpers belong under `scripts/` or `website/`.
- Docker and wrapper build entrypoints stay at the repo root.

Do not commit local build products, generated declaration inventories, generated
Blueprint HTML/PDF, or private source PDFs as architecture.

## Build and Validation

```bash
docker build --target lean-build -t lra-lean .
docker run --rm -v "$PWD:/workspace" -w /workspace lra-lean lake build \
  LRAVolumeI LRAVolumeII
```

The documentation target adds Lean Blueprint, Graphviz, and TeX tooling:

```bash
docker build --target documentation-build -t lra-lean-docs .
docker run --rm -v "$PWD:/workspace" -w /workspace lra-lean-docs \
  python3 scripts/check-blueprint-declarations.py
docker run --rm -v "$PWD:/workspace" -w /workspace lra-lean-docs \
  leanblueprint pdf
docker run --rm -v "$PWD:/workspace" -w /workspace lra-lean-docs \
  leanblueprint web
```

Pin Blueprint Python dependencies. Documentation tools are build-time tools and
do not alter the Volume II no-Mathlib dependency policy.

## Lean Blueprint and GitHub Pages

The Blueprint is a published documentation view of the formalization, not an
imported Lean dependency. Each Blueprint node and Lean declaration must share a
stable mathematical identifier. Pull requests build and validate the Blueprint
but do not deploy it. Pushes to `main` build Blueprint HTML/PDF, assemble the
site, and deploy through GitHub Pages using GitHub Actions.

## Volume II Verification Map

For each declaration that mirrors a volume artifact, record:

- the Volume II label;
- the Lean module;
- the declaration name;
- the Blueprint label;
- the verification status.

Report `checked` only when the declaration compiles without placeholders for
that declaration. `statement-accepted-proof-pending` is the correct status for a
compiled statement whose proof contains `sorry`.
