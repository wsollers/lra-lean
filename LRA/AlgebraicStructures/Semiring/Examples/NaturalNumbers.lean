import Mathlib.Algebra.Ring.Nat
import LRA.AlgebraicStructures.Semiring.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.Semiring.Examples

/-- `(ℕ, +, *, 0, 1)` on `Nat` itself, free via the generic semiring bridge. -/
example : LRA.AlgebraicStructures.SemiringLaws Nat := inferInstance

end LRA.AlgebraicStructures.Semiring.Examples
