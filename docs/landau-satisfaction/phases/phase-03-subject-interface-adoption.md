# Phase 3 - Subject Interface Adoption

Updated: 2026-08-30

## Objective

Promote the generic `Addition` and `Multiplication` layers into subject-facing
interfaces so the number-system model contracts consume explicit operator
artifacts rather than only raw `[Add _]` / `[Mul _]` surfaces.

This phase is where the operator `Interface/` subtrees become mandatory.

## Binding Inputs

- `docs/landau-satisfaction/DECISIONS.md`
- `docs/landau-satisfaction/phases/phase-01-generic-operation-laws.md`
- `docs/landau-satisfaction/phases/phase-02-generic-operations.md`
- `docs/foundations/06-operations.md`
- `docs/foundations/06a-satisfaction-certificates.md`
- `docs/foundations/06b-model-theory-boundary.md`
- `docs/number-systems-architecture-audit.md`

## Placement Contract

Phase 3 owns:

- first-class operator interface surfaces under:
  - `LRA/Operation/Addition/Interface/*`
  - `LRA/Operation/Multiplication/Interface/*`
- subject-interface adoption points under:
  - `LRA/NumberSystems/*/Interface/ModelTheory/Model.lean`

Phase 3 does not yet discharge concrete construction proofs except where a
subject interface needs a minimal import route to expose the new operator
contracts.

## Required Directories

```text
LRA/Operation/Addition/Interface/
LRA/Operation/Multiplication/Interface/
```

## Required Files Per Operator Interface

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

## Required Subject Adoption Targets

Core scalar-chain subjects:

- `LRA/NumberSystems/NaturalNumbers/Interface/ModelTheory/Model.lean`
- `LRA/NumberSystems/PositiveNaturals/Interface/ModelTheory/Model.lean`
- `LRA/NumberSystems/WholeNumbers/Interface/ModelTheory/Model.lean`
- `LRA/NumberSystems/ZeroBasedNaturals/Interface/ModelTheory/Model.lean`
- `LRA/NumberSystems/Integers/Interface/ModelTheory/Model.lean`
- `LRA/NumberSystems/RationalNumbers/Interface/ModelTheory/Model.lean`
- `LRA/NumberSystems/RealNumbers/Interface/ModelTheory/Model.lean`
- `LRA/NumberSystems/ComplexNumbers/Interface/ModelTheory/Model.lean`

Secondary subject to evaluate explicitly:

- `LRA/NumberSystems/GaussianIntegers/Interface/ModelTheory/Model.lean`

Out of scope for direct adoption in this phase unless a specific bridge is
requested:

- `LRA/NumberSystems/PeanoSystem/Interface/ModelTheory/Model.lean`
- `LRA/NumberSystems/IntegerStructure/Interface/ModelTheory/Model.lean`
- `LRA/NumberSystems/PresburgerArithmetic/Interface/ModelTheory/Model.lean`
- `LRA/NumberSystems/FirstOrderArithmetic/Interface/ModelTheory/Model.lean`
- `LRA/NumberSystems/SuccessorArithmetic/Interface/ModelTheory/Model.lean`

## Content Ownership By File

- `Operation/*/Interface/Signature/Definition.lean`
  - subject-facing operator signature vocabulary
  - no carrier-specific proofs
- `Operation/*/Interface/ModelTheory/Model.lean`
  - operator-level model contract
  - witness fields required for existence / uniqueness / realization
- `Operation/*/Interface/ModelTheory/Theory.lean`
  - theory-level packaging of operator obligations
- `Operation/*/Interface/ModelTheory/LStructure.lean`
  - interpretation of the operator contract as a first-class structure
- `Operation/*/Interface/UniversalAlgebra/Signature/Definition.lean`
  - equation-facing signature for the operator
- `Operation/*/Interface/UniversalAlgebra/Satisfy_Generic.lean`
  - bridge from the operator realization to the UA-facing surface
- `NumberSystems/*/Interface/ModelTheory/Model.lean`
  - subject contracts rewritten to consume generic operator interfaces
  - structure-law bundles remain required where they are still the canonical
    subject-level contract

## Execution Checklist

### 1. Create operator `Interface/` subtrees

- [ ] Add the required `Interface/` directories for `Addition`.
- [ ] Add the required `Interface/` directories for `Multiplication`.
- [ ] Add router imports so the new interface files are reachable from the
  operator surface.

Success criteria:
- both generic operators have explicit model-facing and UA-facing homes

### 2. Define operator-level model contracts

- [ ] In `Addition/Interface/ModelTheory/Model.lean`, define the promoted
  addition contract in terms of the Phase 2 operator artifacts.
- [ ] In `Multiplication/Interface/ModelTheory/Model.lean`, define the promoted
  multiplication contract in terms of the Phase 2 operator artifacts.
- [ ] Keep existence and uniqueness ownership with the operator interfaces,
  consistent with `DECISIONS.md`.

Success criteria:
- a subject can require generic addition or generic multiplication as a named
  interface dependency

### 3. Define equation-facing operator surfaces

- [ ] Add `UniversalAlgebra/Signature/Definition.lean` for both operators.
- [ ] Add `UniversalAlgebra/Satisfy_Generic.lean` for both operators.
- [ ] Keep these files as restatement layers, not alternative law owners.

Success criteria:
- each promoted operator has an explicit UA signature and a generic
  satisfaction bridge entrypoint

### 4. Adopt the operators in scalar-chain subject interfaces

- [ ] Update `NaturalNumbers`, `PositiveNaturals`, `WholeNumbers`, and
  `ZeroBasedNaturals` model contracts to state their addition and
  multiplication dependencies through the new generic operator interfaces where
  applicable.
- [ ] Update `Integers`, `RationalNumbers`, `RealNumbers`, and
  `ComplexNumbers` model contracts the same way.
- [ ] Record any subject that still must stay on the older raw-instance surface
  as a temporary exception in the phase notes and `status.md`.

Success criteria:
- the scalar-chain model files clearly identify which generic operator
  interfaces they require

### 5. Evaluate Gaussian integers explicitly

- [ ] Inspect `GaussianIntegers/Interface/ModelTheory/Model.lean`.
- [ ] Decide whether it joins the same operator-adoption track now or is left
  to a later subject-specific phase.
- [ ] Record the decision in `status.md` and `ledger.json`.

### 6. Preserve subject/structure separation

- [ ] Keep operator existence / uniqueness in the promoted operator interfaces.
- [ ] Keep law bundles owned by `LRA/AlgebraicStructures/*`.
- [ ] Keep UA equation-level restatements owned by the operator UA and
  `LRA/UniversalAlgebra/*` layers.

Required rule:
- subject interfaces may consume all three layers, but may not duplicate their
  ownership roles

### 7. Record resumable progress

- [ ] Update `docs/landau-satisfaction/status.md`.
- [ ] Update `docs/landau-satisfaction/ledger.json`.
- [ ] Record any deferred subject exception explicitly before ending the phase.

## Deliverables

- `LRA/Operation/Addition/Interface/*`
- `LRA/Operation/Multiplication/Interface/*`
- updated scalar-chain `NumberSystems/*/Interface/ModelTheory/Model.lean`
  files that identify the new generic operator dependencies

## Build Gates

Run after each change block:

- `lake build LRA.Operation.Addition`
- `lake build LRA.Operation.Multiplication`
- `lake build LRA.NumberSystems.NaturalNumbers.Interface.ModelTheory.Model`
- `lake build LRA.NumberSystems.Integers.Interface.ModelTheory.Model`

Run at phase completion:

- `lake build`

## Out of Scope

- construction-local law proofs
- mixed-operator arithmetic laws
- repo-wide theorem completion beyond the interface promotion work
