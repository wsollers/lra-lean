<!--
GENERATED FILE — DO NOT EDIT BY HAND.

Source repo: wsollers/lra-governance
Source commit: 36fd69ac2e23b406e522c0c753400ce7f3938ff0
Generated from:
- docs/governance/...
- docs/architecture/...
- docs/governance/repo-overlays/lra-lean.md

Regenerate from lra-governance.
Emergency downstream edits must be ported upstream before regeneration.
-->

# Copilot Instructions

Keep this file concise. Point to canonical docs and generated repo instructions
rather than embedding large governance manuals.

## Global Agent Rules

- Treat generated instruction files as derived artifacts.
- Follow the owning repository boundary for every task.
- Do not include secrets, credentials, tokens, or machine-local private values.
- Do not modify mathematical content during governance or wrapper-generation tasks.
- Do not touch the retired `Learning-Real-Analysis` monorepo.
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

Keep provider-specific guidance concise and defer durable policy to governance docs.
