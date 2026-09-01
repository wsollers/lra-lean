import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.Field.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.Field.Examples

/-- `(ℝ, +, *, 0, 1, -, ⁻¹)` on `Real` itself, free via the subject-local
Mathlib bridge. -/
example : LRA.AlgebraicStructures.FieldLaws Real := inferInstance

end LRA.AlgebraicStructures.Field.Examples
