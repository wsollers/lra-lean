# AlgebraicStructures Repair Coordinator

Durable resume surface for reworking `LRA/AlgebraicStructures/*` structure-by-structure,
bottom-up. Mirrors the `docs/p0-repair/` convention (proven on a 30-item queue in this
repo) — same ledger/status/prompts shape, same two-gate discipline, adapted for this
specific effort.

## Why this exists

`LRA/AlgebraicStructures/Group` was reorganized (Interface/Definitions + Interface/Laws +
Interface/ModelTheory, empty stub files removed) before its own dependencies
(Semigroup, Monoid) were touched. That's backwards — Group depends on Monoid depends on
Semigroup. Fix: do this bottom-up, one subject at a time, gated, with progress kept on
disk so a dropped session doesn't lose the thread.

There is also an open, higher-stakes concern: every `<X>Laws` class in this tree is
shaped like Mathlib's own algebra hierarchy (same field names, same spelling). A wrong
axiom here would still typecheck and still *look* right — nothing in the build catches
that. Literally citing a Mathlib lemma inside `Interface/Laws/*.lean` is already
impossible (those files don't `import Mathlib`; the project's Mathlib quarantine
(`scripts/check-mathlib-imports.py`) blocks it structurally). The real risk is a
silently-wrong axiom, not a build failure — so each subject's `Laws/Definition.lean`
gets a deliberate read-and-check against its textbook definition, not a rubber-stamp,
before we move to the next tier.

## Files

- `status.md` — human dashboard, current state
- `ledger.json` — machine-readable source of truth, one entry per subject
- `prompts/as-NN-*.md` — per-subject task prompts (`spec`, `implement`, `verify`)
- `DECISIONS.md` — standing design decisions that apply to every subject, so they're
  made once and referenced, not re-litigated per structure

## Coordinator rules

- Work only on `main`.
- One subject at a time, strictly in tier order (see `ledger.json` / `status.md`).
  Do not start subject N+1 until subject N is `done`.
- A subject's dependencies (per the adjacency list in `DECISIONS.md`) must already be
  `done` before it starts.
- Per-subject scope is two passes:
  1. **Reorg** (mechanical): `Interface/{Definitions,Laws,ModelTheory}` consolidation,
     empty-stub-file hygiene, import fixups — same pattern already applied to
     `Identity`, `Set`, and `Group`.
  2. **Audit** (careful): read every class/field in that subject's
     `Interface/Laws/Definition.lean` (and any extra atomic-mixin files it needs, e.g.
     `Semiring/Laws/Distributive.lean`-style) against the actual textbook definition of
     the law it claims to state. Fix anything wrong. Do NOT fill in `sorry`s as part of
     this pass — that's separately-scoped future work (ModelTheory/UniversalAlgebra,
     Constructions/Mathlib, Interop/Switch — deferred per earlier agreement).
- Success gate per subject: `python scripts/validate_structure.py --path <path>` and
  `lake build <target>` both pass.
- If both gates pass, commit on `main` (do not push unless asked).
- If either gate fails, do not commit; record the failure and the next repair step in
  `ledger.json` and `status.md`.

## Status values

- `not_started`
- `reorg_in_progress`
- `reorg_done`
- `audit_in_progress`
- `blocked` (dependency not yet done, or a real math question surfaced that needs a
  human call)
- `done`
