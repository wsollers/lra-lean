# Phase 6 - UA Restatements And Cert Sync

Updated: 2026-08-30

## Objective

Synchronize the operator and structure work with the equation-level universal
algebra layer and the documentation crosswalks so the repo has one consistent
story from:

generic operator interface -> structure-law bundle -> subject model ->
construction bridge -> UA restatement and documentation

## Binding Inputs

- `docs/landau-satisfaction/DECISIONS.md`
- `docs/landau-satisfaction/phases/phase-03-subject-interface-adoption.md`
- `docs/landau-satisfaction/phases/phase-04-concrete-construction-proofs.md`
- `docs/landau-satisfaction/phases/phase-05-arithmetic-bridges.md`
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

## Content Ownership By File

- `UniversalAlgebra/Satisfaction/Transport.lean`
  - generic satisfaction transport theorems
  - product / family / quotient style transport where in scope
- `Operation/*/Interface/UniversalAlgebra/Satisfy_Generic.lean`
  - operator-local bridges from realized operators to UA satisfaction
- `docs/foundations/06a-satisfaction-certificates.md`
  - documentation of the accepted cert story after the operator/interface work
- `LANDAU-CROSSWALK.md`
  - theorem-to-cert and theorem-to-artifact crosswalk updates
- `docs/landau-satisfaction/status.md` and `ledger.json`
  - final synchronization of phase completion state

## Execution Checklist

### 1. Complete the UA transport layer

- [ ] Add `LRA/UniversalAlgebra/Satisfaction/Transport.lean`.
- [ ] Add any needed router import in `All.lean`.
- [ ] Keep the transport file generic over signatures and models.

### 2. Complete operator-local UA bridges

- [ ] Finish `Addition/Interface/UniversalAlgebra/Satisfy_Generic.lean`.
- [ ] Finish `Multiplication/Interface/UniversalAlgebra/Satisfy_Generic.lean`.
- [ ] Ensure these bridges restate existing operator facts instead of inventing
  a second proof vocabulary.

### 3. Sync the cert documentation

- [ ] Update `docs/foundations/06a-satisfaction-certificates.md` to match the
  accepted cert ownership split.
- [ ] Update `docs/landau-satisfaction/README.md` if the workspace structure
  changed during implementation.
- [ ] Decide whether the top-level `LANDAU-SATISFACTION-PLAN.md` remains a
  historical overview, is renamed, or is absorbed into this workspace.

### 4. Sync the Landau crosswalks

- [ ] Update `LANDAU-CROSSWALK.md` so theorem rows identify the cert or bridge
  artifact that now owns the result.
- [ ] Update `LANDAU-THEOREMS.md` only where theorem naming or artifact links
  changed.
- [ ] Keep non-cert theorems explicitly marked as ordinary theorem artifacts.

### 5. Finalize phase state

- [ ] Confirm every phase file still matches the implementation reality.
- [ ] Mark completed phases in `status.md`.
- [ ] Update `ledger.json` with the final active phase or completed state.

## Deliverables

- a UA transport file with the generic restatement layer needed by the plan
- operator-local UA bridges for promoted addition and multiplication
- synchronized cert and Landau documentation

## Build Gates

Run after each change block:

- `lake build LRA.UniversalAlgebra.Satisfaction`
- `lake build LRA.Operation.Addition`
- `lake build LRA.Operation.Multiplication`

Run at phase completion:

- `lake build`

## Out of Scope

- introducing a new primary cert meaning that conflicts with `DECISIONS.md`
- restructuring unrelated foundations documents outside the cert/satisfaction
  track
