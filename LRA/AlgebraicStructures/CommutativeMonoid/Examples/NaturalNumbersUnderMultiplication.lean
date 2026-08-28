import Mathlib.Algebra.Group.Nat.Defs
import LRA.AlgebraicStructures.CommutativeMonoid.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.CommutativeMonoid.Examples

/-- `(ℕ, ×, 1)` — free directly on `Nat` itself: it's already a `CommMonoid`
in Mathlib, so this comes for free via `Constructions/Mathlib/Laws.lean`'s
generic bridge, same as `Monoid.Examples.NaturalNumbersUnderMultiplication`. -/
example : LRA.AlgebraicStructures.CommutativeMonoidLaws Nat := inferInstance

end LRA.AlgebraicStructures.CommutativeMonoid.Examples
