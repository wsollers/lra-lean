import Mathlib.Data.NNReal.Defs
import LRA.AlgebraicStructures.AdditiveMonoid.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.AdditiveMonoid.Examples

/-- `(ℝ_{≥0}, +, 0)` — Mathlib's own `NNReal` (`ℝ≥0`) type, free via the
generic Mathlib bridge: it's a `CanonicallyLinearOrderedAddCommMonoid`, hence
an `AddMonoid`. -/
example : LRA.AlgebraicStructures.AdditiveMonoidLaws NNReal := inferInstance

end LRA.AlgebraicStructures.AdditiveMonoid.Examples
