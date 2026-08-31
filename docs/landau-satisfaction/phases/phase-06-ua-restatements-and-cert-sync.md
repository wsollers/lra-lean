# Phase 6 - UA Restatements And Cert Sync

Updated: 2026-08-30

## Objective

Synchronize the operator and structure work with the equation-level universal
algebra layer and the documentation crosswalks so the repo has one consistent
story from:

generic operator interface -> structure-law bundle -> subject model ->
construction bridge -> UA restatement and documentation

## Landau Theorem Scope For This Phase

- Synchronize ownership and crosswalk coverage for Chapter I through Chapter IV
  (Theorems 1–205)
- Do not expand the critical path to Chapter V

## Binding Inputs

- `docs/landau-satisfaction/DECISIONS.md`
- `docs/landau-satisfaction/phases/phase-03-subject-interface-adoption.md`
- `docs/landau-satisfaction/phases/phase-04-concrete-construction-proofs.md`
- `docs/landau-satisfaction/phases/phase-05-arithmetic-bridges.md`
- `docs/algebraic-structures-repair/status.md`
- `docs/algebraic-structures-repair/ledger.json`
- `docs/foundations/06a-satisfaction-certificates.md`
- `docs/foundations/06b-model-theory-boundary.md`
- `LANDAU-SATISFACTION-PLAN.md`
- `LANDAU-CROSSWALK.md`
- `LANDAU-THEOREMS.md`

## Placement Contract

Phase 6 owns:

- UA transport and restatement additions under:
  - `LRA/UniversalAlgebra/Satisfaction/*`
- operator UA bridge completion under:
  - `LRA/Operation/Addition/Interface/UniversalAlgebra/*`
  - `LRA/Operation/Multiplication/Interface/UniversalAlgebra/*`
- scalar-chain algebraic-structure UA completion under:
  - `LRA/AlgebraicStructures/*/Interface/UniversalAlgebra/*`
- documentation synchronization under:
  - `docs/landau-satisfaction/*`
  - `LANDAU-CROSSWALK.md`
  - `LANDAU-THEOREMS.md`
  - `docs/foundations/06a-satisfaction-certificates.md`

## Required Files

```text
LRA/UniversalAlgebra/Satisfaction/Transport.lean
```

Phase 6 may also need to update:

- `LRA/UniversalAlgebra/Satisfaction/All.lean`
- `LRA/Operation/Addition/Interface/UniversalAlgebra/Satisfy_Generic.lean`
- `LRA/Operation/Multiplication/Interface/UniversalAlgebra/Satisfy_Generic.lean`
- `LRA/AlgebraicStructures/*/Interface/UniversalAlgebra/Signature/Definition.lean`
- `LRA/AlgebraicStructures/*/Interface/UniversalAlgebra/Satisfy_Generic.lean`

## Required Scalar-Chain Algebraic-Structure UA Targets

- `LRA/AlgebraicStructures/Semiring/Interface/UniversalAlgebra/*`
- `LRA/AlgebraicStructures/CommutativeSemiring/Interface/UniversalAlgebra/*`
- `LRA/AlgebraicStructures/OrderedSemiring/Interface/UniversalAlgebra/*`
- `LRA/AlgebraicStructures/AbelianGroup/Interface/UniversalAlgebra/*`
- `LRA/AlgebraicStructures/OrderedGroup/Interface/UniversalAlgebra/*`
- `LRA/AlgebraicStructures/LinearlyOrderedGroup/Interface/UniversalAlgebra/*`
- `LRA/AlgebraicStructures/Ring/Interface/UniversalAlgebra/*`
- `LRA/AlgebraicStructures/CommutativeRing/Interface/UniversalAlgebra/*`
- `LRA/AlgebraicStructures/NontrivialRing/Interface/UniversalAlgebra/*`
- `LRA/AlgebraicStructures/OrderedRing/Interface/UniversalAlgebra/*`
- `LRA/AlgebraicStructures/DivisionRing/Interface/UniversalAlgebra/*`
- `LRA/AlgebraicStructures/IntegralDomain/Interface/UniversalAlgebra/*`
- `LRA/AlgebraicStructures/LinearlyOrderedRing/Interface/UniversalAlgebra/*`
- `LRA/AlgebraicStructures/Field/Interface/UniversalAlgebra/*`
- `LRA/AlgebraicStructures/OrderedField/Interface/UniversalAlgebra/*`
- `LRA/AlgebraicStructures/CompleteOrderedField/Interface/UniversalAlgebra/*`

## Content Ownership By File

- `UniversalAlgebra/Satisfaction/Transport.lean`
  - generic satisfaction transport theorems
  - product / family / quotient style transport where in scope
- `Operation/*/Interface/UniversalAlgebra/Satisfy_Generic.lean`
  - operator-local bridges from realized operators to UA satisfaction
- `AlgebraicStructures/*/Interface/UniversalAlgebra/*`
  - structure-local signatures and satisfaction bridges that consume the
    operator and law layers without redefining them
- `docs/foundations/06a-satisfaction-certificates.md`
  - documentation of the accepted cert story after the operator/interface work
- `LANDAU-CROSSWALK.md`
  - theorem-to-cert and theorem-to-artifact crosswalk updates
- `docs/landau-satisfaction/status.md` and `ledger.json`
  - final synchronization of phase completion state

## Execution Checklist

### 1. Confirm scalar-chain algebraic-structure prerequisites

- [ ] Read the status of the scalar-chain `as-*` queue items referenced by
  this workspace.
- [ ] Confirm which algebraic-structure subjects still lack usable
  `Interface/UniversalAlgebra/*` surfaces.
- [ ] Treat `docs/algebraic-structures-repair/` as the canonical owner of
  any structure-side progress notes.

### 2. Complete the UA transport layer

- [ ] Add `LRA/UniversalAlgebra/Satisfaction/Transport.lean`.
- [ ] Add any needed router import in `All.lean`.
- [ ] Keep the transport file generic over signatures and models.

### 3. Complete operator-local UA bridges

- [ ] Finish `Addition/Interface/UniversalAlgebra/Satisfy_Generic.lean`.
- [ ] Finish `Multiplication/Interface/UniversalAlgebra/Satisfy_Generic.lean`.
- [ ] Ensure these bridges restate existing operator facts instead of inventing
  a second proof vocabulary.

### 4. Complete algebraic-structure UA bridges

- [ ] For each scalar-chain algebraic structure, add or align
  `Interface/UniversalAlgebra/Signature/Definition.lean`.
- [ ] For each scalar-chain algebraic structure, add or align
  `Interface/UniversalAlgebra/Satisfy_Generic.lean`.
- [ ] Keep these files as structure-level restatements that consume canonical
  law bundles rather than replacing them.

Success criteria:
- the scalar arithmetic chain has a continuous UA-facing path through
  operations, structures, and number systems

### 5. Sync the cert documentation

- [ ] Update `docs/foundations/06a-satisfaction-certificates.md` to match the
  accepted cert ownership split.
- [ ] Update `docs/landau-satisfaction/README.md` if the workspace structure
  changed during implementation.
- [ ] Decide whether the top-level `LANDAU-SATISFACTION-PLAN.md` remains a
  historical overview, is renamed, or is absorbed into this workspace.

### 6. Sync the Landau crosswalks

- [ ] Update `LANDAU-CROSSWALK.md` so theorem rows identify the cert or bridge
  artifact that now owns the result.
- [ ] Update `LANDAU-THEOREMS.md` only where theorem naming or artifact links
  changed.
- [ ] Keep non-cert theorems explicitly marked as ordinary theorem artifacts.

### 7. Finalize phase state

- [ ] Confirm every phase file still matches the implementation reality.
- [ ] Mark completed phases in `status.md`.
- [ ] Update `ledger.json` with the final active phase or completed state.
- [ ] Update `docs/algebraic-structures-repair/status.md` and `ledger.json`
  for any structure-side UA completions recorded during this phase.

## Deliverables

- a UA transport file with the generic restatement layer needed by the plan
- operator-local UA bridges for promoted addition and multiplication
- scalar-chain algebraic-structure UA surfaces that line up with the operator
  and number-system layers
- synchronized cert and Landau documentation

## Build Gates

Run after each change block:

- `lake build LRA.UniversalAlgebra.Satisfaction`
- `lake build LRA.Operation.Addition`
- `lake build LRA.Operation.Multiplication`
- `python scripts/validate_structure.py --path LRA/AlgebraicStructures/Semiring`
- `python scripts/validate_structure.py --path LRA/AlgebraicStructures/CommutativeSemiring`
- `python scripts/validate_structure.py --path LRA/AlgebraicStructures/OrderedSemiring`
- `python scripts/validate_structure.py --path LRA/AlgebraicStructures/IntegralDomain`
- `python scripts/validate_structure.py --path LRA/AlgebraicStructures/Field`
- `python scripts/validate_structure.py --path LRA/AlgebraicStructures/OrderedField`
- `python scripts/validate_structure.py --path LRA/AlgebraicStructures/CompleteOrderedField`

Run at phase completion:

- `lake build`

## Out of Scope

- introducing a new primary cert meaning that conflicts with `DECISIONS.md`
- restructuring unrelated foundations documents outside the cert/satisfaction
  track
