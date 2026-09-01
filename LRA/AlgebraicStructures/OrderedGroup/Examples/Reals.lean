import Mathlib.Data.Real.Basic
import Mathlib.Algebra.Order.Monoid.TypeTags
import LRA.AlgebraicStructures.OrderedGroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.OrderedGroup.Examples

/-- `Multiplicative Real` packages `(ℝ, +, 0, ≤)` as an ordered group in
multiplicative notation, free via the subject-local Mathlib bridge. -/
example : LRA.AlgebraicStructures.OrderedGroupLaws (Multiplicative Real) := inferInstance

end LRA.AlgebraicStructures.OrderedGroup.Examples
