import Mathlib.LinearAlgebra.Matrix.Defs
import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.AdditiveGroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.AdditiveGroup.Examples

/-- `(M_{m×n}(ℝ), +, 0_{m×n}, -)` — matrices of a fixed dimension under
(entrywise) addition. Free via the generic Mathlib bridge, same import as
`AdditiveMonoid.Examples.SquareMatricesUnderAddition`
(`Mathlib.LinearAlgebra.Matrix.Defs` gives `AddCommGroup (Matrix m n α)` from
`[AddCommGroup α]`, no `Fintype`/`DecidableEq` needed for addition). Unlike
the square-only multiplicative `Monoid.Examples.SquareMatrices`, `m` and `n`
need not match here — addition doesn't require squareness. -/
example (m n : Type) : LRA.AlgebraicStructures.AdditiveGroupLaws (Matrix m n Real) :=
  inferInstance

end LRA.AlgebraicStructures.AdditiveGroup.Examples
