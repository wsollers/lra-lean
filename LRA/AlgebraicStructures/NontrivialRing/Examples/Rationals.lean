import Mathlib.Algebra.Field.Rat
import LRA.AlgebraicStructures.NontrivialRing.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.NontrivialRing.Examples

/-- `(ℚ, +, *, 0, 1, -)` on `Rat` itself, included as a standard nontrivial ring
example. Free via the subject-local Mathlib bridge. -/
example : LRA.AlgebraicStructures.NontrivialRingLaws Rat := inferInstance

end LRA.AlgebraicStructures.NontrivialRing.Examples
