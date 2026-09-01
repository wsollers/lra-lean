import Mathlib.Algebra.Ring.Nat
import LRA.AlgebraicStructures.CommutativeSemiring.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.CommutativeSemiring.Examples

/-- `(ℕ, +, *, 0, 1)` on `Nat` itself, free via the generic commutative-semiring
bridge. -/
example : LRA.AlgebraicStructures.CommutativeSemiringLaws Nat := inferInstance

end LRA.AlgebraicStructures.CommutativeSemiring.Examples
