import Mathlib.Data.ENNReal.Basic
import LRA.AlgebraicStructures.OrderedSemiring.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.OrderedSemiring.Examples

/-- `ℝ≥0∞` as an ordered semiring, free via Mathlib's native ordered-semiring
instances. -/
example : LRA.AlgebraicStructures.OrderedSemiringLaws ENNReal := inferInstance

end LRA.AlgebraicStructures.OrderedSemiring.Examples
