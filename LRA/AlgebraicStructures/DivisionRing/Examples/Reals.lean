import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.DivisionRing.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.DivisionRing.Examples

/-- `(ℝ, +, *, 0, 1, -, ⁻¹)` on `Real` itself, free via the subject-local
Mathlib bridge. -/
example : LRA.AlgebraicStructures.DivisionRingLaws Real := inferInstance

end LRA.AlgebraicStructures.DivisionRing.Examples
