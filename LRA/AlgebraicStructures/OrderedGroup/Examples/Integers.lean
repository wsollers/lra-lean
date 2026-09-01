import Mathlib.Algebra.Group.Int.Defs
import Mathlib.Algebra.Order.Monoid.TypeTags
import LRA.AlgebraicStructures.OrderedGroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.OrderedGroup.Examples

/-- `Multiplicative Int` packages `(ℤ, +, 0, ≤)` as an ordered group in
multiplicative notation, free via the subject-local Mathlib bridge. -/
example : LRA.AlgebraicStructures.OrderedGroupLaws (Multiplicative Int) := inferInstance

end LRA.AlgebraicStructures.OrderedGroup.Examples
