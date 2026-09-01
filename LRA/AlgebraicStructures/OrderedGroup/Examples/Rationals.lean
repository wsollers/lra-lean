import Mathlib.Data.Rat.Defs
import Mathlib.Algebra.Order.Monoid.TypeTags
import LRA.AlgebraicStructures.OrderedGroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.OrderedGroup.Examples

/-- `Multiplicative Rat` packages `(ℚ, +, 0, ≤)` as an ordered group in
multiplicative notation, free via the subject-local Mathlib bridge. -/
example : LRA.AlgebraicStructures.OrderedGroupLaws (Multiplicative Rat) := inferInstance

end LRA.AlgebraicStructures.OrderedGroup.Examples
