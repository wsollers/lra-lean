import Mathlib.Data.Real.Basic
import Mathlib.Algebra.Order.Monoid.TypeTags
import LRA.AlgebraicStructures.LinearlyOrderedGroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.LinearlyOrderedGroup.Examples

/-- `Multiplicative Real` packages `(ℝ, +, 0, ≤)` as a linearly ordered group in
multiplicative notation, free via the subject-local Mathlib bridge. -/
example : LRA.AlgebraicStructures.LinearlyOrderedGroupLaws (Multiplicative Real) := inferInstance

end LRA.AlgebraicStructures.LinearlyOrderedGroup.Examples
