import Mathlib.Algebra.Ring.Int.Defs
import LRA.AlgebraicStructures.Ring.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.Ring.Examples

/-- `(ℤ, +, *, 0, 1, -)` on `Int` itself, free via the subject-local Mathlib bridge. -/
example : LRA.AlgebraicStructures.RingLaws Int := inferInstance

end LRA.AlgebraicStructures.Ring.Examples
