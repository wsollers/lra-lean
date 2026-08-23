# p0-25 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/NumberSystems`
- Build target: `LRA.NumberSystems.PeanoSystem`; `LRA.NumberSystems.IntegerStructure`
- Last good stop: `2026-08-23`: spec frozen on disk and ready for implementation

## Brief Summary

`p0-25` repairs the generic Peano and Integer theorem surfaces so they stop
claiming categoricity and recursion from backend-relative induction alone.
The review note is correct: a weak Henkin backend can satisfy the represented
subset induction axioms while still omitting arbitrary Lean predicates, so the
generic categoricity and Peano recursion surfaces need an explicit adequacy
layer.

The bounded fix is to add a comprehension/adequacy witness plus derived full
predicate induction surfaces for the generic Peano and Integer interfaces, then
retarget the live categoricity and Peano recursion theorem surfaces to require
that stronger input explicitly.

## Exact Repair List

- Extend
  [LRA/NumberSystems/PeanoSystem/Definition.lean](/F:/repos/lra-lean/LRA/NumberSystems/PeanoSystem/Definition.lean:1)
  with an explicit predicate-set comprehension adequacy witness and a derived
  `FullPredicateInduction` proposition proving full Lean-predicate induction
  from backend adequacy.

- Extend
  [LRA/NumberSystems/IntegerStructure/Definition.lean](/F:/repos/lra-lean/LRA/NumberSystems/IntegerStructure/Definition.lean:1)
  analogously with a two-sided comprehension adequacy witness and derived
  `FullTwoSidedPredicateInduction`.

- Retarget the live generic categoricity theorem surfaces in
  [LRA/NumberSystems/PeanoSystem/Categoricity.lean](/F:/repos/lra-lean/LRA/NumberSystems/PeanoSystem/Categoricity.lean:1)
  and
  [LRA/NumberSystems/IntegerStructure/Categoricity.lean](/F:/repos/lra-lean/LRA/NumberSystems/IntegerStructure/Categoricity.lean:1)
  so they explicitly require the stronger full-induction hypotheses instead of
  overclaiming from backend-relative induction alone.

- Retarget the live generic recursion/iterator theorem family in
  [LRA/NumberSystems/PeanoSystem/Recursion/Iterator.lean](/F:/repos/lra-lean/LRA/NumberSystems/PeanoSystem/Recursion/Iterator.lean:1)
  so existence/uniqueness and the generated iterator surfaces explicitly depend
  on `FullPredicateInduction`.

- Align the authoritative owner notes in
  [LRA/NumberSystems/NaturalNumbers/ProofOrder.md](/F:/repos/lra-lean/LRA/NumberSystems/NaturalNumbers/ProofOrder.md:1)
  and
  [LRA/NumberSystems/Integers/ProofOrder.md](/F:/repos/lra-lean/LRA/NumberSystems/Integers/ProofOrder.md:1)
  with the repaired generic theorem surfaces.

## Acceptance Criteria

- The generic Peano and Integer interface files expose explicit
  predicate-comprehension adequacy records plus derived full-predicate
  induction propositions.
- The live generic categoricity surfaces no longer claim uniqueness from bare
  backend-relative induction.
- The live generic Peano recursion/iterator surfaces no longer claim existence
  and uniqueness from bare backend-relative induction.
- The authoritative natural/integer proof-order notes describe the stronger
  adequacy requirement accurately.
- `python scripts/validate_structure.py --path LRA/NumberSystems` passes.
- `lake build LRA.NumberSystems.PeanoSystem` passes.
- `lake build LRA.NumberSystems.IntegerStructure` passes.

## Blockers Or Dependencies

No earlier open P0 blocks this item.

The fix is confined to the generic Peano/Integer theorem surfaces and their
authoritative proof-order notes.
