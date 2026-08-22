# p0-18 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/NumberSystems/RealNumbers`
- Build target: `LRA.NumberSystems.RealNumbers`
- Last good stop: spec frozen on disk and ready for implementation

## Brief Summary

`p0-18` is a bounded Dedekind-behavior repair. The live defect is not the
general rational-system threading that `p0-17` already closed; it is the still
false theorem surface in
`LRA/NumberSystems/RealNumbers/Constructions/Dedekind/Behavior.lean` that
claims an Archimedean-style conclusion from an arbitrary type and an arbitrary
map into the selected rational field.

The repair should replace that arbitrary natural-map surface with the actual
integer stage and actual integer embedding already carried by
`RationalNumberSystem`, and the final Dedekind summary should include that same
corrected cofinality clause.

## Exact Repair List

- Change
  [LRA/NumberSystems/RealNumbers/Constructions/Dedekind/Behavior.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Dedekind/Behavior.lean:1).
  Replace the current theorem
  `archimedean_property (natural_carrier) (natural_to_rational) ...` with a
  theorem over the actual selected integer stage:
  it should quantify over a cofinality witness for
  `rationalSystem.IntegerEmbedding.ToField`, and conclude the existence of an
  actual integer from `rationalSystem.IntegerSystem.Model` whose embedded image
  lies strictly above the given Dedekind cut after applying
  `rational_embedding`.

- In that same file, change
  `ReferenceRealNumberConstruction` so its final summary no longer omits the
  corrected Archimedean clause. It should keep the existing complete
  ordered-field clause and embedded-rational density clause, and add the same
  cofinality condition used by `archimedean_property`.

- In that same file, align the theorem docstrings and logical-form blocks with
  the repaired theorem surfaces. Leave `embedded_rationals_are_dense`
  unchanged.

- Do not widen into
  [LRA/NumberSystems/RealNumbers/Constructions/Dedekind/WellDefinedness.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Dedekind/WellDefinedness.lean:1),
  [Dedekind/Laws.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Dedekind/Laws.lean:1),
  `ConstructionModels.lean`, or the rational-number construction routers.
  `p0-18` closes by repairing the active Dedekind behavior theorem surface only.

## Acceptance Criteria

- `archimedean_property` in the Dedekind behavior owner no longer accepts an
  arbitrary `Type` together with an arbitrary map into the selected rational
  field.
- The theorem instead uses the actual selected integer stage and the actual
  integer embedding supplied by `rationalSystem`, with an explicit cofinality
  witness on that embedding.
- `ReferenceRealNumberConstruction` and
  `reference_real_number_construction` include the same corrected Archimedean
  clause rather than summarizing only completeness and density.
- `python scripts/validate_structure.py --path LRA/NumberSystems/RealNumbers`
  passes.
- `lake build LRA.NumberSystems.RealNumbers` passes.

## Blockers Or Dependencies

No earlier open P0 blocks this item.

`p0-19` still remains for the stronger Cauchy metric-law repair. `p0-18` does
not change Cauchy, Cantor, Dyadic, PrimitiveIntervals, or abstract comparison
layers.
