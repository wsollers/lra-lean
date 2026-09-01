import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.LinearlyOrderedRing.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.LinearlyOrderedRing.Examples

/-- `(ℝ, +, *, 0, 1, -, ≤)` on `Real` itself, free via the subject-local
Mathlib bridge. -/
example : LRA.AlgebraicStructures.LinearlyOrderedRingLaws Real := inferInstance

end LRA.AlgebraicStructures.LinearlyOrderedRing.Examples
