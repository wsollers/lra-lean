# Identity: Direct-Inspection Findings (`[REWORK — CORRECTED]`, and a policy correction)

[← Back to Index](00-index.md)

**Why this file exists.** `13-audit-round-2.md` (Round 2 of the three-way audit) made a claim about `Identity`'s logical-congruence content that was **wrong**, traced to trusting a stale `Identity/ProofsToDo.md` instead of reading actual source. This file records the direct-inspection findings that corrected it, and states the resulting policy: **`ProofsToDo.md` files are never an audit source, in any file, going forward** — they are a personal proof-planning aid the project owner uses, regenerated on demand and frequently out of sync with source by design (per explicit instruction). Every claim about implementation status in this document arc must trace to actual `.lean` source and a real `sorry` count, never to a `ProofsToDo.md` file.

## What went wrong

Round 2 checked `Identity/ProofsToDo.md`, found it listed `EqualitySymmetry`/`EqualityTransitivity` as `State: Sorry` at `./Equality/Theorems.lean#L13`, and concluded logical congruence was "planning-only, not implemented." Direct inspection found:

- `./Equality/Theorems.lean` **does not exist anywhere in the repo.**
- `Identity/ProofsToDo.md` was last regenerated **2026-08-24**.
- `Identity/Theorems/` (the real, current directory) was last restructured **2026-08-27** — a "Restructure interfaces and identity refactor prep" commit, three days after the planning doc's last regeneration.
- The repo's `HEAD` at audit time was **2026-08-29**, five days past the planning doc's last regeneration.

The planning doc describes a pre-refactor layout that the actual restructure commit replaced. It was not merely incomplete — it was describing files that had since been renamed away, which is a materially worse failure mode than "hasn't caught up yet."

## What's actually there — full direct-inspection results

**`LRA/Identity/` structure, confirmed by direct source inspection on September 3, 2026:**
```
Bridges/           -- Diagonal.lean (IdentIsDiagonal)
Constructions/
  Axiomatic/       -- Axioms.lean (honest `axiom` keyword), Satisfies.lean
  Mathlib/         -- Satisfies.lean (Ident := Eq, zero-axiom)
Interface/
  Definitions/     -- IdentityRelation, Distinctness, Witnesses, Cardinality
  Logic/           -- subject-owned equality language/theory packaging
  ModelTheory/     -- router plus LStructure, Model, compatibility Theory
  UniversalAlgebra/-- Signature/Definition, Congruence, Quotient, Extensionality
Theorems/          -- Equivalence, Congruence, Distinctness, Witnesses, ModelTheory, UniversalAlgebra
Interop/           -- Adapters, Providers/{LRA,Mathlib}, Audit
```

**Sorry count across `LRA/Identity/`: three declarations, all in `Theorems/ModelTheory.lean`.**
These are the new second-order characterization theorems for `IsIdentityRelation`:
`IsIdentityRelation.isDiagonal`, `IsIdentityRelation.iff_forall_iff_eq`, and
`IsIdentityRelation.iff_eq_diagonal`.

**Core definition** (`Interface/Definitions/IdentityRelation.lean`) — matches project memory exactly:
```lean
class IdentityRelation (Carrier : Type u) where
  Ident : Carrier → Carrier → Prop
  IdentReflexive : ∀ x : Carrier, Ident x x
  IdentLeibniz : ∀ {x y : Carrier}, Ident x y →
    ∀ Property : Carrier → Prop, Property x → Property y
```
Leibniz substitution is the sole primitive; symmetry and transitivity are derived theorems (`Theorems/Equivalence.lean`), not separately postulated — exactly the discipline the project's `lecture-notes-foundations.md` argues for in general (E1+E2 generate everything else).

**Logical congruence, the fact Round 2 got wrong** (`Theorems/Congruence.lean`) — fully proved, all three forms:
- `IdentPreservesFunctions` — $x \sim y \to f(x) \sim f(y)$, proved via `IdentLeibniz`.
- `IdentPreservesRelations` — $x\sim x' \wedge y \sim y' \to (R\,x\,y \leftrightarrow R\,x'\,y')$, both directions proved.
- `IdentPreservesOperations` — $x\sim x' \wedge y\sim y' \to \mathrm{op}(x,y) \sim \mathrm{op}(x',y')$ — this is precisely the abstract shape the Operations interlude's `RespectsRelation` (Operations §6.7.1) needed, and it already exists here, proved, specialized to `Ident`.

**Collapse theorem** (`Bridges/Diagonal.lean`): `IdentIsDiagonal : Ident x y ↔ x = y` — proved, plus a model-theoretic upgrade (`Theorems/ModelTheory.lean`'s `EqualityStructure.isDiagonal`) stating the same fact for any `EqualityStructure` satisfying the identity theory. The subject now also exposes an explicit second-order style predicate `IsIdentityRelation` and bridge constructors `IdentityRelation.ofIsIdentityRelation` and `EqualityStructure.ofIsIdentityRelation`.

**Two scoped constructions**, exactly as project memory described:
- **Mathlib / zero-axiom** (`Constructions/Mathlib/Satisfies.lean`): `Ident := Eq`, `IdentReflexive := rfl`, `IdentLeibniz := fun h _ hp => h ▸ hp` — no axioms, built entirely on Lean's native `Eq`.
- **Axiomatic / three-axiom** (`Constructions/Axiomatic/{Axioms,Satisfies}.lean`): `Ax_IdentityRelation`, `Ax_EqualityReflexivity`, `Ax_LeibnizLaw` declared with the honest `axiom` keyword (correct per the project's own discipline — `axiom` reserved for genuinely postulated constructions like this one and Enderton ZFCSet/Landau ℕ, never used to paper over an unfinished proof), then shown to instantiate `IdentityRelation`.

**Logic and model-theory layers** (`Interface/Logic.lean`, `Interface/Logic/{FirstOrder,SecondOrder}`, and `Interface/ModelTheory.lean`) — the subject now separates its formal equality presentation from its semantic structures. `Interface/Logic/FirstOrder/Language.lean` owns `pureEqualitySignature` and the pure equality language package; `Interface/Logic/Theory.lean` owns the generic `IdentityTheory` schema; `Interface/Logic/SecondOrder/Theory.lean` owns `IsIdentityRelation` and the full-Leibniz bridges; `Interface/ModelTheory/LStructure.lean` owns `EqualityStructure`; and `Interface/ModelTheory/Model.lean` exposes both `toFirstOrderModel` and `toFullSecondOrderModel`.

**Universal-algebra bridge, checked specifically for the "is this a duplication, like Morphism?" question — it is not.** `Interface/UniversalAlgebra/Congruence.lean` defines `IsCongruence` generically (any equivalence relation compatible with an arbitrary `AlgebraicSignature`'s operations) — correctly kept identity-agnostic rather than hard-coded to `Ident`. The connection is made properly in `Theorems/UniversalAlgebra.lean`: `IdentIsCongruence` *proves* `Ident` instantiates the generic `IsCongruence`, and `quotientByIdentToCarrier` proves the congruence-quotient by `Ident` is isomorphic to the carrier itself (both inversion directions proved) — a genuine, non-trivial payoff theorem, not a stub. This is the correct layering pattern: unlike `Morphism/Properties` vs. `UniversalAlgebra/Homomorphism` (confirmed genuinely duplicated, no cross-import), `Identity`'s generic `IsCongruence` and its identity-specific instantiation are properly connected by an explicit bridge theorem.

## Verdict

**`Identity` is structured properly and now has a clearer forward-standardized interface shape** — especially around `Interface/ModelTheory` and the explicit second-order predicate layer. It is no longer sorry-free throughout, but the remaining `sorry`s are localized to the new `IsIdentityRelation` characterization theorems rather than to the base `IdentityRelation` or congruence API.

**One genuinely open, minor item, found during this direct inspection, not from any `ProofsToDo.md`:** `Interface/UniversalAlgebra/Congruence.lean`'s `AlgebraicStructure`/`AlgebraicSignature` types are locally defined inside `Identity` rather than imported from `LRA/UniversalAlgebra/Signature`. Worth checking in a future round whether this is a deliberate, lightweight local copy (acceptable — `Identity` may want to avoid a heavy dependency on the full `UniversalAlgebra` layer) or accidental drift from a shared definition that has since diverged.

## Policy correction, binding going forward

Every future audit round (see `audit-handoff-prompt.md`, project knowledge) must exclude `ProofsToDo.md` files as an evidence source entirely. The handoff prompt has been updated accordingly.
