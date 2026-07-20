# Step 4a: First-Order Logic First Pass

## Goal

Begin first-order logic as the next Volume I logic layer, using the shared
`Logic` interface as an outer mixin target without forcing first-order syntax
into the current propositional `LogicalFormula` helper.

## Starting Design

First-order logic should have its own syntax:

- a first-order language with function symbols, relation symbols, and arities;
- terms built from variables and function symbols;
- formulas built from relation applications, equality, connectives, and
  quantifiers;
- structures with a domain plus interpretations of function and relation
  symbols;
- assignments from variables into the domain;
- term evaluation and formula satisfaction.

The resulting first-order development should expose a value implementing the
shared `Logic` interface when there is a natural closed-formula or
assignment-aware wrapper. Do not contort the syntax merely to fit the simpler
`LogicalLanguage` / `LogicalFormula` helper.

## Proposed Lean Locations

```text
LRA/VolumeI/Logic/FirstOrderLogic.lean
LRA/VolumeI/Logic/FirstOrderLogic/
  FirstOrderLogic.lean
  Language.lean
  Term.lean
  Formula.lean
  Structure.lean
  Semantics.lean
  Examples.lean
```

The aggregate `LRA/VolumeI/Logic/FirstOrderLogic.lean` should import the child
modules once they exist.

## Initial Implementation Order

1. `Language.lean`: define function symbols, relation symbols, and arities.
2. `Term.lean`: define variables and terms.
3. `Formula.lean`: define relation applications, equality, Boolean
   connectives, and quantifiers.
4. `Structure.lean`: define domains and interpretations.
5. `Semantics.lean`: define assignments, assignment update, term evaluation,
   and satisfaction.
6. `Examples.lean`: add one tiny language and a compile-time wiring example.

## Design Constraints

- Keep first-order syntax modern and readable.
- Use Lean's native `Prop` for actual metatheoretic proofs.
- Use `sorry` for meaningful proof targets, not for fake definitions.
- Do not build model theory broadly yet; include only the semantic machinery
  needed to understand first-order satisfaction.
- Do not move to sets until this first-order architecture is accepted.

## Open Questions

- Should variables be an explicit type parameter, a named inductive type for
  examples, or a de Bruijn representation?
- Should arities use `Nat` with `Vector`, or should the first pass use lists and
  a well-formedness predicate?
- Should first-order `Logic.satisfies` represent closed-formula satisfaction,
  or should the first implementation expose assignment-parametrized
  satisfaction separately and delay the `Logic` implementation?
