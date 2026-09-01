import Mathlib.Algebra.Ring.Int.Defs
import LRA.AlgebraicStructures.NontrivialRing.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.NontrivialRing.Examples

/-- `(ℤ, +, *, 0, 1, -)` on `Int` itself, included as a standard nontrivial ring
example. Free via the subject-local Mathlib bridge. -/
example : LRA.AlgebraicStructures.NontrivialRingLaws Int := inferInstance

end LRA.AlgebraicStructures.NontrivialRing.Examples
