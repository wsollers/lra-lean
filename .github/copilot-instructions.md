<!--
GENERATED POINTER WRAPPER — DO NOT EDIT BY HAND.

Source repo: wsollers/lra-governance
Canonical overlay: docs/governance/repo-overlays/lra-lean.md

Regenerate from lra-governance.
Emergency downstream edits must be ported upstream before regeneration.
-->

# Copilot Instructions

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

Follow `AGENTS.md` in this repository as the local pointer wrapper. Do not
treat this file as a local source of truth.

Provider note: Keep provider-specific guidance concise and defer durable policy to canonical governance.

<!-- mermaid-ai-skills:start -->
## Mermaid Diagrams

When the user asks to create, edit, or visualize a diagram, follow the
instructions in `.github/instructions/mermaid.instructions.md`.
<!-- mermaid-ai-skills:end -->
