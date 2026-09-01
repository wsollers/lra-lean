import Mathlib.Algebra.Order.Ring.Rat
import LRA.AlgebraicStructures.OrderedRing.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.OrderedRing.Examples

/-- `(ℚ, +, *, 0, 1, -, ≤)` on `Rat` itself, free via the subject-local
Mathlib bridge. -/
example : LRA.AlgebraicStructures.OrderedRingLaws Rat := inferInstance

end LRA.AlgebraicStructures.OrderedRing.Examples
