import LRA.EuclideanSpace.Interface.Point.Definition
import LRA.EuclideanSpace.Interface.Point.Laws

/-!
Aggregate import for the `Interface.Point` concept: the canonical
generic point, `Point n R` -- an `n`-tuple over an abstract ordered
field `R`, not fixed to Mathlib's `ℝ` or to any one `RealModel`
construction. `Point`, `sumFin`, and the `Between`/`Congruent` instances
live in `Point/Definition.lean`; the proof that `Point n R` satisfies
`Interface.Laws` (with each theorem's hypotheses stating exactly how
much of `OrderedFieldLaws R` it actually needs) lives in `Point/Laws.lean`.
-/
