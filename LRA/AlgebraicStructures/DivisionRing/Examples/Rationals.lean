import Mathlib.Algebra.Field.Rat
import LRA.AlgebraicStructures.DivisionRing.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.DivisionRing.Examples

/-- `(ℚ, +, *, 0, 1, -, ⁻¹)` on `Rat` itself, free via the subject-local
Mathlib bridge. -/
example : LRA.AlgebraicStructures.DivisionRingLaws Rat := inferInstance

end LRA.AlgebraicStructures.DivisionRing.Examples
