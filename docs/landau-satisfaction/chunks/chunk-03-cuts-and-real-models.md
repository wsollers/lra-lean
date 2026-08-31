# Chunk 03 - Cuts And Real Models

Updated: 2026-08-30

## Purpose

Stabilize the model-theory and structure side needed to move from rationals to
real constructions, especially the `OrderedField` and `CompleteOrderedField`
endpoints and their subject-model consumers.

## Theorem Band

- Chapter III `Cuts` / real construction (Theorems 116–162)

## Algebraic-Structure Prerequisites

- `as-29` `OrderedRing`
- `as-30` `DivisionRing`
- `as-31` `IntegralDomain`
- `as-32` `LinearlyOrderedRing`
- `as-33` `Field`
- `as-34` `OrderedField`
- `as-35` `CompleteOrderedField`
- side input: `as-06` `Archimedean`

## Required Context

- `docs/landau-satisfaction/phases/phase-03-subject-interface-adoption.md`
- `docs/landau-satisfaction/phases/phase-04-concrete-construction-proofs.md`
- `docs/algebraic-structures-repair/ledger.json`

## Primary Files

- `LRA/AlgebraicStructures/Field/Interface/ModelTheory/*`
- `LRA/AlgebraicStructures/OrderedField/Interface/ModelTheory/*`
- `LRA/AlgebraicStructures/CompleteOrderedField/Interface/ModelTheory/*`
- `LRA/NumberSystems/RationalNumbers/Interface/ModelTheory/Model.lean`
- `LRA/NumberSystems/RealNumbers/Interface/ModelTheory/Model.lean`
- `LRA/NumberSystems/RealNumbers/Constructions/{Dedekind,Cauchy,EffectiveCauchy,Dyadic,Cantor,PrimitiveIntervals}/*`

## Checklist

- [ ] Confirm the field and ordered-field family `as-*` items are ready.
- [ ] Align the `Field`, `OrderedField`, and `CompleteOrderedField`
  model-theory surfaces.
- [ ] Route rational and real subject interfaces through those surfaces.
- [ ] Add or align the chapter-III cut/construction theorem artifacts in the
  owned real-construction files.
- [ ] Leave all new proofs as `sorry`.

## Success Gates

- `python scripts/validate_structure.py --path LRA/AlgebraicStructures/Field`
- `python scripts/validate_structure.py --path LRA/AlgebraicStructures/OrderedField`
- `python scripts/validate_structure.py --path LRA/AlgebraicStructures/CompleteOrderedField`
- `lake build LRA.NumberSystems.RationalNumbers.Interface.ModelTheory.Model`
- `lake build LRA.NumberSystems.RealNumbers.Interface.ModelTheory.Model`
- `lake build LRA.NumberSystems.RealNumbers.Constructions.Dedekind`
