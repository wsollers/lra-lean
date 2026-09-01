import Mathlib.Algebra.Ring.Int.Defs
import LRA.AlgebraicStructures.CommutativeRing.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.CommutativeRing.Examples

/-- `(ℤ, +, *, 0, 1, -)` on `Int` itself, free via the subject-local Mathlib bridge. -/
example : LRA.AlgebraicStructures.CommutativeRingLaws Int := inferInstance

end LRA.AlgebraicStructures.CommutativeRing.Examples
