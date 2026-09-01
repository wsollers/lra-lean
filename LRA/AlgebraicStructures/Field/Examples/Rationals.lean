import Mathlib.Algebra.Field.Rat
import LRA.AlgebraicStructures.Field.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.Field.Examples

/-- `(ℚ, +, *, 0, 1, -, ⁻¹)` on `Rat` itself, free via the subject-local
Mathlib bridge. -/
example : LRA.AlgebraicStructures.FieldLaws Rat := inferInstance

end LRA.AlgebraicStructures.Field.Examples
