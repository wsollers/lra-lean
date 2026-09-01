import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.OrderedField.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.OrderedField.Examples

/-- `(ℝ, +, *, 0, 1, -, ⁻¹, ≤)` on `Real` itself, free via the subject-local
Mathlib bridge. -/
example : LRA.AlgebraicStructures.OrderedFieldLaws Real := inferInstance

end LRA.AlgebraicStructures.OrderedField.Examples
