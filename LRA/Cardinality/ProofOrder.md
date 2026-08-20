# LRA.Cardinality — continuation prompt: populate the proofs

Repo: `wsollers/lra-lean`. Branch: `claude/peano-system-migration-gz028f`
(create locally from latest `origin/main` if it doesn't exist; `main` is
current as of commit `5c8547e5`, which includes the full `LRA.Cardinality`
skeleton this prompt targets).

Governance: this repo follows canonical LRA governance by pointer, not by
copied rules. Before starting, resolve governance per `CLAUDE.md`/`AGENTS.md`
at the repo root (`LRA_GOVERNANCE_ROOT`, else sibling `../lra-governance`,
else an explicit checkout) and run the route resolver for this task:

```
python <governance-root>/scripts/govpy.py capabilities/resolve.py \
  --repo lra-lean --task "prove LRA.Cardinality theorems" --root <repo-root>
```

Follow whatever it returns (naming conventions, doc-comment shape,
PascalCase for new public declarations, etc.) — the notes below describe
*what* to prove, not governance mechanics.

## Task

`LRA.Cardinality` was stood up as a new top-level subject with every
theorem statement accepted but every proof left as `sorry`, per this
migration's standing policy of never completing a proof while laying down
structure. That policy is now lifted **for this subject specifically**:
the ask is to actually prove the 20 outstanding `sorry`s. If you hit a
theorem that turns out to be false as stated, or that needs an axiom this
repo hasn't decided to take (see Choice, below), stop and flag it rather
than silently weakening or deleting the statement.

Three files, 20 theorems, all in `namespace LRA.Cardinality`:

### `LRA/Cardinality/Theorems.lean` (8 sorries) — the core preorder/equivalence algebra
- `EquinumerousReflexive`, `EquinumerousSymmetric`, `EquinumerousTransitive`
  — build directly from `id`, function inverse, and composition. Check
  `LRA/Function/Operations/Composition/Theorems.lean` and
  `LRA/Function/Canonical/Identity/Theorems.lean` first — the closure
  properties of `Injective`/`Surjective`/`Bijective` under `id`/`∘`/inverse
  may already be proved there and just need citing, not reproving.
- `DominatesReflexive`, `DominatesTransitive`, `DominatesOfEquinumerous`
  — same pattern, one direction only (injective, not bijective).
- `CantorSchroederBernstein` — the real work in this file. No Mathlib is
  available to this subject (`LRA.Cardinality` is a
  `LRAStandardizedFoundations` root; Mathlib-backed carriers are only
  permitted from `LRA.NumberSystems`/`VolumeII` onward). Prove it from
  scratch — the classical back-and-forth/Knaster–Tarski-style construction
  over `A ⊕ B`-style case splits, or the fixed-point argument, built on
  this repo's own `LRA.Function`/`LRA.Relation` vocabulary. This is a real
  multi-step proof, not a one-liner.
- `CantorTheorem` — the diagonal argument: given `f : A → (A → Prop)`
  surjective, derive a contradiction from the diagonal set
  `fun a => ¬ f a a`. Standard, but write it out against this repo's
  `Surjective := RightTotal (Graph f)` unfolding rather than assuming a
  Mathlib-shaped `Function.Surjective`.
- `StrictlyDominatesPowerset` — combine `CantorTheorem` with the singleton
  embedding `a ↦ (· = a) : A → (A → Prop)` (injective) plus
  `DominatesOfEquinumerous`/definitions to rule out `Equinumerous`.

### `LRA/Cardinality/Properties/Finiteness/Theorems.lean` (5 sorries)
- `IsFiniteCongr` — transport `IsFinite` along `Equinumerous`, via
  `EquinumerousTransitive`/`EquinumerousSymmetric` from `Theorems.lean`.
- `NotBothFiniteAndInfinite` — immediate from `IsInfinite := ¬ IsFinite`.
- `FiniteImpliesDedekindFinite` — the choice-free direction: if `A` is
  equinumerous with `Fin n`, no injective self-map of `Fin n` can miss a
  value (pigeonhole on a finite type). This likely needs an explicit
  pigeonhole/counting lemma over `Fin n` — check whether one already
  exists anywhere in the repo (`LRA.Cardinality` or elsewhere) before
  writing it from scratch.
- `DedekindInfiniteImpliesInfinite` — literally the contrapositive of
  `FiniteImpliesDedekindFinite`; should be near-free once that one lands.
- `DominatesOfFiniteInfinite` — a finite `A` (via `Fin n`) injects into
  any infinite `B`: needs "an infinite type has at least `n` distinct
  elements for every `n`," which itself may need a short inductive
  argument (build the injection into `B` one `Fin`-index at a time,
  using `IsInfinite B` to always find an unused witness). Flag if this
  turns out to secretly need Choice for the general case.

### `LRA/Cardinality/Properties/Countability/Theorems.lean` (6 sorries)
- `FiniteImpliesCountable`, `CountablyInfiniteImpliesCountable`,
  `CountablyInfiniteImpliesInfinite`, `IsCountableCongr` — same
  transport/definitional-unfolding style as the Finiteness file; should
  compose cleanly out of `Theorems.lean` and `Finiteness/Theorems.lean`
  once those land.
- `DominatesCountableIsCountable` — downward closure under domination:
  compose the given injection `A → B` with `B`'s injection into `Nat`
  (`DominatesTransitive`).
- `CountableSigmaOfCountableIndexCountableFibers` — **the one theorem
  explicitly documented as needing the Axiom of Choice** (its doc comment
  already says so: "needs the axiom of choice, to select an enumeration
  of each fiber simultaneously"). Lean 4 core has `Classical.choice`
  available without any Mathlib import — using it here is in scope (it's
  a documented AC-dependent theorem, not a silent axiom smuggle). If you
  use it, make sure the proof or its doc comment says so explicitly, the
  same way the statement already does.

## Working rules while doing this

- No Mathlib in any of these three files or their transitive deps —
  `LRA.Cardinality` sits in `LRAStandardizedFoundations`, which is
  Mathlib-free. Build proofs from Lean 4 core plus this repo's own
  `LRA.Function`/`LRA.Relation` lemma libraries.
- Before reproving something, grep for it — `LRA.Function.Operations`,
  `LRA.Function.Canonical`, `LRA.Function.Properties.Theorems` likely
  already carry several of the injective/surjective/bijective closure
  facts these proofs need as building blocks.
- Preserve every theorem's statement exactly (type signature, hypothesis
  names) unless you find a genuine error in the statement itself — if so,
  stop and report it rather than silently changing it.
- New declarations you add in service of a proof (helper lemmas, etc.)
  use PascalCase per governance and get the same doc-comment shape
  ("Logical form" block) as the surrounding file.
- Run `python3 scripts/check-declaration-set.py --against HEAD` before
  every commit — pass `--allow NAME` for any confirmed helper-lemma
  addition; investigate anything unexpected in `dropped`.
- Commit messages: no model-identity mentions. Develop and push on
  `claude/peano-system-migration-gz028f`. Only merge to `main` when
  explicitly told to.
- No Lean toolchain is available in the remote environment this was
  drafted in — `lake build` runs locally; report back what's confirmed
  vs. still failing to type-check if you can't build directly.

## Suggested order

`Theorems.lean` first (everything downstream depends on it, and
`CantorSchroederBernstein`/`CantorTheorem` are the two genuinely hard
proofs — get those done first while context is freshest), then
`Finiteness/Theorems.lean`, then `Countability/Theorems.lean` last (it
imports both and its final theorem is the Choice-dependent one, best
saved for when the easier 19 are confirmed solid).
