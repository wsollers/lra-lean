import Mathlib.Algebra.Order.Ring.Int
import LRA.AlgebraicStructures.OrderedRing.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.OrderedRing.Examples

/-- `(ℤ, +, *, 0, 1, -, ≤)` on `Int` itself, free via the subject-local
Mathlib bridge. -/
example : LRA.AlgebraicStructures.OrderedRingLaws Int := inferInstance

end LRA.AlgebraicStructures.OrderedRing.Examples
