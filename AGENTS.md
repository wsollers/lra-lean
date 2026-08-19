<!--
GENERATED POINTER WRAPPER — DO NOT EDIT BY HAND.

Source repo: wsollers/lra-governance
Canonical overlay: capabilities/overlays/lra-lean.md

Regenerate from lra-governance.
Emergency downstream edits must be ported upstream before regeneration.
-->

# Agent Instructions

This repository uses canonical LRA governance by pointer, not by copied rules.

Repository: `lra-lean`
Canonical repo overlay: `capabilities/overlays/lra-lean.md`
Canonical route resolver:
`python <governance-root>/scripts/govpy.py capabilities/resolve.py --repo lra-lean --task "<user task>" --root <repo-root>`
Human route index (lazy reference only): `capabilities/task-index.md`

Resolve canonical governance in this order:

1. `LRA_GOVERNANCE_ROOT`;
2. sibling `../lra-governance`;
3. an explicit `lra-governance` checkout supplied by the build image or task.

If canonical governance cannot be resolved, stop and report that
`lra-governance` is not present.

After resolving canonical governance, run the route resolver. Load its eager
packet only; follow lazy references, tools, schemas, and examples on demand.
If the resolver prints a route catalog instead of a packet (exit code 2), pick
the route whose description matches the task's intent and re-run with
`--route <id>` added.
Do not treat this wrapper as a local source of truth.

Provider note: Codex reads this file as the local entrypoint, then follows canonical governance.
