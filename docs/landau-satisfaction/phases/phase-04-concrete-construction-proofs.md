# Phase 4 - Concrete Construction Proofs

Updated: 2026-08-30

## Objective

Discharge the concrete carrier obligations needed to realize the promoted
generic operators and package subject-level `Satisfy_Generic` bridges for each
construction in scope.

This phase is where each concrete construction proves that its carrier
implements the generic operator interfaces and the structure-law bundles
required by its subject.

## Binding Inputs

- `docs/landau-satisfaction/DECISIONS.md`
- `docs/landau-satisfaction/phases/phase-02-generic-operations.md`
- `docs/landau-satisfaction/phases/phase-03-subject-interface-adoption.md`
- `docs/foundations/06a-satisfaction-certificates.md`
- `docs/number-systems-architecture-audit.md`

## Placement Contract

Phase 4 owns concrete-construction adoption artifacts under:

- `LRA/NumberSystems/*/Constructions/*/Operations/*`
- `LRA/NumberSystems/*/Constructions/*/Laws.lean`
- `LRA/NumberSystems/*/Constructions/*/Satisfy_Generic.lean`

Phase 4 may add missing operation bridge files under a construction when a
subject lacks the addition or multiplication bridge introduced in Phase 2.

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

Integer / rational / real / complex family:

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
- `LRA/NumberSystems/ComplexNumbers/Constructions/OrderedPairs/Laws.lean`
- `LRA/NumberSystems/ComplexNumbers/Constructions/OrderedPairs/Satisfy_Generic.lean`
- `LRA/NumberSystems/ComplexNumbers/Constructions/Mathlib/Satisfy_Generic.lean`

Secondary construction track:

- `LRA/NumberSystems/GaussianIntegers/Constructions/OrderedPairs/Laws.lean`

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

### 1. Normalize construction-local operator bridges

- [ ] For each construction in scope, confirm whether it already has explicit
  generic addition and multiplication bridge files.
- [ ] Add missing operation bridge files under `Operations/` where the
  construction currently jumps directly from raw operations to structure laws.
- [ ] Reuse existing local operation theorems rather than restating them under
  a new construction-local vocabulary.

### 2. Prove construction-local structure bundles

- [ ] In each `Laws.lean`, package the structure laws required by that
  subject's interface.
- [ ] Consume canonical law predicates and structure bundles rather than
  rewriting equations inline.
- [ ] Leave theorem placeholders as `sorry` only where the repo already permits
  it and the proof is genuinely deferred.

Success criteria:
- every nontrivial construction has a single obvious `Laws.lean` owner for its
  structure-level evidence

### 3. Package `Satisfy_Generic` for each construction

- [ ] Update or add `Satisfy_Generic.lean` so each construction produces the
  subject model expected by Phase 3.
- [ ] Make the dependency chain explicit:
  generic operator interface -> concrete operator realization -> structure-law
  bundle -> subject model
- [ ] Keep the packaging file as an assembly surface, not a second theorem
  owner.

### 4. Track exceptions explicitly

- [ ] Record any construction that is intentionally out of scope.
- [ ] Record any construction still using placeholders in its law bundle.
- [ ] Record whether `GaussianIntegers` joins this phase or remains deferred.

### 5. Record resumable progress

- [ ] Update `docs/landau-satisfaction/status.md`.
- [ ] Update `docs/landau-satisfaction/ledger.json`.
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
