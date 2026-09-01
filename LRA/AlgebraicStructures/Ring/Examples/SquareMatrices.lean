import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.Ring.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.Ring.Examples

/-- `(M_n(ℝ), +, *, 0, 1, -)` on square matrices, included as a standard
noncommutative ring example. Free via the subject-local Mathlib bridge. -/
example (n : Nat) : LRA.AlgebraicStructures.RingLaws (Matrix (Fin n) (Fin n) Real) := inferInstance

end LRA.AlgebraicStructures.Ring.Examples
