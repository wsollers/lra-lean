# Relation/Order Repair Coordinator

Durable resume surface for reworking `LRA/Relation` and `LRA/Order` onto the
Interface/Constructions pattern already proven on `LRA/Set`,
`LRA/Identity`, and (in progress) `LRA/AlgebraicStructures` — same
ledger/status/prompts shape, same two-gate discipline. Sibling to, but
tracked independently from, `docs/algebraic-structures-repair/` (see that
coordinator's own README/DECISIONS for the shape this one mirrors; do not
add Relation/Order items to *its* ledger — this is a separate effort by
explicit choice).

## Why this exists

`LRA/Order` (151 files, 380 `sorry`s) and `LRA/Relation` (48 files) are both
still flat, generic-only modules — no `Interface`/`Constructions` split, no
`ModelTheory`, no concrete implementations. Read `LRA/Set/Interface.lean`,
`LRA/Set/Constructions/ZFCSet.lean`, and
`LRA/Set/Constructions/ZFCSet/Interface/ModelTheory/Theory.lean` for a
working example of the target shape before starting on any item here.

**The math fact driving the sequencing**: a set-theoretic relation *is* a
set of ordered pairs, not the `Carrier → Carrier → Prop` predicate
`LRA.Relation.Endorelation` currently uses. A `Poset` is a set with a
relation on it, and that relation is itself a set. `Relation` therefore has
to be restructured — with a real, set-based construction of "relation" —
*before* `Order`'s components can get real set-based constructions of their
own. That's item `or-01`, and nothing in `Order` starts before it lands.

**This pushes past the current `AlgebraicStructures/*/Constructions/Set/*`
convention, deliberately.** That convention (see
`docs/algebraic-structures-repair/DECISIONS.md`) builds subsets via the
*ambient* `LRA_Set` alias (`LRA.Set.Interop.Switch.LRA_Set := _root_.Set`,
Mathlib's own `Set`) — a lightweight, non-axiomatic notion, explicitly
documented in that tree's own code comments as *not* staying inside any
particular set theory's object language ("Building the subset as a `ZFCSet`
object in its own right ... is where Grothendieck-universe care would start
to matter; that's future work, not this" —
`AlgebraicStructures/Magma/Examples/NonemptyZFCSetsUnderUnion.lean`). `or-01`
*is* that future work, scoped to `Relation` specifically: a relation
construction that stays inside `ZFCSet`'s own object language (built via
`HasPairing`/`OrderedPair`, `CartesianProductOf`, `HasSeparation` — see
`LRA/Set/Interface/CartesianProduct.lean` and
`LRA/Set/Constructions/ZFCSet/Axioms/OrderedPair/Theorems.lean`), not the
ambient-predicate shortcut. Don't let `or-01`'s design quietly regress to
the lighter convention because it's easier — that's the whole point of
doing it.

## Files

- `status.md` — human dashboard, current state
- `ledger.json` — machine-readable source of truth, one entry per subject
- `prompts/or-NN-*.md` — per-subject task prompts (created on demand, as
  each subject starts — not all up front)
- `DECISIONS.md` — standing design decisions that apply to every subject

## Coordinator rules

Same discipline as `algebraic-structures-repair`, verbatim:

- Work only on `main`.
- One subject at a time, strictly in tier order (`ledger.json`/`status.md`).
  Do not start subject N+1 until subject N is `done`.
- A subject's dependencies must already be `done` before it starts.
- Per-subject scope is two passes:
  1. **Reorg** (mechanical): `Interface/{Definitions,Laws,ModelTheory}`
     consolidation (only where content already exists to move — do not
     create a `ModelTheory/` or `UniversalAlgebra/` directory for a subject
     until that subject's item is specifically scoped to add one, per
     `validate_structure.py`'s shape rules), empty-stub-file hygiene, import
     fixups.
  2. **Build** (careful, `or-01` and the `Constructions/` half of every
     later item specifically): the actual new content — `SetRelation` for
     `or-01`, `ModelTheory`/`Constructions` for everything after. Every new
     `theorem`/`Prop`-instance gets `sorry` (see DECISIONS.md D-inherit
     below) — only non-`Prop` *data* (the relation/carrier/structure
     definitions themselves) gets written in full.
- Success gate per subject:
  `python scripts/validate_structure.py --path <path>` and
  `lake build <target>` both pass.
- If both gates pass, commit on `main` (do not push unless asked).
- If either gate fails, do not commit; record the failure and the next
  repair step in `ledger.json` and `status.md`.
- **Exclude the metatheory.** No completeness, categoricity, stability,
  quantifier-elimination, or finite-model-property content for any
  component — not even `sorry`d. Useful context goes in a doc-comment
  paragraph, never a Lean declaration.

## Status values

Same as `algebraic-structures-repair`: `not_started`, `reorg_in_progress`,
`reorg_done`, `build_in_progress`, `blocked`, `done`.
