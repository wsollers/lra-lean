import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.OrderedRing.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.OrderedRing.Examples

/-- `(ℝ, +, *, 0, 1, -, ≤)` on `Real` itself, free via the subject-local
Mathlib bridge. -/
example : LRA.AlgebraicStructures.OrderedRingLaws Real := inferInstance

end LRA.AlgebraicStructures.OrderedRing.Examples
