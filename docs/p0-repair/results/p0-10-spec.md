# p0-10 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/VolumeII/NumberSystems`
- Build target: `LRA.VolumeII.NumberSystems`
- Last good stop: spec frozen on disk and ready for implementation

## Brief Summary

`p0-10` is only partially open on current `main`.
[LRA/NumberSystems/Integers/UniversalProperty.lean](/F:/repos/lra-lean/LRA/NumberSystems/Integers/UniversalProperty.lean:17)
already states integer initiality with `∃!`, and
[LRA/NumberSystems/RationalNumbers/UniversalProperty.lean](/F:/repos/lra-lean/LRA/NumberSystems/RationalNumbers/UniversalProperty.lean:24)
already states the rational fraction-field universal property with `∃!`.

The remaining live defect is the real universal-property surface. The canonical owner
[LRA/VolumeII/NumberSystems/UniversalProperties.lean](/F:/repos/lra-lean/LRA/VolumeII/NumberSystems/UniversalProperties.lean:23)
names `UniqueUpToOrderedFieldIsomorphism`, but currently only asserts existence of an ordered-field embedding. That is weaker than both uniqueness and isomorphism.

The derived theorem
[complete_archimedean_ordered_field_unique](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Extensions.lean:161)
duplicates the same weaker real claim and must be kept aligned in the same pass so the active theorem surface does not immediately diverge.

## Exact Repair List

- No change is required to [LRA/NumberSystems/Integers/UniversalProperty.lean](/F:/repos/lra-lean/LRA/NumberSystems/Integers/UniversalProperty.lean:17).
  `IntegerInitiality` already uses `∃! map, ...`.

- No change is required to [LRA/NumberSystems/RationalNumbers/UniversalProperty.lean](/F:/repos/lra-lean/LRA/NumberSystems/RationalNumbers/UniversalProperty.lean:24).
  `FractionFieldUniversalProperty` already uses `∃! rationalMap, ...`.

- Change [LRA/VolumeII/NumberSystems/UniversalProperties.lean](/F:/repos/lra-lean/LRA/VolumeII/NumberSystems/UniversalProperties.lean:23).
  Strengthen `CompleteOrderedFieldCharacterization.UniqueUpToOrderedFieldIsomorphism` from
  `∃ comparison, EmbeddingPreservesOrderedField ... comparison`
  to
  `∃! comparison, EmbeddingPreservesOrderedField ... comparison ∧ LRA.Function.Surjective comparison`.
  Update the surrounding documentation block to the same logical form, and import the in-house function-surjectivity definition explicitly.

- Change [LRA/NumberSystems/RealNumbers/Extensions.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Extensions.lean:151).
  Strengthen `complete_archimedean_ordered_field_unique` to the same
  `∃! comparison, EmbeddingPreservesOrderedField ... comparison ∧ LRA.Function.Surjective comparison`
  statement, and update its theorem comment accordingly.

- Do not edit [docs/commentary/hover_comments.json](/F:/repos/lra-lean/docs/commentary/hover_comments.json:3645).
  It is generated commentary output and not the canonical theorem owner for this P0.

## Acceptance Criteria

- `IntegerInitiality` remains uniquely quantified and unchanged in substance.
- `FractionFieldUniversalProperty` remains uniquely quantified and unchanged in substance.
- `UniqueUpToOrderedFieldIsomorphism` in the canonical Volume II owner now states a unique surjective ordered-field comparison.
- `complete_archimedean_ordered_field_unique` now matches that stronger real categoricity surface.
- `python scripts/validate_structure.py --path LRA/VolumeII/NumberSystems` passes.
- `lake build LRA.VolumeII.NumberSystems` passes.

## Blockers Or Dependencies

No earlier P0 blocks this item. The integer and rational portions are already repaired on `main`; the remaining work is the bounded real-theorem surface update above.
