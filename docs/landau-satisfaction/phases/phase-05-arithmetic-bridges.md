# Phase 5 - Arithmetic Bridges

Updated: 2026-08-30

## Objective

Add the shared mixed-operator bridge layer that relates generic addition and
generic multiplication after the unary operator realizations from Phases 2
through 4 are in place.

This phase owns distributivity and similar mixed arithmetic relationships.

## Binding Inputs

- `docs/landau-satisfaction/DECISIONS.md`
- `docs/landau-satisfaction/phases/phase-01-generic-operation-laws.md`
- `docs/landau-satisfaction/phases/phase-02-generic-operations.md`
- `docs/landau-satisfaction/phases/phase-03-subject-interface-adoption.md`
- `docs/landau-satisfaction/phases/phase-04-concrete-construction-proofs.md`
- `docs/foundations/06-operations.md`
- `docs/foundations/06a-satisfaction-certificates.md`

## Placement Contract

Phase 5 owns the shared mixed-operator bridge area under:

```text
LRA/Operation/Arithmetic/
```

with router:

```text
LRA/Operation/Arithmetic.lean
```

## Required Files

```text
LRA/Operation/Arithmetic.lean
LRA/Operation/Arithmetic/Distributivity.lean
LRA/Operation/Arithmetic/Absorbing.lean
LRA/Operation/Arithmetic/Theorems.lean
```

Additional files may be added later if another mixed-law family deserves its
own owner.

## Content Ownership By File

- `Arithmetic/Distributivity.lean`
  - bridges for `LeftDistributive`, `RightDistributive`,
    `TwoSidedDistributive`
  - generic results depending on one realized addition and one realized
    multiplication
- `Arithmetic/Absorbing.lean`
  - mixed additive-zero / multiplicative-absorber interaction bridges
  - keep unary absorbing-witness facts in `Multiplication/Laws.lean`
- `Arithmetic/Theorems.lean`
  - shared theorems built on the mixed-law bridge layer
- `Arithmetic.lean`
  - router only

## Execution Checklist

### 1. Create the arithmetic bridge surface

- [ ] Add `LRA/Operation/Arithmetic.lean`.
- [ ] Add `Arithmetic/Distributivity.lean`.
- [ ] Add `Arithmetic/Absorbing.lean`.
- [ ] Add `Arithmetic/Theorems.lean`.

### 2. Bridge distributivity canonically

- [ ] Import `LRA/Operation/Laws/Distributive/*` from the canonical owner.
- [ ] Define mixed bridge packaging using one realized addition and one
  realized multiplication.
- [ ] Export the distributive evidence needed by semiring-style structures.

Success criteria:
- distributive results have one clear home and are not duplicated under both
  `Addition` and `Multiplication`

### 3. Bridge additive-zero / multiplicative-absorber interactions

- [ ] State the exact dependency on additive identity and multiplicative
  absorber witnesses.
- [ ] Keep the unary absorber predicate owned by
  `LRA/Operation/Laws/Absorbing/*`.
- [ ] Use this file only for the mixed interaction between the two realized
  operators.

### 4. Connect structure consumers

- [ ] Audit `LRA/AlgebraicStructures/Semiring/Laws/Distributive.lean`.
- [ ] Audit `LRA/AlgebraicStructures/Semiring/Laws/Definition.lean`.
- [ ] Ensure semiring-style bundles can consume the new mixed bridge outputs
  without restating proofs.

### 5. Add concrete bridge adopters where needed

- [ ] Update concrete constructions that can now discharge distributivity.
- [ ] Start with the scalar chain in this order:
  natural/whole -> integers -> rationals -> reals -> complex.
- [ ] Record constructions intentionally left for later.

### 6. Record resumable progress

- [ ] Update `docs/landau-satisfaction/status.md`.
- [ ] Update `docs/landau-satisfaction/ledger.json`.
- [ ] Record any remaining mixed-law families that still lack an owner file.

## Deliverables

- shared arithmetic bridge router and files under `LRA/Operation/Arithmetic/`
- distributive and absorbing mixed-law packaging with clear structure
  consumption paths

## Build Gates

Run after each change block:

- `lake build LRA.Operation.Arithmetic`
- `lake build LRA.AlgebraicStructures.Semiring`

Run at phase completion:

- `lake build`

## Out of Scope

- first-order or second-order theory-level arithmetic subjects
- non-equational order/arithmetic interaction laws
