# p0-13 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/NumberSystems/Integers`
- Build target: `LRA.NumberSystems.Integers`
- Last good stop: spec frozen on disk and ready for implementation

## Brief Summary

`p0-13` is live in the shared input surface for the formal-difference integer
constructions.

The owner
[LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Carrier.lean:1)
still forced callers to hand-assemble every field of
`WholeNumberArithmeticForQuotientPairs`, even when the whole-number carrier
already came with the repository's canonical operation machines and law
certificates. Tao and Mendelson alias that same input type, so the missing
shared adapter should be repaired once in the quotient-pairs owner rather than
repeated under each construction.

## Exact Repair List

- Change
  [LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Carrier.lean:1).
  Add a shared builder
  `WholeNumberArithmeticForQuotientPairs.ofCarrier` that packages a
  canonically certified whole-number carrier into the formal-difference input
  record using the native machine surface `0`, `1`, `+`, `*`, and `≤`.

- Change
  [LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/Integers/Constructions/QuotientOrderedPairs/Carrier.lean:1).
  Make the builder consume the canonical certificate layer already used
  elsewhere in the repository: `CommutativeSemiringLaws` for the arithmetic
  part and `PartialOrderLaws` for the non-strict order part, together with the
  two extra whole-number-specific inputs that are not yet named canonical
  classes here:
  `addition_cancellative` and
  `addition_preserves_and_reflects_order`.

- Change
  [LRA/NumberSystems/Integers/Constructions/Tao/Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/Integers/Constructions/Tao/Carrier.lean:1)
  and
  [LRA/NumberSystems/Integers/Constructions/Mendelson/Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/Integers/Constructions/Mendelson/Carrier.lean:1).
  Align the alias documentation so both constructions explicitly point users to
  the shared quotient-pairs adapter instead of suggesting separate bespoke
  entry paths.

## Acceptance Criteria

- `WholeNumberArithmeticForQuotientPairs` exposes a shared `ofCarrier` adapter
  from canonical whole-number certificates into the formal-difference input
  record.
- The shared adapter reuses the native carrier machines and canonical law
  certificates instead of duplicating the record field-by-field at each call
  site.
- Tao and Mendelson carrier docs explicitly reference the shared adapter.
- `python scripts/validate_structure.py --path LRA/NumberSystems/Integers`
  passes.
- `lake build LRA.NumberSystems.Integers` passes.

## Blockers Or Dependencies

No earlier open P0 blocks this item. The later `p0-26` whole-number input
repair may further strengthen the upstream whole-number theorem surface, but
`p0-13` can be closed now by introducing the shared canonical adapter and
pointing every formal-difference construction at it.
