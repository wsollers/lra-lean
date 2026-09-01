import Mathlib.Algebra.Order.Field.Rat
import LRA.AlgebraicStructures.OrderedField.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.OrderedField.Examples

/-- `(ℚ, +, *, 0, 1, -, ⁻¹, ≤)` on `Rat` itself, free via the subject-local
Mathlib bridge. -/
example : LRA.AlgebraicStructures.OrderedFieldLaws Rat := inferInstance

end LRA.AlgebraicStructures.OrderedField.Examples
