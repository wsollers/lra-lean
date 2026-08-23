# Prompt: Create Comment Wipe And Regenerate Script

You are working in the `lra-lean` repository.

Current repo constraints:

- Do not run `lake build`.
- Do not rely on validator success.
- The repository is currently not in a safe full-build state because of known
  broken imports to deleted legacy `LRA.Volume*.*` modules.

Relevant existing scripts and data:

- `scripts/harvest_hover_comments.py`
- `scripts/apply_hover_comments.py`
- `scripts/check-hover-docs.py`
- `docs/commentary/hover_comments.json`

Task:

Create or revise a script workflow that:

1. wipes generated theorem/definition doc comments before regeneration
2. repopulates generated comments deterministically from the source comment data
3. avoids duplicating or stacking comments across repeated runs
4. can be run non-interactively
5. is safe to target a subset of the tree or the full `LRA/` tree

Required behavior:

- explicit wipe phase before regenerate phase
- idempotent repeated runs
- machine-readable summary output
- dry-run mode
- path filter support
- clear distinction between generated comments and hand-written comments

Design constraints:

- do not depend on a full Lean build
- prefer extending existing scripts over inventing a parallel workflow
- preserve current repository conventions where possible

Deliverables:

- script design
- exact files to edit or create
- command-line interface proposal
- comment identification strategy
- failure modes and safeguards

Work by static analysis only. Do not build.
