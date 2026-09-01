import Mathlib.Algebra.Order.Ring.Nat
import LRA.AlgebraicStructures.OrderedSemiring.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.OrderedSemiring.Examples

/-- `(ℕ, +, *, 0, 1, ≤)` as an ordered semiring, free via the subject-local
Mathlib bridge. -/
example : LRA.AlgebraicStructures.OrderedSemiringLaws Nat := inferInstance

end LRA.AlgebraicStructures.OrderedSemiring.Examples
