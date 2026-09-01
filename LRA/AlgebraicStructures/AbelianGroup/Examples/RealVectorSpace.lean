import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.AbelianGroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.AbelianGroup.Examples

/-- `(ℝ^n, +, 0, -)` modelled as `Fin n → Real`, free via Mathlib's additive Pi instances. -/
example (n : Nat) : LRA.AlgebraicStructures.AbelianGroupLaws (Fin n → Real) :=
  inferInstance

end LRA.AlgebraicStructures.AbelianGroup.Examples
