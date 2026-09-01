import Mathlib.Algebra.Field.Rat
import LRA.AlgebraicStructures.Ring.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.Ring.Examples

/-- `(ℚ, +, *, 0, 1, -)` on `Rat` itself, free via the subject-local Mathlib bridge. -/
example : LRA.AlgebraicStructures.RingLaws Rat := inferInstance

end LRA.AlgebraicStructures.Ring.Examples
