<!--
GENERATED FILE — DO NOT EDIT BY HAND.

Source repo: wsollers/lra-governance
Source commit: a55609adaf2be4bd68941a4cb78336e56d92a60b
Generated from:
- docs/governance/...
- docs/architecture/...
- docs/governance/repo-overlays/lra-lean.md

Regenerate from lra-governance.
Emergency downstream edits must be ported upstream before the next sync.
-->

# Agent Instructions

## Global Agent Rules

- Treat generated instruction files as derived artifacts.
- Follow the owning repository boundary for every task.
- Do not include secrets, credentials, tokens, or machine-local private values.
- Do not modify mathematical content during governance or wrapper-generation tasks.
- Do not touch `Learning-Real-Analysis/scripts/`.
- Port emergency downstream instruction repairs back to `lra-governance`.

## Repo Overlay

# lra-lean Overlay

Stub overlay for Lean formalization.

Owned concerns:

- Lean-specific proof architecture,
- Mathlib policy,
- Lean module and namespace rules,
- Lean CI and validation,
- sync into the monorepo `lean/` tree.

## Agent Scope

Lean guidance applies only to `lra-lean` and the monorepo `lean/` mirror.
It must not be injected into volume content instructions.

Use the local Lean build and CI expectations for validation. Do not use
LaTeX render checks as substitutes for Lean validation.

## Provider Notes

Codex reads this file as the local agent entrypoint.
