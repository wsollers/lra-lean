<!--
GENERATED FILE — DO NOT EDIT BY HAND.

Source repo: wsollers/lra-governance
Source commit: b08b957f5a70a9b4bc4db167be8f5fa6e5a94aae
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

Stub overlay for Lean formalization.

Owned concerns:

- Lean-specific proof architecture,
- Mathlib policy,
- Lean module and namespace rules,
- Lean CI and validation.

## Agent Scope

Lean guidance applies only to `lra-lean`.
It must not be injected into volume content instructions.

Use the local Lean build and CI expectations for validation. Do not use
LaTeX render checks as substitutes for Lean validation.

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

Codex reads this file as the local agent entrypoint.
