<!--
GENERATED POINTER WRAPPER — DO NOT EDIT BY HAND.

Source repo: wsollers/lra-governance
Canonical overlay: docs/governance/repo-overlays/lra-lean.md

Regenerate from lra-governance.
Emergency downstream edits must be ported upstream before regeneration.
-->

# Agent Instructions

This repository uses canonical LRA governance by pointer, not by copied rules.

Repository: `lra-lean`
Canonical task router: `docs/agent-task-index.md`
Canonical repo overlay: `docs/governance/repo-overlays/lra-lean.md`

Resolve canonical governance in this order:

1. `LRA_GOVERNANCE_ROOT`;
2. sibling `../lra-governance`;
3. an explicit `lra-governance` checkout supplied by the build image or task.

If canonical governance cannot be resolved, stop and report that
`lra-governance` is not present.

When working here, read the canonical task router, then load exactly the
smallest relevant governance docs and the canonical repo overlay. Do not treat
this wrapper as a local source of truth.

Provider note: Codex reads this file as the local entrypoint, then follows canonical governance.
