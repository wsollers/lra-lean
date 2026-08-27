import Mathlib.Algebra.Order.Archimedean.Basic
import LRA.AlgebraicStructures.Archimedean.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.Archimedean.Examples

/-- `ℚ` is Archimedean too — the property survives from an ordered ring to its
field of fractions, since the embedding of `ℤ` (or `ℕ`) stays cofinal. Comes for
free from the Mathlib bridge, since `Rat` is already a Mathlib `Archimedean`
linear ordered field. This is exactly the ordered-field formulation from the
user's spec: the canonical copies of `1` are cofinal in `ℚ`. -/
example : LRA.AlgebraicStructures.ArchimedeanLaw Rat := inferInstance

end LRA.AlgebraicStructures.Archimedean.Examples
