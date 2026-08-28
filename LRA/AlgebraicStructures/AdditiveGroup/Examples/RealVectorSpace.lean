import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.AdditiveGroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.AdditiveGroup.Examples

/-- `(ℝⁿ, +, 0, -)` — componentwise vector addition, modelled as `Fin n → ℝ`.
Free via the generic Mathlib bridge: any `Fin n → ℝ` is an `AddGroup`
generically via the `Pi` instances, since `ℝ` itself is one — no dedicated
vector-space machinery needed just for the additive-group structure. -/
example (n : Nat) : LRA.AlgebraicStructures.AdditiveGroupLaws (Fin n → Real) :=
  inferInstance

end LRA.AlgebraicStructures.AdditiveGroup.Examples
