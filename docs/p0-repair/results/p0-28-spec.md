# p0-28 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/Logic`; `LRA/NumberSystems`
- Build target: `LRA.Logic`; `LRA.NumberSystems.PeanoSystem`; `LRA.NumberSystems.IntegerStructure`
- Last good stop: `2026-08-23`: spec frozen on disk and implemented on `main`

## Brief Summary

`p0-28` repairs a live mismatch in the second-order logic owner surface. The
Henkin model semantics already quantify bound set variables only over
`M.SecondOrderDomain`, but free set-variable assignments were still allowed to
denote arbitrary subsets of `M.Domain`. That breaks the intended Henkin
restriction and makes the exposed satisfaction relation stronger than the model
carrier says it is.

The same review item also flags a naming and assumption problem in the generic
Peano and Integer interface model-theory layers. Their active second-order
induction surfaces quantify over a `HenkinModel`, not over every subset of the
carrier, so they should be described as Henkin second-order theories unless an
explicit fullness/comprehension certificate is supplied.

The bounded repair is therefore:

- make free set-variable assignments prove admissibility in
  `M.SecondOrderDomain`,
- thread that admissibility through second-order satisfaction,
- add an explicit `HasFullSecondOrderSemantics` certificate on `HenkinModel`,
- retarget the generic Peano and Integer interface theory/model surfaces so the
  live names and docs say Henkin second-order, while preserving compatibility
  aliases for the old exported names.

## Exact Repair List

- Extend
  [LRA/Logic/Model/SecondOrderMonadic/HenkinModel.lean](/F:/repos/lra-lean/LRA/Logic/Model/SecondOrderMonadic/HenkinModel.lean:1)
  with `HasFullSecondOrderSemantics`, the explicit certificate needed before a
  Henkin model may be treated as full second-order.

- Strengthen
  [LRA/Logic/Semantics/SecondOrderMonadic/SOAssignment.lean](/F:/repos/lra-lean/LRA/Logic/Semantics/SecondOrderMonadic/SOAssignment.lean:1)
  so every free set-variable assignment carries a proof that its assigned set
  lies in `M.SecondOrderDomain`, and provide an admissibility-preserving
  `updateSetAssignment`.

- Retarget
  [LRA/Logic/Semantics/SecondOrderMonadic/SOSatisfaction.lean](/F:/repos/lra-lean/LRA/Logic/Semantics/SecondOrderMonadic/SOSatisfaction.lean:1),
  [Examples.lean](/F:/repos/lra-lean/LRA/Logic/Semantics/SecondOrderMonadic/Examples.lean:1),
  and
  [LRA/Logic/Theory.lean](/F:/repos/lra-lean/LRA/Logic/Theory.lean:1)
  so the live semantics and examples consistently treat both free and bound set
  variables as Henkin-admissible assignments.

- Retarget
  [LRA/NumberSystems/PeanoSystem/Interface/ModelTheory/Theory.lean](/F:/repos/lra-lean/LRA/NumberSystems/PeanoSystem/Interface/ModelTheory/Theory.lean:1)
  and
  [Model.lean](/F:/repos/lra-lean/LRA/NumberSystems/PeanoSystem/Interface/ModelTheory/Model.lean:1)
  to expose `PeanoHenkinTheory` as the canonical surface, keep
  `PeanoTheory`/`PeanoAxioms` as compatibility aliases, and document that full
  second-order semantics would additionally require
  `HasFullSecondOrderSemantics`.

- Retarget
  [LRA/NumberSystems/IntegerStructure/Interface/ModelTheory/Theory.lean](/F:/repos/lra-lean/LRA/NumberSystems/IntegerStructure/Interface/ModelTheory/Theory.lean:1)
  and
  [Model.lean](/F:/repos/lra-lean/LRA/NumberSystems/IntegerStructure/Interface/ModelTheory/Model.lean:1)
  to expose `IntegerStructureHenkinTheory` as the canonical surface, keep
  `IntegerStructureTheory`/`IntegerStructureAxioms` as compatibility aliases,
  and document the same fullness requirement explicitly.

- Align
  [LRA/NumberSystems/Integers/ProofOrder.md](/F:/repos/lra-lean/LRA/NumberSystems/Integers/ProofOrder.md:1)
  with the live Henkin-theory naming so the authoritative queue notes point to
  the repaired theorem surface.

## Acceptance Criteria

- The second-order logic owner no longer permits free set-variable assignments
  to denote arbitrary subsets of `M.Domain`; each free set assignment must be
  admissible in `M.SecondOrderDomain`.
- The second-order satisfaction relation preserves that admissibility when it
  updates set variables under `forallSet`.
- The generic Peano and Integer interface model-theory surfaces now describe
  the live induction theories as Henkin second-order and reserve full
  second-order semantics for models carrying an explicit fullness certificate.
- The repair stays bounded to the second-order logic owner plus the directly
  affected Peano/Integer interface model-theory surfaces and proof-order note.
- `python scripts/validate_structure.py --path LRA/Logic` passes.
- `python scripts/validate_structure.py --path LRA/NumberSystems` passes.
- `lake build LRA.Logic` passes.
- `lake build LRA.NumberSystems.PeanoSystem` passes.
- `lake build LRA.NumberSystems.IntegerStructure` passes.

## Blockers Or Dependencies

No earlier open P0 blocks this item.
