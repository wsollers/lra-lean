import Mathlib.Data.ENNReal.Basic
import LRA.AlgebraicStructures.CommutativeSemiring.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.CommutativeSemiring.Examples

/-- `ℝ≥0∞` as a commutative semiring, free via Mathlib's native
`CommSemiring` instance. -/
example : LRA.AlgebraicStructures.CommutativeSemiringLaws ENNReal := inferInstance

end LRA.AlgebraicStructures.CommutativeSemiring.Examples
