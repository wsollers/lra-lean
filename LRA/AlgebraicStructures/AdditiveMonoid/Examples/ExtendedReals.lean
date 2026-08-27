import Mathlib.Data.ENNReal.Basic
import LRA.AlgebraicStructures.AdditiveMonoid.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.AdditiveMonoid.Examples

/-- `([0, ∞], +, 0)` — Mathlib's own `ENNReal` (`ℝ≥0∞`) type, where
`x + ∞ = ∞ + x = ∞` holds by construction. Free via the generic Mathlib
bridge: `ENNReal` is an `AddCommMonoid`. -/
example : LRA.AlgebraicStructures.AdditiveMonoidLaws ENNReal := inferInstance

end LRA.AlgebraicStructures.AdditiveMonoid.Examples
