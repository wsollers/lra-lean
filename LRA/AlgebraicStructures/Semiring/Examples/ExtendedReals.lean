import Mathlib.Data.ENNReal.Basic
import LRA.AlgebraicStructures.Semiring.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.Semiring.Examples

/-- `ℝ≥0∞` as a semiring, free via Mathlib's native `Semiring` instance. -/
example : LRA.AlgebraicStructures.SemiringLaws ENNReal := inferInstance

end LRA.AlgebraicStructures.Semiring.Examples
