import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.CommutativeRing.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.CommutativeRing.Examples

/-- `(ℝ, +, *, 0, 1, -)` on `Real` itself, free via the subject-local Mathlib bridge. -/
example : LRA.AlgebraicStructures.CommutativeRingLaws Real := inferInstance

end LRA.AlgebraicStructures.CommutativeRing.Examples
