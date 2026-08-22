# p0-15 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/NumberSystems/RationalNumbers`; `LRA/NumberSystems/RealNumbers`
- Build target: `LRA.NumberSystems.RationalNumbers`; `LRA.NumberSystems.RealNumbers`
- Last good stop: spec frozen on disk and ready for implementation

## Brief Summary

`p0-15` is live in the authored `sqrt-two` theorem surfaces for the rational
and real number layers.

The rational owner
[LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Behavior.lean](/F:/repos/lra-lean/LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Behavior.lean:1)
still parameterized the `sqrt-two` cut and the associated no-square/no-supremum
theorems by an arbitrary `two : Carrier rational_data`, so the theorem surface
did not actually name the canonical rational number two. The real owner
[LRA/NumberSystems/RealNumbers/Irrationals.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Irrationals.lean:1)
described the same value by inlining `one + one` directly inside
`SquareRootTwoWitness` instead of routing through a named canonical constant.

## Exact Repair List

- Change
  [LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Behavior.lean](/F:/repos/lra-lean/LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Behavior.lean:1).
  Add a canonical rational `two` definition in the quotient-fractions behavior
  owner, built from the selected integer embedding, and retarget
  `square_root_two_cut`, `square_root_two_cut_nonempty_bounded`,
  `no_rational_square_root_two`, and `square_root_two_cut_has_no_supremum` to
  that canonical `two` instead of accepting an arbitrary parameter.

- Change
  [LRA/NumberSystems/RealNumbers/Irrationals.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Irrationals.lean:1).
  Add named canonical `rational_two` and `real_two` definitions for the
  selected rational system and real extension, then restate
  `SquareRootTwoWitness.square_is_two` using `real_two` instead of an inline
  `one + one` expression.

- Do not edit generated artifacts such as `LRA/NumberSystems/ProofsToDo.md`.
  The authored theorem owners above are canonical for this P0.

## Acceptance Criteria

- The rational `sqrt-two` cut and its associated irrationality/order-completeness
  theorem surfaces no longer quantify over an arbitrary `two`.
- `SquareRootTwoWitness` names the selected real `2` through an explicit
  canonical definition rather than an inline expression.
- `python scripts/validate_structure.py --path LRA/NumberSystems/RationalNumbers`
  passes.
- `python scripts/validate_structure.py --path LRA/NumberSystems/RealNumbers`
  passes.
- `lake build LRA.NumberSystems.RationalNumbers` passes.
- `lake build LRA.NumberSystems.RealNumbers` passes.

## Blockers Or Dependencies

No earlier open P0 blocks this item. Later real-number repairs may strengthen
construction or comparison inputs, but the canonical-`two` surface can be
closed now without widening beyond the authored `sqrt-two` owners.
