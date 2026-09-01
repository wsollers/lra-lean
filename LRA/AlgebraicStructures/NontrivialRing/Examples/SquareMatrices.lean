import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.NontrivialRing.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.NontrivialRing.Examples

/-- `(M_(n+1)(ℝ), +, *, 0, 1, -)` on nonempty square matrices, included as a
standard noncommutative nontrivial ring example. Free via the subject-local Mathlib
bridge. -/
example (n : Nat) :
    LRA.AlgebraicStructures.NontrivialRingLaws
      (Matrix (Fin (n + 1)) (Fin (n + 1)) Real) := inferInstance

end LRA.AlgebraicStructures.NontrivialRing.Examples
