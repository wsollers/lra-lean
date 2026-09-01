import Mathlib.Algebra.Order.Ring.Int
import LRA.AlgebraicStructures.LinearlyOrderedRing.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.LinearlyOrderedRing.Examples

/-- `(ℤ, +, *, 0, 1, -, ≤)` on `Int` itself, free via the subject-local
Mathlib bridge. -/
example : LRA.AlgebraicStructures.LinearlyOrderedRingLaws Int := inferInstance

end LRA.AlgebraicStructures.LinearlyOrderedRing.Examples
