# p0-14 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/NumberSystems/RationalNumbers`
- Build target: `LRA.NumberSystems.RationalNumbers`
- Last good stop: spec frozen on disk and ready for implementation

## Brief Summary

`p0-14` is live in the shared rational quotient-fractions input surface.

The owner
[LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Carrier.lean:1)
still mixed two distinct concerns in `IntegerAndPositiveNaturalData`:
the core denominator data required to form fraction representatives, and the
optional `absolute_numerator` / `gcd` helpers only needed for reduced-form
statements. At the same time, the core contract still lacked an adequacy
witness that every positive integer magnitude can actually be realized by some
denominator backend value.

## Exact Repair List

- Change
  [LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Carrier.lean:1).
  Strengthen the core `IntegerAndPositiveNaturalData` record with an explicit
  denominator adequacy field
  `every_positive_integer_has_denominator`, requiring every positive integer
  in the selected integer system to be represented by some positive-natural
  denominator carrier element.

- Change
  [LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Carrier.lean:1).
  Remove `absolute_numerator` and `gcd` from the core fraction-field input and
  move them into a separate extension record
  `IntegerAndPositiveNaturalReductionData`, so reduced-form infrastructure is
  explicitly opt-in rather than silently baked into every construction.

- Change
  [LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Behavior.lean](/F:/repos/lra-lean/LRA/NumberSystems/RationalNumbers/Constructions/RationalQuotientFractions/Behavior.lean:1).
  Retarget the reduced-form declarations (`IsReduced`,
  `reduced_representative_exists`, `reduced_representative_unique`, and
  `unique_lowest_term_form`) to consume the new reduction-enriched data while
  leaving the core quotient-fractions carrier and fraction-field pipeline on
  the leaner base contract.

## Acceptance Criteria

- `IntegerAndPositiveNaturalData` requires an explicit witness that every
  positive integer can be realized as a denominator value.
- `absolute_numerator` and `gcd` are no longer part of the core
  quotient-fractions input record.
- Reduced-form declarations consume a separate
  `IntegerAndPositiveNaturalReductionData` enrichment.
- `python scripts/validate_structure.py --path LRA/NumberSystems/RationalNumbers`
  passes.
- `lake build LRA.NumberSystems.RationalNumbers` passes.

## Blockers Or Dependencies

No earlier open P0 blocks this item. Later rational-construction follow-ups
may add stronger canonicality or realization structure, but `p0-14` can be
closed now by separating core denominator adequacy from optional reduced-form
machinery inside the rational quotient-fractions owner.
