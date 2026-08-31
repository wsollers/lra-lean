# Phase 5 - Arithmetic Bridges

Updated: 2026-08-30

## Objective

Add the shared mixed-operator bridge layer that relates generic addition and
generic multiplication after the unary operator realizations from Phases 2
through 4 are in place.

This phase owns distributivity and similar mixed arithmetic relationships.

## Landau Theorem Scope For This Phase

- Chapter I Theorem 30
- Chapter II Theorems 71 and 104
- Chapter III Theorem 144
- Chapter IV Theorems 200 and 201, with closely adjacent mixed arithmetic
  consequences as needed

## Binding Inputs

- `docs/landau-satisfaction/DECISIONS.md`
- `docs/landau-satisfaction/phases/phase-01-generic-operation-laws.md`
- `docs/landau-satisfaction/phases/phase-02-generic-operations.md`
- `docs/landau-satisfaction/phases/phase-03-subject-interface-adoption.md`
- `docs/landau-satisfaction/phases/phase-04-concrete-construction-proofs.md`
- `docs/algebraic-structures-repair/status.md`
- `docs/algebraic-structures-repair/ledger.json`
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

## Canonical Algebraic-Structure Consumers

The mixed-law layer is primarily consumed by these algebraic-structure queue
items:

- `as-18` `Semiring`
- `as-22` `CommutativeSemiring`
- `as-23` `CommutativeSemiringWithoutZero`
- `as-24` `Ring`
- `as-25` `OrderedSemiring`
- `as-27` `CommutativeRing`
- `as-29` `OrderedRing`
- `as-30` `DivisionRing`
- `as-31` `IntegralDomain`
- `as-33` `Field`
- `as-34` `OrderedField`
- `as-35` `CompleteOrderedField`

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

### 1. Confirm downstream algebraic-structure consumers

- [ ] Read the statuses of the consumer `as-*` items above.
- [ ] Confirm which structure bundles will consume distributive and absorbing
  outputs first.
- [ ] Keep `docs/algebraic-structures-repair/` as the canonical owner for any
  structure-side edits triggered by this phase.

### 2. Create the arithmetic bridge surface

- [ ] Add `LRA/Operation/Arithmetic.lean`.
- [ ] Add `Arithmetic/Distributivity.lean`.
- [ ] Add `Arithmetic/Absorbing.lean`.
- [ ] Add `Arithmetic/Theorems.lean`.

### 3. Bridge distributivity canonically

- [ ] Import `LRA/Operation/Laws/Distributive/*` from the canonical owner.
- [ ] Define mixed bridge packaging using one realized addition and one
  realized multiplication.
- [ ] Export the distributive evidence needed by semiring-style structures.

Success criteria:
- distributive results have one clear home and are not duplicated under both
  `Addition` and `Multiplication`

### 4. Bridge additive-zero / multiplicative-absorber interactions

- [ ] State the exact dependency on additive identity and multiplicative
  absorber witnesses.
- [ ] Keep the unary absorber predicate owned by
  `LRA/Operation/Laws/Absorbing/*`.
- [ ] Use this file only for the mixed interaction between the two realized
  operators.

### 5. Connect structure consumers

- [ ] Audit `LRA/AlgebraicStructures/Semiring/Laws/Distributive.lean`.
- [ ] Audit `LRA/AlgebraicStructures/Semiring/Laws/Definition.lean`.
- [ ] Ensure semiring-style bundles can consume the new mixed bridge outputs
  without restating proofs.

### 6. Add concrete bridge adopters where needed

- [ ] Update concrete constructions that can now discharge distributivity.
- [ ] Start with the scalar chain in this order:
  natural/whole -> integers -> rationals -> reals -> complex.
- [ ] Record constructions intentionally left for later.

### 7. Record resumable progress

- [ ] Update `docs/landau-satisfaction/status.md`.
- [ ] Update `docs/landau-satisfaction/ledger.json`.
- [ ] Update `docs/algebraic-structures-repair/status.md` and `ledger.json`
  when the mixed-law layer changes a structure queue item.
- [ ] Record any remaining mixed-law families that still lack an owner file.

## Deliverables

- shared arithmetic bridge router and files under `LRA/Operation/Arithmetic/`
- distributive and absorbing mixed-law packaging with clear structure
  consumption paths

## Build Gates

Run after each change block:

- `lake build LRA.Operation.Arithmetic`
- `python scripts/validate_structure.py --path LRA/AlgebraicStructures/Semiring`
- `lake build LRA.AlgebraicStructures.Semiring`

Run at phase completion:

- `lake build`

## Out of Scope

- first-order or second-order theory-level arithmetic subjects
- non-equational order/arithmetic interaction laws
- Chapter V complex-number arithmetic
