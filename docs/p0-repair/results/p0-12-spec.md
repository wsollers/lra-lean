# p0-12 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/NumberSystems/Integers`
- Build target: `LRA.NumberSystems.Integers`
- Last good stop: spec frozen on disk and ready for implementation

## Brief Summary

`p0-12` is live in the shared whole-number input contract for the
formal-difference integer constructions.

The owner
[LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Carrier.lean:1)
still only required `addition_preserves_order`, so the quotient-order surface
could compare translated sums without requiring the common translation to be
cancellable on order. The Tao and Mendelson carrier aliases inherit that same
contract, so their public carrier docs must align with the stronger input law.

## Exact Repair List

- Change
  [LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Carrier.lean:1).
  Replace `addition_preserves_order` in
  `WholeNumberArithmeticForQuotientPairs` with a stronger
  `addition_preserves_and_reflects_order` field whose logical surface is an
  equivalence:
  `nonstrict_order (addition first translation) (addition second translation) ↔ nonstrict_order first second`.

- Change
  [LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Carrier.lean:1).
  Align the module commentary and the structure docstring so the active owner
  explicitly states that quotient-order comparisons rely on cancellation of a
  common translation.

- Change
  [LRA/NumberSystems/Integers/Constructions/Tao/Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/Integers/Constructions/Tao/Carrier.lean:1).
  Update the module comment and the
  `WholeNumberArithmeticForTaoFormalDifferences` abbreviation docstring so Tao
  explicitly inherits the strengthened translation-order reflection contract.

- Change
  [LRA/NumberSystems/Integers/Constructions/Mendelson/Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/Integers/Constructions/Mendelson/Carrier.lean:1).
  Update the module comment and the `PositiveNaturalPairData` abbreviation
  docstring so Mendelson explicitly inherits the strengthened translation-order
  reflection contract.

## Acceptance Criteria

- `WholeNumberArithmeticForQuotientPairs` requires translation-order
  preservation and reflection under common addition, not only preservation.
- The quotient-ordered-pairs owner docs explain why quotient comparisons need
  that stronger cancellation law.
- The Tao and Mendelson carrier aliases document that they inherit the same
  strengthened whole-number input contract.
- `python scripts/validate_structure.py --path LRA/NumberSystems/Integers`
  passes.
- `lake build LRA.NumberSystems.Integers` passes.

## Blockers Or Dependencies

No earlier open P0 blocks this item. `p0-13` may later build a canonical
whole-number-to-formal-difference adapter on top of this contract, but `p0-12`
can be closed by strengthening the shared input law and aligning the inherited
carrier surfaces.
