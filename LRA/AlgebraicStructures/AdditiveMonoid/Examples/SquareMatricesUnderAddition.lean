import Mathlib.LinearAlgebra.Matrix.Defs
import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.AdditiveMonoid.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.AdditiveMonoid.Examples

/-- `(M_{n×n}(ℝ), +, 0_{n×n})` — square matrices under (entrywise) addition,
with the zero matrix as identity. Unlike the multiplicative
`Monoid.Examples.SquareMatrices`, this needs no `Fintype`/`DecidableEq` on the
index type — matrix addition is just the pointwise `Pi` addition on the
entries, so it's free via the generic Mathlib bridge for any index type `n`,
not just `Fin n`. Also an additive *group* (the user's own note), though
that's `AdditiveGroup`'s subject, not this one's. -/
example {n : Type} :
    LRA.AlgebraicStructures.AdditiveMonoidLaws (Matrix n n Real) :=
  inferInstance

end LRA.AlgebraicStructures.AdditiveMonoid.Examples
