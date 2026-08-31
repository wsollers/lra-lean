# Phase 2 - Generic Operations

Updated: 2026-08-30

## Objective

Create the reusable generic operator layer for addition and multiplication under
`LRA/Operation/` after Phase 1 has fixed the law inventory and operator-law
bridge rules. This phase covers unary operator realization only. Mixed
arithmetic laws are deferred to a later bridge phase.

## Binding Inputs

- `docs/landau-satisfaction/DECISIONS.md`
- `docs/landau-satisfaction/phases/phase-01-generic-operation-laws.md`
- `docs/foundations/06-operations.md`
- `docs/foundations/06a-satisfaction-certificates.md`
- `docs/foundations/06b-model-theory-boundary.md`
- `docs/foundations/16-landau-cert-naming-history.md`
- `docs/number-systems-architecture-audit.md`

## Placement Contract

Phase 2 owns only the generic operator layer under `LRA/Operation/`. It does
not directly rewrite subject-specific `NaturalNumbers`, `PeanoSystem`,
`WholeNumbers`, `Integers`, or `RealNumbers` proofs except for import routing
needed to expose the new operator layer.

### Required directories

```text
LRA/Operation/Addition/
LRA/Operation/Multiplication/
```

### Required files in each directory

```text
Definition.lean
Existence.lean
Uniqueness.lean
Realization.lean
Laws.lean
Theorems.lean
```

### Recommended router files

```text
LRA/Operation/Addition.lean
LRA/Operation/Multiplication.lean
```

### Interface subtree shape for later promotion

If interface artifacts are created in the later subject-adoption phase, use:

```text
Interface/
  Signature/
    Definition.lean
  ModelTheory/
    Model.lean
    Theory.lean
    LStructure.lean
  UniversalAlgebra/
    Signature/
      Definition.lean
    Satisfy_Generic.lean
```

## Naming Contract

- Use `Addition` and `Multiplication`, not `Add`, `Mul`, or `Arithmetic`.
- Match file names exactly across both operators.
- Use descriptive names for operator-specific specs and theorems.
- Reserve `Cert_*` for law evidence consumed later by structure bundles.
- Do not create a second generic law vocabulary inside these files.

## Content Ownership By File

- `Definition.lean`
  - operator-specific core definitions
  - specification records or structures
  - carrier-level primitive inputs
- `Existence.lean`
  - statements asserting the existence of the operation under the required
    primitive inputs
- `Uniqueness.lean`
  - statements asserting the operation is uniquely determined by the intended
    specification
- `Realization.lean`
  - packaging from primitive evidence into a realized Lean operation
  - carrier-level `Add` / `Mul` exposure
- `Laws.lean`
  - bridges from realized operator evidence into the Phase 1 generic law
  inventory
  - exported proofs discharging canonical law predicates on the realized
    operations
- `Theorems.lean`
  - generic reusable theorems about the operator specification and realization

## Execution Checklist

### 1. Create router surfaces

- [x] Add `LRA/Operation/Addition.lean`.
- [x] Add `LRA/Operation/Multiplication.lean`.
- [x] Update `LRA/Operation.lean` to import the new routers.

### 2. Scaffold `Addition`

- [x] Add `LRA/Operation/Addition/Definition.lean`.
- [x] Add `LRA/Operation/Addition/Existence.lean`.
- [x] Add `LRA/Operation/Addition/Uniqueness.lean`.
- [x] Add `LRA/Operation/Addition/Realization.lean`.
- [x] Add `LRA/Operation/Addition/Laws.lean`.
- [x] Add `LRA/Operation/Addition/Theorems.lean`.

### 3. Discharge addition law obligations

- [x] In `Addition/Laws.lean`, expose the Phase 1 addition-facing laws one by
  one.
- [x] Ensure each law is imported from its canonical owner rather than
  redefined.
- [x] Record any mixed-operator obligations as deferred to the later arithmetic
  bridge phase.

Required form:
- law discharge must be expressed as proofs of predicates on the realized
  addition operation
- `Addition/Laws.lean` may package these proofs, but may not redefine the law
  predicates themselves

### 4. Scaffold `Multiplication`

- [x] Add `LRA/Operation/Multiplication/Definition.lean`.
- [x] Add `LRA/Operation/Multiplication/Existence.lean`.
- [x] Add `LRA/Operation/Multiplication/Uniqueness.lean`.
- [x] Add `LRA/Operation/Multiplication/Realization.lean`.
- [x] Add `LRA/Operation/Multiplication/Laws.lean`.
- [x] Add `LRA/Operation/Multiplication/Theorems.lean`.

### 5. Discharge multiplication law obligations

- [x] In `Multiplication/Laws.lean`, expose the Phase 1 multiplication-facing
  laws one by one.
- [x] Treat distributive and other mixed-operator laws as out of scope for this
  phase and leave explicit notes for the later arithmetic bridge phase.

Required form:
- law discharge must be expressed as proofs of predicates on the realized
  multiplication operation
- mixed-operator laws are intentionally not discharged in this phase

### 6. Decide whether to add operator `Interface/` subtrees now

- [x] Inspect whether the six-file split is enough to express the intended
  model-facing and equation-facing contracts.
- [x] Decide to defer the operator `Interface/` subtrees to Phase 3 rather than
  adding them in Phase 2.
- [x] Record the decision in `DECISIONS.md`.

### 7. Record resumable progress

- [x] Update `docs/landau-satisfaction/status.md`.
- [x] Update `docs/landau-satisfaction/ledger.json`.
- [x] Record any blocked item before ending the session.

## Accepted Baseline Status

The current accepted Phase 2 baseline is:

- `Addition/Laws.lean` exports separate packages for:
  - baseline unary laws: associativity
  - optional commutativity
  - identity-witness laws
  - inverse-witness laws
  - optional idempotence
- `Multiplication/Laws.lean` exports separate packages for:
  - baseline unary laws: associativity
  - optional commutativity
  - identity-witness laws
  - inverse-witness laws
  - optional absorbing-witness laws
  - optional idempotence
- All law predicates are imported from canonical owners under
  `LRA/Operation/Laws/*`.
- `closure` remains owned by `Existence.lean` / `Realization.lean`.
- `distributive` and other mixed-operator obligations remain deferred to the
  later arithmetic bridge phase.
- operator `Interface/` subtrees are deferred to Phase 3

## Current Concrete Progress

- [x] Add a first concrete generic-addition bridge for Landau naturals.
- [x] Reuse the existing Landau addition existence and law theorems rather than
  restating them under a second subject-local vocabulary.
- [x] Keep additive identity and inverse out of the Landau natural-number
  bridge, since this construction is one-based and currently discharges only
  the baseline semigroup-plus-commutativity package.
- [x] Add the matching concrete generic-multiplication bridge for Landau
  naturals.
- [x] Export multiplicative commutativity and multiplicative identity for the
  Landau natural-number multiplication bridge.
- [x] Keep inverse, absorbing, idempotent, and mixed distributive bridges out
  of the Landau natural-number multiplication bridge for now.

## Deliverables

- `LRA/Operation/Addition.lean`
- `LRA/Operation/Multiplication.lean`
- six base artifact files under `LRA/Operation/Addition/`
- six base artifact files under `LRA/Operation/Multiplication/`
- `LRA/Operation.lean` imports the new routers
- operator law bridge files discharge the Phase 1 unary law inventory

## Build Gates

Run after each change block:

- `lake build LRA.Operation.Addition`
- `lake build LRA.Operation.Multiplication`
- `lake build LRA.Operation`

Run at phase completion:

- `lake build`
