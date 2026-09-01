import Mathlib.Algebra.Quaternion
import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.DivisionRing.Constructions.Mathlib.Laws

open scoped Quaternion

namespace LRA.AlgebraicStructures.DivisionRing.Examples

/-- `ℍ[Real]` gives a noncommutative division-ring example through Mathlib's
quaternion instance, without adding a wrapper carrier. -/
example : LRA.AlgebraicStructures.DivisionRingLaws ℍ[Real] := inferInstance

end LRA.AlgebraicStructures.DivisionRing.Examples
