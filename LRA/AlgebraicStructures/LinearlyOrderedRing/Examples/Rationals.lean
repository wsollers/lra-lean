import Mathlib.Algebra.Order.Ring.Rat
import LRA.AlgebraicStructures.LinearlyOrderedRing.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.LinearlyOrderedRing.Examples

/-- `(ℚ, +, *, 0, 1, -, ≤)` on `Rat` itself, free via the subject-local
Mathlib bridge. -/
example : LRA.AlgebraicStructures.LinearlyOrderedRingLaws Rat := inferInstance

end LRA.AlgebraicStructures.LinearlyOrderedRing.Examples
