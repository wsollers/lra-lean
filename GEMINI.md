<!--
GENERATED POINTER WRAPPER — DO NOT EDIT BY HAND.

Source repo: wsollers/lra-governance
Source revision: unknown
Source documents:
- capabilities/manifest.yaml
- docs/governance/agent-instruction-policy.md
- docs/architecture/generated-file-policy.md
- docs/governance/repo-overlays/lra-lean.md
Canonical overlay: docs/governance/repo-overlays/lra-lean.md

Regenerate from lra-governance.
Emergency downstream edits must be ported upstream before regeneration.
-->

# Gemini Instructions

This repository uses canonical LRA governance by pointer, not by copied rules.

Repository: `lra-lean`
Canonical repo overlay: `docs/governance/repo-overlays/lra-lean.md`
Canonical route resolver:
`python <governance-root>/capabilities/resolve.py --repo lra-lean --task "<user task>" --root <repo-root>`
Human route index (lazy reference only): `docs/agent-task-index.md`

Resolve canonical governance in this order:

1. `LRA_GOVERNANCE_ROOT`;
2. sibling `../lra-governance`;
3. an explicit `lra-governance` checkout supplied by the build image or task.

If canonical governance cannot be resolved, stop and report that
`lra-governance` is not present.

Follow `AGENTS.md` in this repository as the local pointer wrapper, then run
the resolver. Do not treat this file as a local source of truth.

Provider note: Gemini should follow this pointer wrapper and canonical governance.
