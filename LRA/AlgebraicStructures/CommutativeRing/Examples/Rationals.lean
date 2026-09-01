import Mathlib.Algebra.Field.Rat
import LRA.AlgebraicStructures.CommutativeRing.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.CommutativeRing.Examples

/-- `(ℚ, +, *, 0, 1, -)` on `Rat` itself, free via the subject-local Mathlib bridge. -/
example : LRA.AlgebraicStructures.CommutativeRingLaws Rat := inferInstance

end LRA.AlgebraicStructures.CommutativeRing.Examples
