<!--
GENERATED POINTER WRAPPER — DO NOT EDIT BY HAND.

Source repo: wsollers/lra-governance
Canonical overlay: docs/governance/repo-overlays/lra-lean.md

Regenerate from lra-governance.
Emergency downstream edits must be ported upstream before regeneration.
-->

# Claude Instructions

@AGENTS.md

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

If import semantics are unavailable, follow `AGENTS.md` in this repository as
the local pointer wrapper. Do not treat this file as a local source of truth.

Provider note: Claude should import or follow `AGENTS.md`, then follow canonical governance.
