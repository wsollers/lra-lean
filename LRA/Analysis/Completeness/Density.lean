import LRA.Analysis.Completeness.Density.Definition
import LRA.Analysis.Completeness.Density.Theorems

/-!
Aggregate import for the `Density` concept. `IsOrderDenseSubset`,
`IsRational`, and `IsIrrational` live in `Density/Definition.lean`; the
density theorems and their order-theoretic corollaries live in
`Density/Theorems.lean`. Rational/irrational arithmetic-closure facts were
dropped rather than migrated: they duplicate the generic theorems already
proven over an abstract `RationalModel`/`RealExtension` in
`LRA.NumberSystems.RealNumbers.Irrationals`, and the concrete Mathlib `ℚ`/`ℝ`
case follows directly from `Rat.cast_add` and friends.
-/
