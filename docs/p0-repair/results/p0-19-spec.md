# p0-19 Spec Result

- Status: `completed`
- Task backend: `main-thread coordinator`
- Spec task id: `main-thread`
- Validator path: `LRA/NumberSystems/RealNumbers`
- Build target: `LRA.NumberSystems.RealNumbers`
- Last good stop: spec frozen on disk and ready for implementation

## Brief Summary

`p0-19` is the canonical-owner repair for the Cauchy construction's metric
input package. After `p0-17`, the active Cauchy pipeline already consumes an
actual `RationalNumberSystem`, but its `RationalMetricData` record is still too
weak: it allows an arbitrary triangle-inequality norm-like function with no
explicit multiplicative compatibility, no explicit ordered-field absolute-value
surface, and no explicit epsilon-splitting witness for the Cauchy arguments.

This P0 should strengthen that single owner record and align the directly
affected authored comments that describe the Cauchy and dyadic construction
inputs. It should not widen into new Cauchy law/completeness theorems or
abstract comparison layers.

## Exact Repair List

- Change
  [LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Carrier.lean:1).
  Strengthen `RationalMetricData` from a minimal norm-like package to a
  standard ordered-field absolute-value/epsilon package over the selected
  `RationalNumberSystem`. Add the missing explicit fields:
  `absolute_value_multiplication`, `absolute_value_self_or_neg`, and an
  `epsilon_split` witness stating that every positive epsilon admits a positive
  smaller element whose double is bounded by epsilon. Keep the existing
  zero/negation/triangle/nonnegativity/zero-iff fields.

- In that same file, align the surrounding docstring and logical-form block so
  they describe the stronger contract explicitly. Do not rename the record in
  this P0; the owner remains `RationalMetricData`.

- Change
  [LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Instances.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Cauchy/Instances.lean:1),
  [LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Carrier.lean](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Carrier.lean:145),
  and
  [LRA/NumberSystems/RealNumbers/ProofOrder.md](/F:/repos/lra-lean/LRA/NumberSystems/RealNumbers/ProofOrder.md:84)
  only to align the authored comments with the strengthened Cauchy input
  contract. These files already thread `RationalMetricData`; no signature
  changes beyond the stronger record fields are needed there.

- Do not widen into `Cauchy/Laws.lean`, `Cauchy/Behavior.lean`,
  `ConstructionModels.lean`, `Dedekind`, `Cantor`, `PrimitiveIntervals`, or
  `EffectiveCauchy`. `p0-19` closes by repairing the metric-data owner and the
  directly affected explanatory surfaces only.

## Acceptance Criteria

- `RationalMetricData` no longer exposes only triangle-inequality and sign
  symmetry data; it also states multiplicative compatibility and a standard
  ordered-field absolute-value surface.
- The same package explicitly records the positive-epsilon splitting witness
  used by Cauchy-style epsilon arguments.
- The directly affected Cauchy/dyadic/proof-order comments no longer describe
  the metric input as an arbitrary weak norm-like package.
- `python scripts/validate_structure.py --path LRA/NumberSystems/RealNumbers`
  passes.
- `lake build LRA.NumberSystems.RealNumbers` passes.

## Blockers Or Dependencies

No earlier open P0 blocks this item.

`p0-20` remains separate for the Cantor-equivalence/isomorphism defect. This
P0 does not invent new Cauchy comparison, field-law, or completeness theorems;
it only repairs the active metric-input contract those later theorem surfaces
would rely on.
