# Phase 4 - Concrete Construction Proofs

Updated: 2026-08-30

## Objective

Discharge the concrete carrier obligations needed to realize the promoted
generic operators and package subject-level `Satisfy_Generic` bridges for each
construction in scope.

This phase is where each concrete construction proves that its carrier
implements the generic operator interfaces and the structure-law bundles
required by its subject.

## Landau Theorem Scope For This Phase

- Chapter I `Natural Numbers` (Theorems 1–36)
- Chapter II `Fractions` / rationals (Theorems 37–115)
- Chapter III `Cuts` / real construction (Theorems 116–162) only where a
  theorem belongs directly to a concrete real-construction file

## Binding Inputs

- `docs/landau-satisfaction/DECISIONS.md`
- `docs/landau-satisfaction/phases/phase-02-generic-operations.md`
- `docs/landau-satisfaction/phases/phase-03-subject-interface-adoption.md`
- `docs/algebraic-structures-repair/status.md`
- `docs/algebraic-structures-repair/ledger.json`
- `docs/foundations/06a-satisfaction-certificates.md`
- `docs/number-systems-architecture-audit.md`

## Placement Contract

Phase 4 owns concrete-construction adoption artifacts under:

- `LRA/NumberSystems/*/Constructions/*/Operations/*`
- `LRA/NumberSystems/*/Constructions/*/Laws.lean`
- `LRA/NumberSystems/*/Constructions/*/Satisfy_Generic.lean`

Phase 4 may add missing operation bridge files under a construction when a
subject lacks the addition or multiplication bridge introduced in Phase 2.

## Structure Prerequisites By Number-System Family

- `NaturalNumbers`, `PositiveNaturals`
  - requires `as-22` `CommutativeSemiring`
- `WholeNumbers`, `ZeroBasedNaturals`
  - requires `as-25` `OrderedSemiring`
- `Integers`
  - requires `as-31` `IntegralDomain`
  - may also depend on `as-29` `OrderedRing` and `as-32`
    `LinearlyOrderedRing` where order packaging is consumed through those
    structure interfaces
- `RationalNumbers`
  - requires `as-34` `OrderedField`
- `RealNumbers`
  - requires `as-34` `OrderedField`
  - requires `as-35` `CompleteOrderedField`
  - may depend on `as-06` `Archimedean` where that law is consumed explicitly
- `ComplexNumbers`
  - out of scope for this workspace's critical path
- `GaussianIntegers`
  - out of scope for this workspace's critical path

## Core Construction Targets

Natural-number family:

- `LRA/NumberSystems/NaturalNumbers/Constructions/Landau/Laws.lean`
- `LRA/NumberSystems/NaturalNumbers/Constructions/Mathlib/Satisfy_Generic.lean`
- `LRA/NumberSystems/PositiveNaturals/Constructions/Mathlib/Satisfy_Generic.lean`
- `LRA/NumberSystems/PositiveNaturals/Constructions/LRAInHouse/Satisfy_Generic.lean`
- `LRA/NumberSystems/ZeroBasedNaturals/Constructions/Mathlib/Satisfy_Generic.lean`
- `LRA/NumberSystems/ZeroBasedNaturals/Constructions/LRAInHouse/Satisfy_Generic.lean`
- `LRA/NumberSystems/WholeNumbers/Constructions/Landau/Laws.lean`
- `LRA/NumberSystems/WholeNumbers/Constructions/Landau/Satisfy_Generic.lean`
- `LRA/NumberSystems/WholeNumbers/Constructions/Mathlib/Satisfy_Generic.lean`

Integer / rational / real family:

- `LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Laws.lean`
- `LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Satisfy_Generic.lean`
- `LRA/NumberSystems/Integers/Constructions/Tao/Laws.lean`
- `LRA/NumberSystems/Integers/Constructions/Tao/Satisfy_Generic.lean`
- `LRA/NumberSystems/Integers/Constructions/Mendelson/Laws.lean`
- `LRA/NumberSystems/Integers/Constructions/Mendelson/Satisfy_Generic.lean`
- `LRA/NumberSystems/Integers/Constructions/Mathlib/Satisfy_Generic.lean`
- `LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Laws.lean`
- `LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Satisfy_Generic.lean`
- `LRA/NumberSystems/RationalNumbers/Constructions/Mathlib/Satisfy_Generic.lean`
- `LRA/NumberSystems/RealNumbers/Constructions/Dedekind/Laws.lean`
- `LRA/NumberSystems/RealNumbers/Constructions/Dedekind/Satisfy_Generic.lean`
- `LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Laws.lean`
- `LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Satisfy_Generic.lean`
- `LRA/NumberSystems/RealNumbers/Constructions/EffectiveCauchy/Laws.lean`
- `LRA/NumberSystems/RealNumbers/Constructions/EffectiveCauchy/Satisfy_Generic.lean`
- `LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Laws.lean`
- `LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Satisfy_Generic.lean`
- `LRA/NumberSystems/RealNumbers/Constructions/Cantor/Laws.lean`
- `LRA/NumberSystems/RealNumbers/Constructions/Cantor/Satisfy_Generic.lean`
- `LRA/NumberSystems/RealNumbers/Constructions/PrimitiveIntervals/Laws.lean`
- `LRA/NumberSystems/RealNumbers/Constructions/PrimitiveIntervals/Satisfy_Generic.lean`
- `LRA/NumberSystems/RealNumbers/Constructions/Mathlib/Satisfy_Generic.lean`

## Required Artifact Shape Per Construction

At minimum, each nontrivial construction should end the phase with:

- operator realization bridge files in `Operations/` when needed
- a `Laws.lean` file proving the structure-law bundle consumed by the subject
- a `Satisfy_Generic.lean` file packaging the construction into the subject
  model contract

Mathlib-backed constructions may satisfy the operator and law requirements by
reusing upstream instances, but the packaging file must still make the bridge
explicit.

## Execution Checklist

### 1. Confirm algebraic-structure prerequisites before touching constructions

- [ ] For each subject family, confirm the required upstream `as-*` items are
  `done` or explicitly sufficient for this phase.
- [ ] Do not package a construction against a structure contract that is still
  being rewritten upstream.
- [ ] Record any exception explicitly in both ledgers.

### 2. Normalize construction-local operator bridges

- [ ] For each construction in scope, confirm whether it already has explicit
  generic addition and multiplication bridge files.
- [ ] Add missing operation bridge files under `Operations/` where the
  construction currently jumps directly from raw operations to structure laws.
- [ ] Reuse existing local operation theorems rather than restating them under
  a new construction-local vocabulary.

### 3. Prove construction-local structure bundles

- [ ] In each `Laws.lean`, package the structure laws required by that
  subject's interface.
- [ ] Consume canonical law predicates and structure bundles rather than
  rewriting equations inline.
- [ ] Leave theorem placeholders as `sorry` only where the repo already permits
  it and the proof is genuinely deferred.

Success criteria:
- every nontrivial construction has a single obvious `Laws.lean` owner for its
  structure-level evidence

### 4. Package `Satisfy_Generic` for each construction

- [ ] Update or add `Satisfy_Generic.lean` so each construction produces the
  subject model expected by Phase 3.
- [ ] Make the dependency chain explicit:
  generic operator interface -> concrete operator realization -> structure-law
  bundle -> subject model
- [ ] Keep the packaging file as an assembly surface, not a second theorem
  owner.

### 5. Track exceptions explicitly

- [ ] Record any construction that is intentionally out of scope.
- [ ] Record any construction still using placeholders in its law bundle.
- [ ] Record any Chapter V or complex-number artifact that is intentionally
  deferred outside this workspace.

### 6. Record resumable progress

- [ ] Update `docs/landau-satisfaction/status.md`.
- [ ] Update `docs/landau-satisfaction/ledger.json`.
- [ ] Update `docs/algebraic-structures-repair/status.md` and `ledger.json`
  if a construction phase forces an upstream structure-queue note.
- [ ] Record per-construction completion notes as the phase advances.

## Deliverables

- every targeted construction has a visible path from local operations to
  subject `Satisfy_Generic`
- every targeted construction has an owned `Laws.lean` or an explicit Mathlib
  reuse explanation

## Build Gates

Run after each construction block:

- `lake build` on the touched construction namespace

Examples:

- `lake build LRA.NumberSystems.NaturalNumbers.Constructions.Landau`
- `lake build LRA.NumberSystems.Integers.Constructions.QuotientOrderedPairs`
- `lake build LRA.NumberSystems.RealNumbers.Constructions.Dedekind`

Run at phase completion:

- `lake build`

## Out of Scope

- mixed-operator distributive bridges shared across subjects
- repo-wide UA restatement sync
- complex-number completion beyond noting side dependencies
