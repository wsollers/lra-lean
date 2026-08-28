import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.Group.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.Group.Examples

/-- `(GL_n(ℝ), ×)` — Mathlib's own `GL (Fin n) ℝ` (`:= (Matrix (Fin n) (Fin n)
ℝ)ˣ`, the units of the matrix ring), free via the generic Mathlib bridge:
units of any monoid form a group generically, no extra work needed.
Non-abelian for `n ≥ 2`, per the user's own note. -/
example (n : Nat) :
    LRA.AlgebraicStructures.GroupLaws (Matrix.GeneralLinearGroup (Fin n) Real) :=
  inferInstance

end LRA.AlgebraicStructures.Group.Examples
